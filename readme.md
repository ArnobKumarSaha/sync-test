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

### 