Last login: Thu Mar 14 11:26:03 on ttys002
adlerhu@AdlerHudeMacBook-Pro ~ % ssh -i skills-building adlerhu@35.194.232.29
The authenticity of host '35.194.232.29 (35.194.232.29)' can't be established.
ED25519 key fingerprint is SHA256:8XGpv6MmCzYJYLabBj8ncSt5rxJacO1ju1s596lW4nw.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '35.194.232.29' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1053-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

  System information as of Thu Mar 14 03:43:17 UTC 2024

  System load:  1.04              Processes:             114
  Usage of /:   4.4% of 48.27GB   Users logged in:       0
  Memory usage: 8%                IPv4 address for ens4: 10.240.0.2
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

5 updates can be applied immediately.
2 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

adlerhu@mailcow:~$ docker

Command 'docker' not found, but can be installed with:

snap install docker     # version 24.0.5, or
apt  install docker.io  # version 24.0.5-0ubuntu1~20.04.1

See 'snap info docker' for additional versions.

adlerhu@mailcow:~$ sudo su -
root@mailcow:~# 
root@mailcow:~# 
root@mailcow:~# docker

Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Common Commands:
  run         Create and run a new container from an image
  exec        Execute a command in a running container
  ps          List containers
  build       Build an image from a Dockerfile
  pull        Download an image from a registry
  push        Upload an image to a registry
  images      List images
  login       Log in to a registry
  logout      Log out from a registry
  search      Search Docker Hub for images
  version     Show the Docker version information
  info        Display system-wide information

Management Commands:
  builder     Manage builds
  buildx*     Docker Buildx (Docker Inc., v0.13.0)
  compose*    Docker Compose (Docker Inc., v2.24.7)
  container   Manage containers
  context     Manage contexts
  image       Manage images
  manifest    Manage Docker image manifests and manifest lists
  network     Manage networks
  plugin      Manage plugins
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Swarm Commands:
  swarm       Manage Swarm

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Global Options:
      --config string      Location of client config files (default "/root/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set
                           with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket to connect to
  -l, --log-level string   Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Run 'docker COMMAND --help' for more information on a command.

For more help on how to use Docker, head to https://docs.docker.com/go/guides/
root@mailcow:~# docker version
Client: Docker Engine - Community
 Version:           25.0.4
 API version:       1.44
 Go version:        go1.21.8
 Git commit:        1a576c5
 Built:             Wed Mar  6 16:32:14 2024
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          25.0.4
  API version:      1.44 (minimum version 1.24)
  Go version:       go1.21.8
  Git commit:       061aa95
  Built:            Wed Mar  6 16:32:14 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.28
  GitCommit:        ae07eda36dd25f8a1b98dfbf587313b99c0190bb
 runc:
  Version:          1.1.12
  GitCommit:        v1.1.12-0-g51d5e94
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
root@mailcow:~# 
root@mailcow:~# 
root@mailcow:~# id adlerhu
uid=1001(adlerhu) gid=1002(adlerhu) groups=1002(adlerhu),4(adm),20(dialout),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),118(netdev),119(lxd),1000(ubuntu),1001(google-sudoers),998(docker)
root@mailcow:~# 
root@mailcow:~# 
root@mailcow:~# su - adlerhu
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

adlerhu@mailcow:~$ 
adlerhu@mailcow:~$ 
adlerhu@mailcow:~$ docekr

Command 'docekr' not found, did you mean:

  command 'docker' from snap docker (24.0.5)
  command 'docker' from deb docker.io (24.0.5-0ubuntu1~20.04.1)

See 'snap info <snapname>' for additional versions.

adlerhu@mailcow:~$ docker

Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Common Commands:
  run         Create and run a new container from an image
  exec        Execute a command in a running container
  ps          List containers
  build       Build an image from a Dockerfile
  pull        Download an image from a registry
  push        Upload an image to a registry
  images      List images
  login       Log in to a registry
  logout      Log out from a registry
  search      Search Docker Hub for images
  version     Show the Docker version information
  info        Display system-wide information

Management Commands:
  builder     Manage builds
  buildx*     Docker Buildx (Docker Inc., v0.13.0)
  compose*    Docker Compose (Docker Inc., v2.24.7)
  container   Manage containers
  context     Manage contexts
  image       Manage images
  manifest    Manage Docker image manifests and manifest lists
  network     Manage networks
  plugin      Manage plugins
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Swarm Commands:
  swarm       Manage Swarm

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Global Options:
      --config string      Location of client config files (default "/home/adlerhu/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set
                           with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket to connect to
  -l, --log-level string   Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/home/adlerhu/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/home/adlerhu/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/home/adlerhu/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Run 'docker COMMAND --help' for more information on a command.

For more help on how to use Docker, head to https://docs.docker.com/go/guides/
adlerhu@mailcow:~$ 
adlerhu@mailcow:~$ sudo su -
root@mailcow:~# cd /opt/
root@mailcow:/opt# git clone https://github.com/mailcow/mailcow-dockerized
Cloning into 'mailcow-dockerized'...
remote: Enumerating objects: 53151, done.
remote: Counting objects: 100% (3146/3146), done.
remote: Compressing objects: 100% (1316/1316), done.
remote: Total 53151 (delta 2108), reused 2788 (delta 1818), pack-reused 50005
Receiving objects: 100% (53151/53151), 46.14 MiB | 20.35 MiB/s, done.
Resolving deltas: 100% (35098/35098), done.
root@mailcow:/opt# cd mailcow-dockerized/
root@mailcow:/opt/mailcow-dockerized# ll
total 192
drwxr-xr-x 6 root root  4096 Mar 14 03:45 ./
drwxr-xr-x 4 root root  4096 Mar 14 03:45 ../
-rw-r--r-- 1 root root   414 Mar 14 03:45 .editorconfig
lrwxrwxrwx 1 root root    12 Mar 14 03:45 .env -> mailcow.conf
drwxr-xr-x 8 root root  4096 Mar 14 03:45 .git/
drwxr-xr-x 4 root root  4096 Mar 14 03:45 .github/
-rw-r--r-- 1 root root  1880 Mar 14 03:45 .gitignore
-rw-r--r-- 1 root root  3223 Mar 14 03:45 CODE_OF_CONDUCT.md
-rw-r--r-- 1 root root  5260 Mar 14 03:45 CONTRIBUTING.md
-rw-r--r-- 1 root root 35141 Mar 14 03:45 LICENSE
-rw-r--r-- 1 root root  2157 Mar 14 03:45 README.md
-rw-r--r-- 1 root root  1737 Mar 14 03:45 SECURITY.md
-rwxr-xr-x 1 root root   174 Mar 14 03:45 create_cold_standby.sh*
drwxr-xr-x 7 root root  4096 Mar 14 03:45 data/
-rw-r--r-- 1 root root 24363 Mar 14 03:45 docker-compose.yml
-rwxr-xr-x 1 root root 22237 Mar 14 03:45 generate_config.sh*
drwxr-xr-x 3 root root  4096 Mar 14 03:45 helper-scripts/
-rwxr-xr-x 1 root root 50459 Mar 14 03:45 update.sh*
root@mailcow:/opt/mailcow-dockerized# vi docker-compose.yml 
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# apt-get install -y nginx
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libatasmart4 libblockdev-fs2 libblockdev-loop2 libblockdev-part-err2 libblockdev-part2 libblockdev-swap2 libblockdev-utils2 libblockdev2
  libmbim-glib4 libmbim-proxy libmm-glib0 libnspr4 libnss3 libnuma1 libparted-fs-resize0 libqmi-glib5 libqmi-proxy libudisks2-0 libxmlb2
  usb-modeswitch usb-modeswitch-data
Use 'apt autoremove' to remove them.
The following additional packages will be installed:
  fontconfig-config fonts-dejavu-core libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-image-filter
  libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream libtiff5 libwebp6 libxpm4 nginx-common nginx-core
Suggested packages:
  libgd-tools fcgiwrap nginx-doc ssl-cert
The following NEW packages will be installed:
  fontconfig-config fonts-dejavu-core libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-image-filter
  libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream libtiff5 libwebp6 libxpm4 nginx nginx-common nginx-core
0 upgraded, 17 newly installed, 0 to remove and 4 not upgraded.
Need to get 2438 kB of archives.
After this operation, 7925 kB of additional disk space will be used.
Get:1 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal/main amd64 fonts-dejavu-core all 2.37-1 [1041 kB]
Get:2 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal/main amd64 fontconfig-config all 2.13.1-2ubuntu3 [28.8 kB]
Get:3 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal/main amd64 libfontconfig1 amd64 2.13.1-2ubuntu3 [114 kB]
Get:4 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libjpeg-turbo8 amd64 2.0.3-0ubuntu1.20.04.3 [118 kB]
Get:5 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal/main amd64 libjpeg8 amd64 8c-2ubuntu8 [2194 B]
Get:6 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libjbig0 amd64 2.1-3.1ubuntu0.20.04.1 [27.3 kB]
Get:7 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libwebp6 amd64 0.6.1-2ubuntu0.20.04.3 [185 kB]
Get:8 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libtiff5 amd64 4.1.0+git191117-2ubuntu0.20.04.12 [164 kB]
Get:9 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libxpm4 amd64 1:3.5.12-1ubuntu0.20.04.2 [34.9 kB]
Get:10 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libgd3 amd64 2.2.5-5.2ubuntu2.1 [118 kB]
Get:11 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 nginx-common all 1.18.0-0ubuntu1.4 [37.7 kB]
Get:12 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-http-image-filter amd64 1.18.0-0ubuntu1.4 [14.8 kB]
Get:13 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-http-xslt-filter amd64 1.18.0-0ubuntu1.4 [13.0 kB]
Get:14 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-mail amd64 1.18.0-0ubuntu1.4 [42.9 kB]
Get:15 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-stream amd64 1.18.0-0ubuntu1.4 [67.4 kB]
Get:16 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 nginx-core amd64 1.18.0-0ubuntu1.4 [425 kB]
Get:17 http://asia-east1.gce.archive.ubuntu.com/ubuntu focal-updates/main amd64 nginx all 1.18.0-0ubuntu1.4 [3620 B]
Fetched 2438 kB in 0s (26.6 MB/s)
Preconfiguring packages ...
Selecting previously unselected package fonts-dejavu-core.
(Reading database ... 62517 files and directories currently installed.)
Preparing to unpack .../00-fonts-dejavu-core_2.37-1_all.deb ...
Unpacking fonts-dejavu-core (2.37-1) ...
Selecting previously unselected package fontconfig-config.
Preparing to unpack .../01-fontconfig-config_2.13.1-2ubuntu3_all.deb ...
Unpacking fontconfig-config (2.13.1-2ubuntu3) ...
Selecting previously unselected package libfontconfig1:amd64.
Preparing to unpack .../02-libfontconfig1_2.13.1-2ubuntu3_amd64.deb ...
Unpacking libfontconfig1:amd64 (2.13.1-2ubuntu3) ...
Selecting previously unselected package libjpeg-turbo8:amd64.
Preparing to unpack .../03-libjpeg-turbo8_2.0.3-0ubuntu1.20.04.3_amd64.deb ...
Unpacking libjpeg-turbo8:amd64 (2.0.3-0ubuntu1.20.04.3) ...
Selecting previously unselected package libjpeg8:amd64.
Preparing to unpack .../04-libjpeg8_8c-2ubuntu8_amd64.deb ...
Unpacking libjpeg8:amd64 (8c-2ubuntu8) ...
Selecting previously unselected package libjbig0:amd64.
Preparing to unpack .../05-libjbig0_2.1-3.1ubuntu0.20.04.1_amd64.deb ...
Unpacking libjbig0:amd64 (2.1-3.1ubuntu0.20.04.1) ...
Selecting previously unselected package libwebp6:amd64.
Preparing to unpack .../06-libwebp6_0.6.1-2ubuntu0.20.04.3_amd64.deb ...
Unpacking libwebp6:amd64 (0.6.1-2ubuntu0.20.04.3) ...
Selecting previously unselected package libtiff5:amd64.
Preparing to unpack .../07-libtiff5_4.1.0+git191117-2ubuntu0.20.04.12_amd64.deb ...
Unpacking libtiff5:amd64 (4.1.0+git191117-2ubuntu0.20.04.12) ...
Selecting previously unselected package libxpm4:amd64.
Preparing to unpack .../08-libxpm4_1%3a3.5.12-1ubuntu0.20.04.2_amd64.deb ...
Unpacking libxpm4:amd64 (1:3.5.12-1ubuntu0.20.04.2) ...
Selecting previously unselected package libgd3:amd64.
Preparing to unpack .../09-libgd3_2.2.5-5.2ubuntu2.1_amd64.deb ...
Unpacking libgd3:amd64 (2.2.5-5.2ubuntu2.1) ...
Selecting previously unselected package nginx-common.
Preparing to unpack .../10-nginx-common_1.18.0-0ubuntu1.4_all.deb ...
Unpacking nginx-common (1.18.0-0ubuntu1.4) ...
Selecting previously unselected package libnginx-mod-http-image-filter.
Preparing to unpack .../11-libnginx-mod-http-image-filter_1.18.0-0ubuntu1.4_amd64.deb ...
Unpacking libnginx-mod-http-image-filter (1.18.0-0ubuntu1.4) ...
Selecting previously unselected package libnginx-mod-http-xslt-filter.
Preparing to unpack .../12-libnginx-mod-http-xslt-filter_1.18.0-0ubuntu1.4_amd64.deb ...
Unpacking libnginx-mod-http-xslt-filter (1.18.0-0ubuntu1.4) ...
Selecting previously unselected package libnginx-mod-mail.
Preparing to unpack .../13-libnginx-mod-mail_1.18.0-0ubuntu1.4_amd64.deb ...
Unpacking libnginx-mod-mail (1.18.0-0ubuntu1.4) ...
Selecting previously unselected package libnginx-mod-stream.
Preparing to unpack .../14-libnginx-mod-stream_1.18.0-0ubuntu1.4_amd64.deb ...
Unpacking libnginx-mod-stream (1.18.0-0ubuntu1.4) ...
Selecting previously unselected package nginx-core.
Preparing to unpack .../15-nginx-core_1.18.0-0ubuntu1.4_amd64.deb ...
Unpacking nginx-core (1.18.0-0ubuntu1.4) ...
Selecting previously unselected package nginx.
Preparing to unpack .../16-nginx_1.18.0-0ubuntu1.4_all.deb ...
Unpacking nginx (1.18.0-0ubuntu1.4) ...
Setting up libxpm4:amd64 (1:3.5.12-1ubuntu0.20.04.2) ...
Setting up nginx-common (1.18.0-0ubuntu1.4) ...
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /lib/systemd/system/nginx.service.
Setting up libjbig0:amd64 (2.1-3.1ubuntu0.20.04.1) ...
Setting up libnginx-mod-http-xslt-filter (1.18.0-0ubuntu1.4) ...
Setting up libwebp6:amd64 (0.6.1-2ubuntu0.20.04.3) ...
Setting up fonts-dejavu-core (2.37-1) ...
Setting up libjpeg-turbo8:amd64 (2.0.3-0ubuntu1.20.04.3) ...
Setting up libjpeg8:amd64 (8c-2ubuntu8) ...
Setting up libnginx-mod-mail (1.18.0-0ubuntu1.4) ...
Setting up fontconfig-config (2.13.1-2ubuntu3) ...
Setting up libnginx-mod-stream (1.18.0-0ubuntu1.4) ...
Setting up libtiff5:amd64 (4.1.0+git191117-2ubuntu0.20.04.12) ...
Setting up libfontconfig1:amd64 (2.13.1-2ubuntu3) ...
Setting up libgd3:amd64 (2.2.5-5.2ubuntu2.1) ...
Setting up libnginx-mod-http-image-filter (1.18.0-0ubuntu1.4) ...
Setting up nginx-core (1.18.0-0ubuntu1.4) ...
Setting up nginx (1.18.0-0ubuntu1.4) ...
Processing triggers for ufw (0.36-6ubuntu1.1) ...
Processing triggers for systemd (245.4-4ubuntu3.23) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.14) ...
root@mailcow:/opt/mailcow-dockerized# curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# cat /etc/nginx/nginx.conf 
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
	# multi_accept on;
}

http {

	##
	# Basic Settings
	##

	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 65;
	types_hash_max_size 2048;
	# server_tokens off;

	# server_names_hash_bucket_size 64;
	# server_name_in_redirect off;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	##
	# SSL Settings
	##

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
	ssl_prefer_server_ciphers on;

	##
	# Logging Settings
	##

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	##
	# Gzip Settings
	##

	gzip on;

	# gzip_vary on;
	# gzip_proxied any;
	# gzip_comp_level 6;
	# gzip_buffers 16 8k;
	# gzip_http_version 1.1;
	# gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

	##
	# Virtual Host Configs
	##

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}


#mail {
#	# See sample authentication script at:
#	# http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
# 
#	# auth_http localhost/auth.php;
#	# pop3_capabilities "TOP" "USER";
#	# imap_capabilities "IMAP4rev1" "UIDPLUS";
# 
#	server {
#		listen     localhost:110;
#		protocol   pop3;
#		proxy      on;
#	}
# 
#	server {
#		listen     localhost:143;
#		protocol   imap;
#		proxy      on;
#	}
#}
root@mailcow:/opt/mailcow-dockerized# ll /usr/share/nginx/
total 16
drwxr-xr-x   4 root root 4096 Mar 14 03:51 ./
drwxr-xr-x 113 root root 4096 Mar 14 03:51 ../
drwxr-xr-x   2 root root 4096 Mar 14 03:51 html/
lrwxrwxrwx   1 root root   23 Nov 10  2022 modules -> ../../lib/nginx/modules/
drwxr-xr-x   2 root root 4096 Mar 14 03:51 modules-available/
root@mailcow:/opt/mailcow-dockerized# ll /usr/share/nginx/html/
total 12
drwxr-xr-x 2 root root 4096 Mar 14 03:51 ./
drwxr-xr-x 4 root root 4096 Mar 14 03:51 ../
-rw-r--r-- 1 root root  612 Apr 21  2020 index.html
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# sudo systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2024-03-14 03:51:39 UTC; 1h 11min ago
       Docs: man:nginx(8)
   Main PID: 5598 (nginx)
      Tasks: 3 (limit: 4680)
     Memory: 5.1M
     CGroup: /system.slice/nginx.service
             ├─5598 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
             ├─5599 nginx: worker process
             └─5600 nginx: worker process

Mar 14 03:51:39 mailcow systemd[1]: Starting A high performance web server and a reverse proxy server...
Mar 14 03:51:39 mailcow systemd[1]: Started A high performance web server and a reverse proxy server.
root@mailcow:/opt/mailcow-dockerized# sudo systemctl stop nginx
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# apt-get remove -y nginx
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  fontconfig-config fonts-dejavu-core libatasmart4 libblockdev-fs2 libblockdev-loop2 libblockdev-part-err2 libblockdev-part2
  libblockdev-swap2 libblockdev-utils2 libblockdev2 libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libmbim-glib4 libmbim-proxy
  libmm-glib0 libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream libnspr4 libnss3 libnuma1
  libparted-fs-resize0 libqmi-glib5 libqmi-proxy libtiff5 libudisks2-0 libwebp6 libxmlb2 libxpm4 nginx-common nginx-core usb-modeswitch
  usb-modeswitch-data
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nginx
0 upgraded, 0 newly installed, 1 to remove and 4 not upgraded.
After this operation, 46.1 kB disk space will be freed.
(Reading database ... 62744 files and directories currently installed.)
Removing nginx (1.18.0-0ubuntu1.4) ...
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# 
root@mailcow:/opt/mailcow-dockerized# vi generate_config.sh 


if [[ $SKIP_BRANCH != "y" ]]; then
mailcow_git_commit=$(git rev-parse origin/${git_branch})
mailcow_git_commit_date=$(git log -1 --format=%ci @{upstream} )
else
mailcow_git_commit=$(git rev-parse ${git_branch})
mailcow_git_commit_date=$(git log -1 --format=%ci @{upstream} )
git_branch=$(git rev-parse --abbrev-ref HEAD)
fi

if [ $? -eq 0 ]; then
  echo '<?php' > data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_VERSION="'$mailcow_git_version'";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_LAST_GIT_VERSION="";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_OWNER="mailcow";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_REPO="mailcow-dockerized";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_URL="https://github.com/mailcow/mailcow-dockerized";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_COMMIT="'$mailcow_git_commit'";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_COMMIT_DATE="'$mailcow_git_commit_date'";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_BRANCH="'$git_branch'";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_UPDATEDAT='$(date +%s)';' >> data/web/inc/app_info.inc.php
  echo '?>' >> data/web/inc/app_info.inc.php
else
  echo '<?php' > data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_VERSION="'$mailcow_git_version'";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_LAST_GIT_VERSION="";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_OWNER="mailcow";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_REPO="mailcow-dockerized";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_URL="https://github.com/mailcow/mailcow-dockerized";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_COMMIT="";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_GIT_COMMIT_DATE="";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_BRANCH="'$git_branch'";' >> data/web/inc/app_info.inc.php
  echo '  $MAILCOW_UPDATEDAT='$(date +%s)';' >> data/web/inc/app_info.inc.php
  echo '?>' >> data/web/inc/app_info.inc.php
  echo -e "\e[33mCannot determine current git repository version...\e[0m"
fi

detect_bad_asn
