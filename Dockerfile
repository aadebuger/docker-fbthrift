#FROM  aadebuger/folly
#FROM ubuntu
from aadebuger/wangle
RUN apt-get update
RUN apt-get install -yq unzip
RUN apt-get install -yq git
RUN apt-get install -yq curl
RUN apt-get install -yq cmake build-essential
RUN apt-get install -yq \
    flex \
    bison \
    libkrb5-dev \
    libsasl2-dev \
    libnuma-dev \
    pkg-config \
    libssl-dev \
    libcap-dev \
    gperf \
    autoconf-archive \
    libevent-dev \
    libgoogle-glog-dev \
    wget
run apt-get -y install python-software-properties
WORKDIR /home
RUN git clone https://github.com/facebook/fbthrift.git
WORKDIR /home/fbthrift/thrift
#run sed -i 's/https:\/\/googlemock.googlecode.com\/files/\/home\/wangle\/wangle/g' CMakeLists.txt
#add gmock-1.7.0.zip /home/wangle/wangle

#run ls /home/wangle/wangle
#run cat /home/wangle/wangle/CMakeLists.txt
run bash ./build/deps_ubuntu_12.04.sh  
run autoreconf -if
run ./configure && make 
#run ctest
#run make install
