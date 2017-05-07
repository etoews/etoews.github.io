---
author: Everett Toews
comments: true
date: 2017-05-07 10:00:00+00:00
layout: post
slug: docker-for-mac-configuration-persistence
title: Docker for Mac Configuration Persistence
image: /img/posts/docker-for-mac.png
categories:
  - docker
---
<img class="img-right" src="{{ page.image }}"/>I use Docker for Mac (DFM) every single day. Up until now all of the out of the box configuration settings just worked for me. However, I ran into an issue with DNS and an issue with subnet collisions that required me to change the configuration. I also needed to script those changes so others could conveniently use them and the changes needed to persist between Docker for Mac restarts.

<!--more-->

The versions used in this post are:

* [Docker for Mac](https://www.docker.com/docker-mac): 17.05.0-ce-rc1-mac8 (16582)
* [jq](https://stedolan.github.io/jq/): 1.5

## Temporary Configuration

If you want to make temporary configuration changes to your Docker for Mac environment, you can change the running xhyve VM directly. The changes won't persist but it's a good way to experiment. It's also a good way to check your work after you've attempted to make something persistent.

To attach to the running xhyve VM, you can use [screen](http://aperiodic.net/screen/quick_reference). You might have to hit Enter again after running `screen` to get a prompt.

```bash 
$ screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty

/ # cat /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

Use Ctrl+a Ctrl+d to detach from the session.

## Persistent Configuration

Initially, the placeholder for the configuration is stored in a git bare repo. We need to do a `git reset` on it to get a working copy.

```bash
cd ~/Library/Containers/com.docker.docker/Data/database
git reset --hard
```

### DNS

DFM wasn't able to resolve the IP of my Docker registry. To workaround that issue, I had to change the /etc/hosts file with the proper IP address and the FQDN of the registry. Here's how to customize the /etc/hosts file and commit the changes. 

```bash
DFM_HOSTS_FILE="com.docker.driver.amd64-linux/etc/hosts"

if ! grep -q registry.example.com ${DFM_HOSTS_FILE}; then
  echo "adding docker registry ip to DFM /etc/hosts"

  echo -e "xxx.xxx.xxx.xxx\tregistry.example.com" >> ${DFM_HOSTS_FILE}

  git add ${DFM_HOSTS_FILE}
  git commit -m "add docker registry to /etc/hosts for dns lookup"
fi
```

Entries added to `${DFM_HOSTS_FILE}` are appended the /etc/hosts file in the xhyve VM.

### Subnet

The default subnet used by DFM is 172.17.0.0/16. Unfortunately for me this conflicted with a subnet in use by VirtualBox on my laptop. To change it you need to specify the network bridge IP using the `bip` flag from the [dockerd options](https://docs.docker.com/engine/reference/commandline/dockerd/) in the Docker daemon.json file.

```bash
DFM_DAEMON_FILE="com.docker.driver.amd64-linux/etc/docker/daemon.json"

if ! grep -q bip ${DFM_DAEMON_FILE}; then
  echo "changed DFM subnet to avoid conflict with VirtualBox subnet"

  DFM_DAEMON_JSON=$(cat ${DFM_DAEMON_FILE})
  echo ${DFM_DAEMON_JSON} | jq -r '.+ {"bip": "172.20.0.1/16"}' > ${DFM_DAEMON_FILE}

  git add ${DFM_DAEMON_FILE}
  git commit -m "changed subnet to avoid conflict with VirtualBox subnet"
fi
```

I used `jq` to merge the `bip` flag change with any preexisting changes that might already be there. For these change to take effect, you must **restart Docker for Mac**. To test the changes, inspect the network bridge, start a container, and check its IP address.

```bash
$ docker network inspect bridge | jq -r '.[0].IPAM.Config'
[
  {
    "Subnet": "172.20.0.1/16",
    "Gateway": "172.20.0.1"
  }
]

$ docker container run --detach --rm --name nginx --publish 80:80 nginx
34944a4a360364240636ae1436d2911909ad6c2f401c037daaeaeeb1502f701f

$ docker container inspect nginx | jq -r '.[0].NetworkSettings.Networks.bridge.IPAddress'
172.20.0.3
```

## Coda

There's much more you can do to configure Docker for Mac. These are just two examples based on issues I had to solve. You can experiment in a screen session and then make your configuration changes persistent.