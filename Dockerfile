FROM ubuntu:latest

# Ubuntu virtual machine with the basic setup
RUN apt update && apt upgrade -y
RUN apt install sudo aptitude curl net-tools wget tar man bind9 nginx nmap nikto lynis git -y
RUN apt-get install openssh-server -y

# Unminimize
RUN yes | unminimize

# Install chvt with apt install kbd after running the container