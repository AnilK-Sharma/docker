# ARM64 Dockerfile for Apache Derby and Sample Databases

This image is a simple docker build of Apache Derby for the ARM64 platform. The process of building linux/arm64 images is described below using `docker buildx`
Apache Derby 10.17 requires OpenJDK 21 or higher

## Pre-Check

Check if you have linux/arm64 available on your docker daemon by running this command
```
docker buildx inspect
```
## Build Image
Build Apache Derby arm64 image
```
# add --push if you want to push to a repo

DERBY_VERSION="10.17.1.0"

docker buildx build -t radiantone/derby:${DERBY_VERSION}-arm64 --platform linux/arm64 --no-cache --pull -f Derby_Dockerfile .
```

## Run Container
Running Apache Derby ARM64 image. This image is best run via docker compose. The start utilizes several environment variables that are as follows:
 
```
DERBY_VERSION="10.17.1.0"
docker run -it --hostname=myderby -p 1527:1527 radiantone/derby:${DERBY_VERSION}-arm64
```


