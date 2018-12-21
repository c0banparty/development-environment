FROM counterparty/base

# Install counterparty-lib
COPY ./counterparty-lib /counterparty-lib
WORKDIR /counterparty-lib
RUN pip3 install git+https://github.com/petertodd/python-bitcoinlib.git@98676f981bf14a6a3a8313e762161cc289043b58#egg=python-bitcoinlib-0.8.1
RUN pip3 install git+https://github.com/monaparty/python-altcoinlib@abb1e38#egg=python-altcoinlib-0.4.1
RUN pip3 install -r requirements.txt
RUN python3 setup.py develop
RUN python3 setup.py install_apsw
RUN pip3 freeze
RUN apt-get install sqlite3

# Install counterparty-cli
COPY ./counterparty-cli /counterparty-cli
WORKDIR /counterparty-cli
RUN pip3 install -r requirements.txt
RUN python3 setup.py develop
RUN pip3 freeze

# Additional setup
COPY ./counterparty-lib/docker/server.conf /root/.config/counterparty/server.conf
COPY ./counterparty-lib/docker/start.sh /usr/local/bin/start.sh
RUN chmod a+x /usr/local/bin/start.sh
WORKDIR /

CMD ["/sbin/init"]
