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
Running Apache Derby ARM64 image. This image is best run via docker compose. The start utilizes several environment variables that are defined in the container as follows:
| Variable      | Default Value | Description     |
| :---          |    :----     |          :---   |
| DERBY_VERSION | "10.17.1.0" | Apache Derby Version |
| DERBY_INSTALL | "/opt/apache/derby" | Derby Install Directory for product. This is also the volume mount point for product installation.  |
| DERBY_HOME | "${DERBY_INSTALL}/product" | Product install root |
| DERBY_LIB | "${DERBY_HOME}/lib" | Location for java libraries and jars |
| DERBY_BIN | "${DERBY_HOME}/bin" | Location for binaries and scripts |
| DERBY_DATA | "/opt/apache/derbydata" | Derby data location. This is also the volume mount point for data and databases | 
| DERBY_DBS | "${DERBY_DATA}/databases" | Location of the sample databases. A separate volume is so that we can upgrade Derby without impacting the databases. |
|  |  |

These variables are also utilized in the Apache Derby startup script.

 #### Run commands
```
export DERBY_VERSION="10.17.1.0"
docker volume create apache_derby
docker volume create apache_derby_data
docker run -it --hostname=myderby -p 1527:1527 radiantone/derby:${DERBY_VERSION}-arm64
```


