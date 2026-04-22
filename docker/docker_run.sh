#!/bin/bash

CONTAINER_NAME="grapheqa-for-stretch"
DOCKER_IMAGE="blakerbuchanan/grapheqa_for_stretch:0.0.2"
WORKSPACE_DIR="$(pwd)"
SSH_AUTH_SOCK_VAR="$SSH_AUTH_SOCK"

# docker run -it --entrypoint /bin/bash\
#   --name "$CONTAINER_NAME" \
#   --privileged \
#   --net=host \
#   --env="DISPLAY=$DISPLAY" \
#   --env="XAUTHORITY=$XAUTHORITY" \
#   --gpus '"device=0"' \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e QT_X11_NO_MITSHM=1 \
#   -e NVIDIA_VISIBLE_DEVICES=0 \
#   -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics \
#   -e LD_LIBRARY_PATH=/usr/lib/nvidia-535:$LD_LIBRARY_PATH \
#   -v "$SSH_AUTH_SOCK_VAR:/run/ssh-agent" \
#   -e SSH_AUTH_SOCK=/run/ssh-agent \
#   -v "$WORKSPACE_DIR:/workspace:cached" \
#   -v /media/albert/ExtremeAlbert6/:/workspace/data \
#   --rm \
#   "$DOCKER_IMAGE"

docker run -it --rm \
  --name grapheqa-for-stretch \
  --gpus '"device=0"' \
  --net=host \
  -e NVIDIA_VISIBLE_DEVICES=0 \
  -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics \
  -e CUDA_VISIBLE_DEVICES=0 \
  -v "$(pwd):/workspace:cached" \
  -v /media/albert/ExtremeAlbert6/:/workspace/data \
  --entrypoint /bin/bash \
  blakerbuchanan/grapheqa_for_stretch:0.0.2