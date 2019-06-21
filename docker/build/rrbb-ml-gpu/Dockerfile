FROM nvidia/cuda:9.0-base
LABEL maintainer="gutssoul1@gmail.com"
ADD ./requirements.txt /

ENV LANG='C.UTF-8' LANGUAGE='C.UTF-8' LC_ALL='C.UTF-8'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-utils curl
RUN apt-get install -y locales
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y python3.6
RUN apt-get install -y python3.6-dev
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN cp /usr/bin/python3.6 /usr/bin/python3
RUN python3 get-pip.py
RUN apt-get install -y build-essential

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN pip3 install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip3 install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp36-cp36m-linux_x86_64.whl

CMD sleep 10800s
