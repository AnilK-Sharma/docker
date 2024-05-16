#
# build an arm64 image for macos for derby
#
#
# add --push if you want to push to a repo

echo "Starting Apache Derby Build\n"

DERBY_VERSION=10.17.1.0

docker buildx build -t radiantone/derby:${DERBY_VERSION}-arm64 --platform linux/arm64 --no-cache --pull -f Derby_Dockerfile .

echo "Apache Derby container Build complete \n"


