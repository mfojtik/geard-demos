# Various GearD demos

All demos use Vagrant setup with ports `1808[0-4]` forwarded from guest to host.

### Build the Docker image from GIT sources

STI_SCRIPTS_URL: https://github.com/openshift/ruby-19-centos/tree/master/.sti/bin
```
$ gear build https://github.com/mfojtik/sinatra-app-example openshift/ruby-19-centos sinatra-app
```

**Incremental build:**

```
$ gear build https://github.com/mfojtik/sinatra-app-example openshift/ruby-19-centos sinatra-app
```
```
$ gear install sinatra-app sinatra-app-service -p 9292:8081
$ gear start sinatra-app-service 
$ gear restart sinatra-app-service 
$ gear stop sinatra-app-service
```

* Visit: http://localhost:18081

### Connecting to the container using SSH (isolate container)

```
$ ssh-keygen
$ gear install sinatra-app dev/my-app --isolate
$ gear add-keys --key-file=/root/.ssh/id_rsa.pub my-app
$ ssh ctr-my-app@localhost
```

### Linking two container togerher (Wordpress + MySQL demo)

```
$ gear deploy demo/wordpress.json
```
```
$ watch gear list-units
$ journalctl -u ctr-wordpress-frontend-1 -n 50 -f
```

* Visit: http://localhost:18080/wordpress

### Loadbalancing between containers (HAProxy + Sinatra demo)

```
$ gear deploy demo/balancer.json
```
```
$ watch gear list-units
$ journalctl -u ctr-app-balancer-1 -n 50 -f
```

* Visit: http://localhost:18082/ (*Application*)
* Visit: http://localhost:18083/haproxy?stats (*HAProxy status: admin/password*)

```
$ ab -n 1000 -c 50 http://localhost:18082
```
