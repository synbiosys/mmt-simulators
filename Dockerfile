FROM ubuntu:focal AS lammps

RUN apt update && apt install -y software-properties-common 
RUN add-apt-repository ppa:gladky-anton/lammps
RUN add-apt-repository ppa:openkim/latest

RUN apt update && apt install -y lammps-stable

ENTRYPOINT [ "lmp_stable" ]

CMD [ "-help" ]