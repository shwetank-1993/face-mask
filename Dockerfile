FROM ubuntu

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get install -y python
RUN apt-get install -y git
RUN apt-get install -y pip
RUN git clone https://github.com/shwetank-1993/face-mask.git

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
WORKDIR /face-mask
