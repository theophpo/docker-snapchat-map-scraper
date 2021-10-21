FROM alpine:3.13.6

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir app/
WORKDIR app/

RUN apk add git \
	python3 \
	py3-pip

RUN apk update \
	&& python3 -m pip install --upgrade pip

RUN git clone https://github.com/theophpo/snapchat-map-scraper.git

RUN cd snapchat-map-scraper \
	&& python3 -m venv env \
	&& source env/bin/activate \
	&& pip3 install -r requirements.txt \
	&& python3 story_downloader.py create snap.db
