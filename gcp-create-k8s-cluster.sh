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
  --address controller-public-ip \
  --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
  --subnet $SUBNET_NAME \
  --zone $CONTROLLER_ZONE \
  --tags $VPC_NAME,$CONTROLLER_HOSTNAME \
  --metadata=startup-script='#!/bin/bash

apt-get update
apt-get remove vim vim-runtime vim-tiny vim-common vim-scripts vim-doc -y
apt-get install vim -y

apt update
apt install -y apt-transport-https curl

NEW_USER=adlerhu
useradd -m $NEW_USER
chsh -s /bin/bash $NEW_USER
usermod -aG sudo $NEW_USER
mkdir /home/$NEW_USER/.ssh/
touch /home/$NEW_USER/.ssh/authorized_keys
echo "
10.240.0.11 controller
10.240.0.20 node0
10.240.0.21 node1" >> /etc/hosts
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/

touch /etc/sudoers.d/$NEW_USER
chmod 440 /etc/sudoers.d/$NEW_USER
echo "$NEW_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$NEW_USER

userdel ubuntu
rm -rf /home/ubuntu'

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
        --address node${i}-public-ip \
        --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
        --subnet $SUBNET_NAME \
        --zone $NODE_ZONE \
        --tags $VPC_NAME,$NODE_HOSTNAME \
        --metadata=startup-script='#!/bin/bash

        apt-get update
        apt-get remove vim vim-runtime vim-tiny vim-common vim-scripts vim-doc -y
        apt-get install vim -y

    	apt update
	    apt install -y apt-transport-https curl

        NEW_USER=adlerhu
        useradd -m $NEW_USER
        chsh -s /bin/bash $NEW_USER
        usermod -aG sudo $NEW_USER
        mkdir /home/$NEW_USER/.ssh/
        touch /home/$NEW_USER/.ssh/authorized_keys
        echo "
10.240.0.11 controller
10.240.0.20 node0
10.240.0.21 node1" >> /etc/hosts
        
        chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/

        touch /etc/sudoers.d/$NEW_USER
        chmod 440 /etc/sudoers.d/$NEW_USER
        echo "$NEW_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$NEW_USER

        userdel ubuntu
        rm -rf /home/ubuntu'
done
