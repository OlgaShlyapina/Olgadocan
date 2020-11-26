FROM ubuntu:18.04

ARG UserVM=udflaskex

RUN useradd -m ${UserVM} && \
    apt-get update -yq && \
    apt-get install -yq python3-pip git && \
    apt-get clean
    
USER ${UserVM}

WORKDIR /home/${UserVM}

RUN git clone https://github.com/anfederico/Flaskex &&\
    cd Flaskex && \
    pip3 install -r requirements.txt
    
CMD  cd Flaskex && python3 app.py

EXPOSE 5000
