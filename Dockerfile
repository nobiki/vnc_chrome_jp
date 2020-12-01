FROM selenoid/vnc_chrome:87.0

USER root

RUN apt-get update \
 && apt-get install -y locales tzdata fonts-ipafont-gothic language-pack-ja-base language-pack-ja \
 && apt clean && apt autoclean \
 && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
RUN locale-gen ja_JP.UTF-8 \
 && localedef -f UTF-8 -i ja_JP ja_JP.utf8

USER selenium

RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc \
 && echo "export LANGUAGE='ja_JP:ja'" >> ~/.bashrc
