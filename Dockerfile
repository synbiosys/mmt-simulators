FROM ubuntu:focal AS lammps

RUN apt update
RUN apt install -y software-properties-common 
RUN sudo add-apt-repository ppa:gladky-anton/lammps
RUN sudo add-apt-repository ppa:openkim/latest

RUN sudo apt update

RUN sudo apt install -y lammps-stable

ENTRYPOINT [ "lmp_stable" ]

CMD [ "-help" ]