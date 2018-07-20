#!/bin/bash

# Mount drives
# sudo lshw -C disk -o name,uuid
# sudo mkdir /media
#put "UUID=<> <mountpt>  ext4 defaults 0 2" >> /etc/fstab
# sudo mount -a

CWD=`pwd`

sudo mkdir /home/gharbi
sudo chown gharbi:gharbi /home/gharbi


cd /home/gharbi

wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
bash Anaconda3-5.1.0-Linux-x86_64.sh
conda install mkl-include
pip install --upgrade pip
pip install setproctitle
pip install ipdb
pip install visdom
pip install tqdm
pip install torchvision

# sudo apt-get update
# sudo apt-get install nvidia-375
# sudo apt-get install cmake

# wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.1.2/prod/9.1_20180316/Ubuntu16_04-x64/libcudnn7-dev_7.1.2.21-1+cuda9.1_amd64
# wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.1.2/prod/9.1_20180316/Ubuntu16_04-x64/libcudnn7_7.1.2.21-1+cuda9.1_amd64
# sudo dpkg -i libcudnn7_7.1.2.21-1+cuda9.1_amd64.deb
# sudo dpkg -i libcudnn-dev7_7.1.2.21-1+cuda9.1_amd64.deb
# sudo ldconfig

git clone https://github.com/pytorch/pytorch.git
cd pytorch
git submodule update --init
python setup.py install



cd $CWD
