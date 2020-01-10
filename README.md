# docker-filebeat

## Build

``` Bash
IMAGE_TAG="6.8.1"
docker build -t "eurotech/filebeat:${IMAGE_TAG}" .
docker push "eurotech/filebeat:${IMAGE_TAG}"
```
