previusVersion=$(docker image inspect --format='{{.Id}}' vskgr/controller)
docker pull vskgr/controller
newVersion=$(docker image inspect --format='{{.Id}}' vskgr/controller)

if [ "$previusVersion" != "$newVersion" ]; then
    echo "new version found"
    docker-compose stop controller
    docker-compose up -d controller
else
    echo "no changes"
fi