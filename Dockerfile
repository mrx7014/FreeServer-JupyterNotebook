FROM ubuntu:24.04

USER root
RUN apt-get update && apt-get install -y graphviz && df -h && free -h
