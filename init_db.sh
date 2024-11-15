#!/bin/sh

if [ -f /etc/pleroma/.flag ]; then
    /opt/pleroma/bin/pleroma_ctl migrate
    rm /etc/pleroma/.flag
fi
