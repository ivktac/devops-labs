# Check if the image is already built, if not build it

IMAGE_NAME="redis-cron"

if [ -z "$(docker images -q $IMAGE_NAME)" ]; then
  echo "Building image $IMAGE_NAME"
  docker build -t $IMAGE_NAME .
fi

# Run the container if it's not running already
if [ -z "$(docker ps | grep $IMAGE_NAME)" ]; then
  echo "Running container $IMAGE_NAME"
  docker run -d --name "$IMAGE_NAME-container" $IMAGE_NAME
fi

docker exec -it $IMAGE_NAME-container /bin/bash

