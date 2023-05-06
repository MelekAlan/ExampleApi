# Setting up the namespace for our application

- Note: This is an initial setup. And has only to be exectued once.
- Create the namespace itself:
```shell
kubectl create namespace application
```

- Create a docker-registry secret so our images can be pulled:
- Note: Insert the correct password into the command below
```shell
kubectl create secret docker-registry pull-secret \
--docker-server='docker.io' \
--docker-username='myDockerHub' \
--docker-password='PASSWORD_HERE' \
-n application
```
