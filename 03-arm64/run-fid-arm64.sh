#
# Simple run command for fid on Mac
#
export LICENSE="{rlib}x9TJ257P57TQ2dbEktPFzcrP4sDb1tDMtY/H2M6a5L7ey97Gxp7WmtTn4q/i3czWftXd2car2cLQ05XIytHN28Li3bvdpJqVgZSVmJOepoKb0M2ggqKUq5Gip3mhl5mTf5GUmpmbtYSjnpachpWlr5GepHyfl6ulfsTWzsLi3bvdu9LQt9TYys7esX2loJ2XhZqanpWjq4Gb1MrboNDIztSrpg=="

export FID_VERSION=8.0.0
export CLUSTER_NAME=myfid
export FID_ROOT_USER="cn=directory manager"
export FID_PASSWORD="Radiant1Rocks"

# be sure to create the volume first before running with the volume with the following
#
# docker volume create mainfid-vol

docker rm Radiantone_FID

docker run --hostname=myfid -e LICENSE="${LICENSE}" -e CLUSTER="new" -e ZK="local" \
-e FID_ROOT_USER="${FID_ROOT_USER}" -e FID_PASSWORD="${FID_PASSWORD}"  \
--name Radiantone_FID -v mainfid-vol:/opt/radiantone \
-p 7070:7070 -p 7171:7171 -p 8089:8089 -p 8090:8090 -p 2389:2389 -p 2636:2636 --detach \
radiantone/fid:8.0.0-arm64
