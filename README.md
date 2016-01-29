# docker-phalcon-nginx
Phalcon PHP CLI Container Image on Docker Ubuntu

just run :


```
# pull an image
docker pull ishiidaichi/docker-phalcon-cli

# run your Phalcon PHP CLI app!
docker run -v /path/to/your/app:/var/cli ishiidaichi/docker-phalcon-cli /usr/bin/php /cli/YOURAPP.php COMMAND ARGS ... 
```

That's it!
