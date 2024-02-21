#!/bin/sh

VPC=k8s-vpc
SUBNET=k8s-subnet
SUBNET_CIDR=10.240.0.0/24
INTERNAL_FIREWALL_RULE=k8s-internal-firewall-rule
EXTERNAL_FIREWALL_RULE=k8s-external-firewall-rule
CONTROLLER=controller
CONTROLLER_IP=10.240.0.11

# Create VPC
gcloud compute networks create $VPC --subnet-mode custom

# Create subnet
gcloud compute networks subnets create $SUBNET \
	--network $VPC \
	--range $SUBNET_CIDR \
    --region asia-east1

# Create firewall rule
gcloud compute firewall-rules create $INTERNAL_FIREWALL_RULE --direction=INGRESS --priority=65533 --network=k8s-vpc --action=ALLOW --rules=all --source-ranges=10.240.0.0/24

gcloud compute firewall-rules create $EXTERNAL_FIREWALL_RULE --direction=INGRESS --priority=65534 --network=k8s-vpc --action=ALLOW --rules=tcp:22,icmp --source-ranges=118.163.16.148

# Create Controller
	gcloud compute instances create $CONTROLLER \
  --async \
  --boot-disk-size 30GB \
  --can-ip-forward \
  --image-family ubuntu-2204-lts \
  --image-project ubuntu-os-cloud \
  --machine-type e2-medium \
  --private-network-ip $CONTROLLER_IP \
  --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
  --subnet $SUBNET \
  --zone asia-east1-b \
  --tags k8s-vpc,controller \
    --metadata=startup-script='#!/bin/bash

apt-get update
apt-get remove vim vim-runtime vim-tiny vim-common vim-scripts vim-doc -y
apt-get install vim -y

NEW_USER=adlerhu
useradd -m $NEW_USER
chsh -s /bin/bash $NEW_USER
usermod -aG sudo $NEW_USER
mkdir /home/$NEW_USER/.ssh/
touch /home/$NEW_USER/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCja3gkvbfRMZU1zb+2yQjsu07vXVu7pk4zRYF22qThI690IWajBNLDT3NJTCAtfHPVvUIue1Byl0zIyNxxYj0rRIHtMbY5maG8u0ykxfiY/UxWp1gPOPKhatoLOd53aKUEQZ+aqKkt35go0ktULLiP/L6bt5TUiyxdD7PL6OF/OGzNULIwuQwVuX5VyC6LWMovdOCL0fF1wSDaGne7kGiGj5Cvlk/rvXpMZKyhaxnp2xkwIqjmPjK9HO4JuJXJHyuVhckqOP8UlHMJ7CuQhtTY2aWyKCh/Slan6/LR9MXmHH1FkXBAFb4xzXM6E7vPvMI8dIJVzKqiPBW30FsGDTOtbgixD5kn/s3KBigQT5mIqU5GX/rbKUcakYhhnX88L8hiYMuJbVJ/QFs04/cAxeKCwbYs346qCmKPfwqNewpJrjkfvOkscmU2OS1U9vhzVgw5PgdECvE3SQmatIIvGj1U2N8ppno0pjbd37Vz70niK3HrQ1cspIOQf5JB0Imfw5U= adlerhu " >> /home/$NEW_USER/.ssh/authorized_keys
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/

touch /etc/sudoers.d/$NEW_USER
chmod 440 /etc/sudoers.d/$NEW_USER
echo "$NEW_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$NEW_USER

userdel ubuntu
rm -rf /home/ubuntu'

# Create 2 workers
for i in 0 1; do
    gcloud compute instances create worker${i} \
        --async \
        --boot-disk-size 30GB \
        --can-ip-forward \
        --image-family ubuntu-2204-lts \
        --image-project ubuntu-os-cloud \
        --machine-type e2-medium \
        --private-network-ip 10.240.0.2${i} \
        --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
        --subnet $SUBNET \
        --zone asia-east1-a \
        --tags k8s-vpc,worker \
            --metadata=startup-script='#!/bin/bash

        apt-get update
        apt-get remove vim vim-runtime vim-tiny vim-common vim-scripts vim-doc -y
        apt-get install vim -y

        NEW_USER=adlerhu
        useradd -m $NEW_USER
        chsh -s /bin/bash $NEW_USER
        usermod -aG sudo $NEW_USER
        mkdir /home/$NEW_USER/.ssh/
        touch /home/$NEW_USER/.ssh/authorized_keys
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCja3gkvbfRMZU1zb+2yQjsu07vXVu7pk4zRYF22qThI690IWajBNLDT3NJTCAtfHPVvUIue1Byl0zIyNxxYj0rRIHtMbY5maG8u0ykxfiY/UxWp1gPOPKhatoLOd53aKUEQZ+aqKkt35go0ktULLiP/L6bt5TUiyxdD7PL6OF/OGzNULIwuQwVuX5VyC6LWMovdOCL0fF1wSDaGne7kGiGj5Cvlk/rvXpMZKyhaxnp2xkwIqjmPjK9HO4JuJXJHyuVhckqOP8UlHMJ7CuQhtTY2aWyKCh/Slan6/LR9MXmHH1FkXBAFb4xzXM6E7vPvMI8dIJVzKqiPBW30FsGDTOtbgixD5kn/s3KBigQT5mIqU5GX/rbKUcakYhhnX88L8hiYMuJbVJ/QFs04/cAxeKCwbYs346qCmKPfwqNewpJrjkfvOkscmU2OS1U9vhzVgw5PgdECvE3SQmatIIvGj1U2N8ppno0pjbd37Vz70niK3HrQ1cspIOQf5JB0Imfw5U= adlerhu " >> /home/$NEW_USER/.ssh/authorized_keys
        chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/

        touch /etc/sudoers.d/$NEW_USER
        chmod 440 /etc/sudoers.d/$NEW_USER
        echo "$NEW_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$NEW_USER

        userdel ubuntu
        rm -rf /home/ubuntu'
done
