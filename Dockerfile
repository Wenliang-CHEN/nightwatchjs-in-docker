FROM ubuntu:16.04

RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get -y --no-install-recommends install \
apt-utils \
git \
default-jdk \
wget \
curl \
gconf-service \
fonts-liberation \
xdg-utils \
libxss1 \
libappindicator1 \ 
libindicator7 \
libgtk-3-0 \
unzip

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y install nodejs
RUN npm install -g nightwatch

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb

WORKDIR /app

ADD . /app

RUN wget http://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.0.jar -P tests/selenium

RUN wget https://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip -P tests/drivers -O temp.zip \
&& unzip temp.zip \
&& rm temp.zip

CMD nightwatch tests
