FROM bash:latest
COPY ./mini-matrix.sh /usr/local/bin/mini-matrix
LABEL maintainer="skwal.net@gmail.com"
CMD ["bash"]