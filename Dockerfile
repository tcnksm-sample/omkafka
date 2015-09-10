FROM buildpack-deps:jessie

RUN apt-get update && apt-get install -y \
              git \
              libtool \
              libz-dev \
              libjson0-dev \
              libgcrypt-dev \
              libestr-dev \
              flex \
              bison \
              python-docutils \
         && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/edenhill/librdkafka /tmp/librdkafka
RUN cd /tmp/librdkafka && ./configure --libdir=/usr/lib \
                                      --includedir=/usr/include \
                       && make \
                       && make install

RUN git clone https://github.com/rsyslog/rsyslog /tmp/rsyslog
RUN cd /tmp/rsyslog && git checkout -b v8.11.0 refs/tags/v8.11.0 \
                    && ./autogen.sh --enable-omkafka \
                                 --disable-uuid \
                                 --disable-liblogging_stdlog \
                                 --disable-generate-man-pages \
                                 --prefix=/usr \
                    && make \
                    && make install


ADD etc/rsyslog.conf /etc/rsyslog.conf
ADD etc/rsyslog.d/00-omkafka.conf /etc/rsyslog.d/00-omkafka.conf
