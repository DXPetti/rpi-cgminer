FROM resin/rpi-raspbian
RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential autoconf automake libtool pkg-config libcurl3-dev libudev-dev libncurses5-dev screen
RUN apt-get -y install wget
WORKDIR /cgminer
RUN wget http://ck.kolivas.org/apps/cgminer/4.9/cgminer-4.9.2.tar.bz2

RUN tar -xvjpf cgminer-4.9.2.tar.bz2

WORKDIR /cgminer/cgminer-4.9.2
RUN ./configure --enable-bitfury

RUN apt-get -y install make
RUN apt-get -y install curl


RUN make

ENV USER 1Kv1KXS15Ci9qVEWdfZcumhWLW1kpqbuJe
ENV PASS x
ENV URL stratum+tcp://solo.ckpool.org:3333


ENTRYPOINT ["bash"]

ADD ./run.sh ./run.sh

RUN chmod +x ./run.sh

CMD ["/cgminer/cgminer-4.9.2/run.sh"]
