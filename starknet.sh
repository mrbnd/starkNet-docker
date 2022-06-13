#!/bin/bash
export ALCHEMY_KEY=https://eth-goerli.alchemyapi.io/v2/4Btf0jZIQOsebzGbsQ097Rysc4UqJBvk

echo "-----------------------------------------------------------------------------"
if [ ! $ALCHEMY_KEY ]; then
	read -p "Введите ваш HTTP (ПРИМЕР: https://eth-goerli.alchemyapi.io/v2/xZXxxxxxxxxxxc2q_bzxxxxxxxxxxWTN): " ALCHEMY_KEY
fi
echo 'Ваш ключ: ' $ALCHEMY_KEY
sleep 1
echo 'export ALCHEMY_KEY='$ALCHEMY_KEY >> $HOME/.bash_profile

sudo apt update -y &>/dev/null
sudo apt install git docker docker-compose -y &>/dev/null
rm -rf starkNet-docker
git clone https://github.com/mrbnd/starkNet-docker  &>/dev/null
docker swarm init --advertise-addr 127.0.0.1 &>/dev/null
docker stack deploy --compose-file="$HOME/starkNet-docker/docker-compose.yml" stack
