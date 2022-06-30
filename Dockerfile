FROM ubuntu:focal AS lammps

RUN sudo add-apt-repository ppa:gladky-anton/lammps
RUN sudo add-apt-repository ppa:openkim/latest
RUN sudo apt-get update

RUN sudo apt-get install lammps-stable

ENTRYPOINT ['lmp_stable']

CMD ['-help']