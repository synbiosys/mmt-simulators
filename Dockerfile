FROM ubuntu:focal AS lammps

RUN apt update && apt install -y software-properties-common 
RUN add-apt-repository ppa:gladky-anton/lammps
RUN add-apt-repository ppa:openkim/latest

RUN apt update && apt install -y lammps-stable

ENTRYPOINT [ "lmp_stable" ]

CMD [ "-help" ]

FROM ubuntu:focal AS codeaster

# Update apt-get
RUN apt-get update

# Install aster pre-requisites
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y gfortran
RUN apt-get install -y cmake
RUN apt-get install -y liblapack-dev
RUN apt-get install -y libblas-dev
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-numpy
RUN apt-get install -y libboost-python-dev
RUN apt-get install -y libboost-numpy-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y tk


RUN apt-get install -y wget
WORKDIR /home
RUN mkdir sims

# Download aster
RUN wget "https://www.code-aster.org/FICHIERS/aster-full-src-14.6.0-1.noarch.tar.gz"

# Extract
RUN tar -xzf aster-full-src-14.6.0-1.noarch.tar.gz
RUN rm -rf aster-full-src-14.6.0-1.noarch.tar.gz

# Navigate to aster directory and install aster
RUN cd aster-full-src-14.6.0 && \
    python3 setup.py install --prefix=/home/aster --noprompt

RUN rm -rf aster-full-src-14.6.0
	
# Source the profile
SHELL ["/bin/bash", "-c"]
RUN source /home/aster/etc/codeaster/profile.sh