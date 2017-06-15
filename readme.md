## iconnor/rancher-deployer

Easily upgrade Rancher services.

#### Usage

You can build this image or customize and build your own, to upgrade a service, use it the following way:

Considering your Stack with ID `1e9` named `myapp-production` running on a environment ID `1a5`. This will also update the tag with the CIRCLE_BUILD_NUM. The use case here is if you use the CIRCLE_BUILD_NUM as your v123 tag number and want to update this on each deploy rather than using latest. It will also update the environment variable BUILD_NUMBER. If you are using circle for your CI/CD, you can call this from your circle.yml file to upgrade the 'web' service.

Under this stack, you want to upgrade a service named `web`

```

docker run --rm \
    -e RANCHER_URL="http://my-rancher.com:8080/v2-beta/projects/1a5" \
    -e RANCHER_ACCESS_KEY="my_api_key" \
    -e RANCHER_SECRET_KEY="my_api_secret \
    -e RANCHER_STACK_ID="1e9" \
    -e CIRCLE_BUILD_NUM=$CIRCLE_BUILD_NUM \
    -e RANCHER_STACK_NAME="myapp-production" \
    -e RANCHER_SERVICE_NAME="web" \
    projectlounge/rancher-deployer:latest
```
