#!/bin/bash

USER_ID=${CONTAINER_UID:-1000}
GROUP_ID=${CONTAINER_GID:-1000}
USER_NAME=${CONTAINER_USER:-developer}

groupadd -g $GROUP_ID $USER_NAME 2>/dev/null
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -G sudo -o -c "" -m $USER_NAME 2>/dev/null
echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER_NAME
chmod 0440 /etc/sudoers.d/$USER_NAME

exec gosu $USER_NAME "$@"
