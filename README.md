# Face Mask Detection
The Face Mask Detection System can be used anywhere to detect if an individual is maintaining safety standards.
## Frame work used:
1. TensorFlow
2. OpenCV
3. ResNet caffe based model
## Pre-requisite
* TensorFlow 
* Keras
* Numpy
* OpenCV
* Matplotlib
* Scipy
* Scikit-learn
* Pillow
## Installation
Clone the repository\
``$ git clone https://github.com/shwetank-1993/face-mask.git`` \
Change the directory, go to the cloned directory: \
`$ cd face-mask` \
Create virtual environment for python \
`$ virtualenv face_mask` \
`$ source face_mask/bin/activate` \
To install all the libraries, use this command: \
`$ pip3 install -r requirements.txt` 
## Working
Detect face mask in real-time, use this command: \
`$ python3 detect_mask_video.py`
## Docker
**FOR UBUNTU OS** \
You can either create a docker image as shown below or you can pull the docker image. \
*Dockerfile.txt* which looks like: \
`FROM ubuntu` \
`RUN apt-get update -y && apt-get upgrade -y` \
`RUN apt-get install ffmpeg libsm6 libxext6  -y` \
`RUN apt-get install -y python` \
`RUN apt-get install -y git` \
`RUN apt-get install -y pip` \
`RUN git clone https://github.com/shwetank-1993/face-mask.git`\
`COPY requirements.txt /tmp/` \
`RUN pip install --requirement /tmp/requirements.txt` \
`COPY . /tmp/` \
To run this Dockerfile, use this command: \
`$ docker build -f Dockerfile -t "<image name>" .`
Congratulation, you just created docker image from docker file. \

To pull the docker image from docker hub, type this command: \
`$ docker pull face_mask_detection` \
After creating docker image, type this command `$ xhost +local:root` allows the root user to access the running X server. The current X server is indicated by the **DISPLAY** environment variable. \
To run docker image (to create container), type this command: \
`$ docker run -it --rm --privileged=True --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --device="/dev/video0:/dev/video0" face-mask` \
`# cd face-mask` \
`# python3 detect_mask_video.py`\
where:
* `rm` means remove, this is used to remove the container once it gets stopped. \
* `env="DISPLAY"` means to set environment variable as DISPLAY. A display consists (simplified) of:
    - a keyboard,
    - a mouse
    - a screen
* `volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"` means the X11 server (usuall Xorg these days) communicates with clients like xterm, firefox, etc via some reliable stream of bytes. In simple words it will bind the volume between your host machine and docker machine.
*  `device="/dev/video0:/dev/video0"` helps in accessing the video device.
* `privileged = True` means docker will enable access to all devices on the host as well as set some configuration in AppArmor or SELinux to allow the container nearly all the same access to the host as processes running outside containers on the host.

## References 
1. https://docs.docker.com/engine/reference/run/
