FROM alpine:latest

RUN apk update && \
    apk add --no-cache \
    zip \
    bash \
    curl \
    tar \
    msmtp \
    ca-certificates \
    file

# msmtp configin ve gondermekuchun scripti image copy
COPY .msmtprc /root/.msmtprc
COPY script.sh ./script.sh

# run elemek uchun +x
RUN chmod +x ./script.sh

# container qefil exited elememi uchun cmd
CMD ["/bin/sh"]

