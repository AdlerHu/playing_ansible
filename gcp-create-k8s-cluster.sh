#!/bin/sh

VPC_NAME=k8s-vpc
SUBNET_NAME=k8s-subnet
SUBNET_CIDR=10.240.0.0/24
INTERNAL_FIREWALL_RULE=k8s-internal-firewall-rule
EXTERNAL_FIREWALL_RULE=k8s-external-firewall-rule
CONTROLLER_HOSTNAME=controller
NODE_HOSTNAME=node
CONTROLLER_IP=10.240.0.11
REGION=asia-east1
OFFICE_IP=118.163.16.148
CONTROLLER_ZONE=asia-east1-b
NODE_ZONE=asia-east1-a

# Create VPC
gcloud compute networks create $VPC_NAME --subnet-mode custom

# Create subnet
gcloud compute networks subnets create $SUBNET_NAME \
	--network $VPC_NAME \
	--range $SUBNET_CIDR \
    --region $REGION

# Create firewall rule
gcloud compute firewall-rules create $INTERNAL_FIREWALL_RULE --direction=INGRESS --priority=65533 --network=$VPC_NAME --action=ALLOW --rules=all --source-ranges=$SUBNET_CIDR

gcloud compute firewall-rules create $EXTERNAL_FIREWALL_RULE --direction=INGRESS --priority=65534 --network=$VPC_NAME --action=ALLOW --rules=tcp:22,icmp --source-ranges=$OFFICE_IP

# Create Controller
gcloud compute instances create $CONTROLLER_HOSTNAME \
  --async \
  --boot-disk-size 30GB \
  --can-ip-forward \
  --image-family ubuntu-2204-lts \
  --image-project ubuntu-os-cloud \
  --machine-type e2-medium \
  --private-network-ip $CONTROLLER_IP \
  --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
  --subnet $SUBNET_NAME \
  --zone $CONTROLLER_ZONE \
  --tags $VPC_NAME,$CONTROLLER_HOSTNAME \
  --metadata=startup-script='#!/bin/bash

apt-get update
apt-get remove vim vim-runtime vim-tiny vim-common vim-scripts vim-doc -y
apt-get install vim -y

apt update
apt install -y docker.io
systemctl enable docker.service
apt install -y apt-transport-https curl

NEW_USER=adlerhu
useradd -m $NEW_USER
chsh -s /bin/bash $NEW_USER
usermod -aG sudo $NEW_USER
mkdir /home/$NEW_USER/.ssh/
touch /home/$NEW_USER/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCja3gkvbfRMZU1zb+2yQjsu07vXVu7pk4zRYF22qThI690IWajBNLDT3NJTCAtfHPVvUIue1Byl0zIyNxxYj0rRIHtMbY5maG8u0ykxfiY/UxWp1gPOPKhatoLOd53aKUEQZ+aqKkt35go0ktULLiP/L6bt5TUiyxdD7PL6OF/OGzNULIwuQwVuX5VyC6LWMovdOCL0fF1wSDaGne7kGiGj5Cvlk/rvXpMZKyhaxnp2xkwIqjmPjK9HO4JuJXJHyuVhckqOP8UlHMJ7CuQhtTY2aWyKCh/Slan6/LR9MXmHH1FkXBAFb4xzXM6E7vPvMI8dIJVzKqiPBW30FsGDTOtbgixD5kn/s3KBigQT5mIqU5GX/rbKUcakYhhnX88L8hiYMuJbVJ/QFs04/cAxeKCwbYs346qCmKPfwqNewpJrjkfvOkscmU2OS1U9vhzVgw5PgdECvE3SQmatIIvGj1U2N8ppno0pjbd37Vz70niK3HrQ1cspIOQf5JB0Imfw5U= adlerhu " >> /home/$NEW_USER/.ssh/authorized_keys
echo "
10.240.0.11 controller
10.240.0.20 node0
10.240.0.21 node1" >> /etc/hosts
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/

touch /etc/sudoers.d/$NEW_USER
chmod 440 /etc/sudoers.d/$NEW_USER
echo "$NEW_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$NEW_USER

usermod -aG docker $NEW_USER

userdel ubuntu
rm -rf /home/ubuntu

apt-get install -y apt-transport-https ca-certificates curl

curl -fsSL https://dl.k8s.io/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
	
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee   /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

swapoff -a'

# Create 2 workers
for i in 0 1; do
    gcloud compute instances create $NODE_HOSTNAME${i} \
        --async \
        --boot-disk-size 30GB \
        --can-ip-forward \
        --image-family ubuntu-2204-lts \
        --image-project ubuntu-os-cloud \
        --machine-type e2-medium \
        --private-network-ip 10.240.0.2${i} \
        --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
        --subnet $SUBNET_NAME \
        --zone $NODE_ZONE \
        --tags $VPC_NAME,$NODE_HOSTNAME \
        --metadata=startup-script='#!/bin/bash

        apt-get update
        apt-get remove vim vim-runtime vim-tiny vim-common vim-scripts vim-doc -y
        apt-get install vim -y

    	apt update
	    apt install -y docker.io
	    systemctl enable docker.service
	    apt install -y apt-transport-https curl

        NEW_USER=adlerhu
        useradd -m $NEW_USER
        chsh -s /bin/bash $NEW_USER
        usermod -aG sudo $NEW_USER
        mkdir /home/$NEW_USER/.ssh/
        touch /home/$NEW_USER/.ssh/authorized_keys
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCja3gkvbfRMZU1zb+2yQjsu07vXVu7pk4zRYF22qThI690IWajBNLDT3NJTCAtfHPVvUIue1Byl0zIyNxxYj0rRIHtMbY5maG8u0ykxfiY/UxWp1gPOPKhatoLOd53aKUEQZ+aqKkt35go0ktULLiP/L6bt5TUiyxdD7PL6OF/OGzNULIwuQwVuX5VyC6LWMovdOCL0fF1wSDaGne7kGiGj5Cvlk/rvXpMZKyhaxnp2xkwIqjmPjK9HO4JuJXJHyuVhckqOP8UlHMJ7CuQhtTY2aWyKCh/Slan6/LR9MXmHH1FkXBAFb4xzXM6E7vPvMI8dIJVzKqiPBW30FsGDTOtbgixD5kn/s3KBigQT5mIqU5GX/rbKUcakYhhnX88L8hiYMuJbVJ/QFs04/cAxeKCwbYs346qCmKPfwqNewpJrjkfvOkscmU2OS1U9vhzVgw5PgdECvE3SQmatIIvGj1U2N8ppno0pjbd37Vz70niK3HrQ1cspIOQf5JB0Imfw5U= adlerhu " >> /home/$NEW_USER/.ssh/authorized_keys
        echo "
        10.240.0.11 controller
        10.240.0.20 node0
        10.240.0.21 node1" >> /etc/hosts
        
        chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/

        touch /etc/sudoers.d/$NEW_USER
        chmod 440 /etc/sudoers.d/$NEW_USER
        echo "$NEW_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$NEW_USER

        usermod -aG docker $NEW_USER

        userdel ubuntu
        rm -rf /home/ubuntu
        
        apt-get install -y apt-transport-https ca-certificates curl

        curl -fsSL https://dl.k8s.io/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
	
	    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee   /etc/apt/sources.list.d/kubernetes.list

	    apt-get update
        apt-get install -y kubelet kubeadm kubectl
        apt-mark hold kubelet kubeadm kubectl

        swapoff -a'
done
