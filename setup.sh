#!/bin/bash


# mongodb
mkdir -p ./mongodb

# redis
mkdir -p ./redis

# c0band
git clone https://github.com/c0ban/c0ban.git

# indexd
git clone https://github.com/c0banparty/indexd-server.git
cd ./indexd-server
cp ./.env-example .env
git submodule update -i
cd ..

# c0banparty
mkdir -p ./counterparty
cp ./c0banparty.Dockerfile ./counterparty/Dockerfile
cd ./counterparty
git clone https://github.com/c0banparty/counterparty-lib.git
git clone https://github.com/c0banparty/counterparty-cli.git
cd ..

# counterblock
git clone https://github.com/c0banparty/counterblock.git

# counterwallet
git clone https://github.com/c0banparty/counterwallet.git
cd ./counterwallet
git submodule update -i


### lunch c0ban party
docker-compose build
# docker-compose up -d counterwallet


### setup

## c0band

# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 301
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test listunspent
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test sendtoaddress mznbiNhyA1Ax9LM9vWUMsxRCFF2XE9ij4S 10000
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 1

## c0banparty

# cd ./counterparty-cli
# python3 create_send.py mfbzPRnDfW8UwFdy5zQyaKKp6od1z8dWxj

## c0band
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 1

## c0banparty

# cd ./counterparty-cli
# python3 create_send.py mfbzPRnDfW8UwFdy5zQyaKKp6od1z8dWxj

## c0band
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 1
