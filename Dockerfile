FROM alpine:latest

# Prepar

RUN apk update && apk upgrade
RUN apk add curl unzip ncurses \
    file-dev imagemagick ffmpeg exiftool

# Install Pleroma

RUN curl 'https://git.pleroma.social/api/v4/projects/2/jobs/artifacts/stable/download?job=amd64-musl' -o /tmp/pleroma.zip
RUN unzip /tmp/pleroma.zip -d /tmp/

RUN mkdir -p /opt/pleroma && \
    mkdir -p /var/lib/pleroma/uploads && \
    mkdir -p /var/lib/pleroma/static && \
    mkdir -p /etc/pleroma

RUN mv /tmp/release/* /opt/pleroma && \
    rmdir /tmp/release && \
    rm /tmp/pleroma.zip

COPY config.exs /etc/pleroma/

RUN touch /etc/pleroma/.flag
COPY init_db.sh /etc/pleroma/
COPY start.sh /
RUN chmod +x /etc/pleroma/init_db.sh
RUN chmod +x /start.sh
RUN chmod o= /etc/pleroma/config.exs

ENTRYPOINT [ "/start.sh" ]
