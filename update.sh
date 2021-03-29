docker rm atlas --force
docker run --rm --name=atlas -it -v ~/atlasserver:/mnt/atlas-server antihax/atlas-server
