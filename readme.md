https://github.com/kubernetes/git-sync

### Explore the behaviour (with docker container)
```bash
$ export DIR="/tmp/git-data"

$ docker run -d \
-v $DIR:/tmp/git \
-u$(id -u):$(id -g) \
registry.k8s.io/git-sync/git-sync:v4.1.0 \
--repo=https://github.com/Arnobkumarsaha/sync-test \
--root=/tmp/git/root \
--period=30s

$ ls /tmp/git-data/root
```

### Apply the simple yaml & check 
`kubectl apply -f simple.yaml`

```bash
$ kubectl exec -it -n demo mg-0 bash
root@mg-0:/# ls /docker-entrypoint-initdb.d/
<files from this repo>

mongo:PRIMARY> db.people.find()
{ "_id" : ObjectId("654a3bd7cd0c99b4cd2e0dc2"), "firstname" : "kubernetes", "lastname" : "database" }
```

### Apply the ssh yaml & check

#### Make the ssh secret
https://github.com/kubernetes/git-sync/blob/master/docs/ssh.md

`$ ssh-keyscan github.com > /tmp/known_hosts` # replace github.com to use other host

```bash
kubectl create secret generic -n demo git-creds \
--from-file=ssh=$HOME/.ssh/id_rsa \
--from-file=known_hosts=/tmp/known_hosts
```

`kubectl apply -f ssh.yaml`
Check as previous.
