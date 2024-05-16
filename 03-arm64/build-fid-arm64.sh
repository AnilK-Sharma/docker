#
# build an arm64 image for macos
#
#
# add --push if you want to push to a repo

echo "Starting Zookeeper 3.5.8 Build\n"

docker buildx build -t radiantone/zookeeper:3.5.8-arm64 --platform linux/arm64 -f zk_Dockerfile .

echo "Starting 7.4.9 Build\n"


docker buildx build -t radiantone/fid:7.4.9-arm64 --no-cache --pull --platform linux/arm64 -f fid749_Dockerfile .

# echo "Starting 8.0.1-rc.9 Build\n"

# docker buildx build -t radiantone/fid:8.0.1-rc.9-arm64 --no-cache --pull --platform linux/arm64 -f fid_Dockerfile .

