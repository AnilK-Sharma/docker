#
# build an arm64 image for macos
#
#
# add --push if you want to push to a repo

# docker buildx build -t radiantone/zookeeper:3.5.8-arm64 --platform linux/arm64 -f zk_Dockerfile .

echo "\n\n ** Starting 7.4.9 Build for UBI minimal \n"


docker buildx build -t radiantone/fid-ubi9-minimal:7.4.9-arm64 --no-cache --pull --platform linux/arm64 -f fid749_ubi8-minimal_Dockerfile .

#echo "Starting 8.0.1-rc.3 Build\n"

# docker buildx build -t radiantone/fid:8.0.1-rc.3-arm64 --no-cache --pull --platform linux/arm64 -f fid_Dockerfile .

