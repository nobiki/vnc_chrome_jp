FROM selenoid/vnc_chrome:87.0

USER root

RUN apt-get update \
 && apt-get install -y locales tzdata fonts-ipafont-gothic language-pack-ja-base language-pack-ja \
 && locale-gen ja_JP.UTF-8 \
 && apt clean && apt autoclean \
 && rm -rf /var/lib/apt/lists/*

USER selenium

RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc \
 && echo "export LANGUAGE='ja_JP:ja'" >> ~/.bashrc
