IMAGE_NAME="my-app:Dockertest"
if [ -z "$(docker images -q ${IMAGE_NAME})" ];
then
    echo "never exists"
else
    echo "deleting original image:..."
    docker image inspect ${IMAGE_NAME}
    docker rmi --force ${IMAGE_NAME}
fi
echo "Building new images..."
docker build -t "${IMAGE_NAME}" .
echo "testing this image: ..."
docker run ${IMAGE_NAME}
