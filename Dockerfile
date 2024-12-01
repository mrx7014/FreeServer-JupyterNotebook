FROM almondsh/almond:latest

USER root
RUN apt-get update && apt-get install -y graphviz && df -h && free -h
