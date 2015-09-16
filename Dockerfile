FROM vungle/heka
MAINTAINER Felix Rodriguez <felix.rodriguez@vungle.com>
RUN echo "hello"
COPY conf.toml /etc/heka/
