#!/bin/bash

CONTAINER_NAME="grapheqa-for-habitat"
DOCKER_IMAGE="blakerbuchanan/grapheqa_for_habitat:0.0.1"
WORKSPACE_DIR="$(pwd)"
SSH_AUTH_SOCK_VAR="$SSH_AUTH_SOCK"

docker run -it \
  --name "$CONTAINER_NAME" \
  --privileged \
  --net=host \
  --env="DISPLAY=$DISPLAY" \
  --env="XAUTHORITY=$XAUTHORITY" \
  --gpus all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e QT_X11_NO_MITSHM=1 \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -v "$SSH_AUTH_SOCK_VAR:/run/ssh-agent" \
  -e SSH_AUTH_SOCK=/run/ssh-agent \
  -v "$WORKSPACE_DIR:/workspace" \
  --rm \
  "$DOCKER_IMAGE" \
  /bin/bash