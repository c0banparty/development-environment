# development-environment

## How to setup development environment

### Setup Source

```
$ git clone https://github.com/c0banparty/development-environment.git development
$ cd development
$ ./setup.sh
```

### Build

```
$ docker-compose build
```

### Run

```
$ docker-compose up -d counterwallet
```

### Setup initial data

#### create init message data

At first, we have to create 2 message data for counterwallet.

c0band
```
$ docker exec -it c0ban /bin/bash
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 301

You have to get owner's address for c0ban by listunspent
Send c0ban to the address.

# c0ban-cli -regtest -rpcuser=test -rpcpassword=test listunspent

We get "mznbiNhyA1Ax9LM9vWUMsxRCFF2XE9ij4S" in this example.

# c0ban-cli -regtest -rpcuser=test -rpcpassword=test sendtoaddress mznbiNhyA1Ax9LM9vWUMsxRCFF2XE9ij4S 10000
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 1
```

counterparty-server
```
$ docker exec -it counterparty-server /bin/bash
# cd ./counterparty-cli
# python3 create_send.py mznbiNhyA1Ax9LM9vWUMsxRCFF2XE9ij4S
```

c0band
```
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 1
```

counterparty-server
```
# python3 create_send.py mznbiNhyA1Ax9LM9vWUMsxRCFF2XE9ij4S
```

c0band
```
# c0ban-cli -regtest -rpcuser=test -rpcpassword=test generate 1
```

### Access to Counterwallet-c0ban

https://localhost:28443/?regtest=1

### Test

1. Run c0banparty in regtest mode.
https://github.com/c0banparty/development-environment#how-to-setup-development-environment

2. Generate 300 blocks in c0band to change PoW Algorithm to lyra2rc0ban

3. Clone test source
```
git clone https://github.com/c0banparty/c0banparty-test.git
```

4. Run docker container & test
```
docker-compose run c0banparty-test bash
$ npm test
```
