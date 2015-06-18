---
author: Everett Toews
comments: true
date: 2015-04-16 14:00:00+00:00
layout: post
slug: a-devstack-for-all-seasons
title: A DevStack For All Seasons
image: /img/posts/seasons.jpeg
categories:
- devstack
- openstack
- rackspace
---

<img class="img-right" src="/img/posts/seasons.jpeg"/>Here's how to deploy DevStack for OpenStack on the Rackspace Cloud. You can use DevStack for testing/development of OpenStack or just learning a bit more about OpenStack and how all of the pieces fit together.

<!--more-->

The services deployed from following the instructions here are:

  1. Identity (Keystone)
  1. Compute (Nova)
  1. Network (Neutron)
  1. Object Storage (Swift)
  1. Image (Glance)
  1. Block Storage (Cinder)
  1. Orchestration (Heat)
  1. Messaging (Zaqar)
  1. Dashboard (Horizon)

If you don't have a Rackspace Cloud account, I recommend using the [Developer+](http://developer.rackspace.com/signup/) free credit to try this out.

<img class="img-right" src="/img/posts/cloud-inception.png"/>In the instructions below you'll need to replace `MY_OPENSTACK_VERSION` with one of these [branch names](https://github.com/openstack-dev/devstack/branches) (minus the `stable/` prefix). The branch names are the code names for a particular version of OpenStack. e.g. `stable/MY_OPENSTACK_VERSION` becomes `stable/juno`. You'll also need to replace `MY_DEVSTACK_PASSWORD` with one of your choosing.

1. Go to the [Cloud Control Panel](https://mycloud.rackspace.com/)

2. Click Create Server

  1. Name: devstack
  1. Image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM)
  1. Flavor: Performance 1 > 4GB Performance (you might get away with 2 GB)

3. Click Create Server and note the password and IPv4 address (when it appears)

4. When your server is Active, switch to a Terminal and run the following commands:

        ssh root@my.ip.v4.address
        apt-get -y update
        apt-get -y install git
        git clone https://github.com/openstack-dev/devstack.git -b stable/MY_OPENSTACK_VERSION devstack/
        devstack/tools/create-stack-user.sh
        su stack
        cd
        git clone https://github.com/openstack-dev/devstack.git -b stable/MY_OPENSTACK_VERSION devstack/
        cd devstack/
        vim local.conf
        # Press i to enter insert mode
        # Copy in the contents of the local.conf.template file below
        # Press esc to get out of insert mode
        # Type :%s/OPENSTACK_VERSION/MY_OPENSTACK_VERSION/g
        #   e.g. :%s/OPENSTACK_VERSION/juno/g and press enter
        # Type :%s/DEVSTACK_PASSWORD/MY_DEVSTACK_PASSWORD/g
        #   e.g. :%s/DEVSTACK_PASSWORD/devstacker/g and press enter
        # Type :x and press enter
        ./stack.sh

5. To work with OpenStack via the web browser:

  1. Go to http://my.ip.v4.address
    * User Name: demo
    * Password: `MY_DEVSTACK_PASSWORD`
  1. See the [Getting Started Guide](http://docs.openstack.org/user-guide/content/ch_dashboard.html).

6. To work with OpenStack via the command line:

        source openrc demo demo
        openstack image list

    See the [Getting Started Guide](http://docs.openstack.org/developer/python-openstackclient/).

7. To work with OpenStack via a programming language in a software development kit (SDK):

    <table class="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <th>Language</th>
          <th>Guide</th>
          <th>SDK Name</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Go</td>
          <td><a href="http://gophercloud.io/docs/">Getting Started Guide</a></td>
          <td>gophercloud</td>
        </tr>
        <tr>
          <td>Java</td>
          <td><a href="http://jclouds.apache.org/guides/openstack/">Getting Started Guide</a></td>
          <td>Apache jclouds</td>
        </tr>
        <tr>
          <td>.NET</td>
          <td><a href="http://openstacknetsdk.org/">Getting Started Guide</a></td>
          <td>OpenStack.NET</td>
        </tr>
        <tr>
          <td>Node.js</td>
          <td><a href="https://github.com/pkgcloud/pkgcloud/blob/master/docs/providers/openstack/getting-started-compute.md">Getting Started Guide</a></td>
          <td>pkgcloud</td>
        </tr>
        <tr>
          <td>PHP</td>
          <td><a href="http://docs.php-opencloud.com/en/latest/getting-started-with-openstack.html">Getting Started Guide</a></td>
          <td>php-opencloud</td>
        </tr>
        <tr>
          <td>Python</td>
          <td><a href="http://python-openstacksdk.readthedocs.org/en/latest/users/index.html">Getting Started Guide</a></td>
          <td>Python OpenStack SDK</td>
        </tr>
        <tr>
          <td>Ruby</td>
          <td><a href="https://github.com/fog/fog/blob/master/lib/fog/openstack/docs/getting_started.md">Getting Started Guide</a></td>
          <td>Fog</td>
        </tr>
      </tbody>
    </table>

8. To work with OpenStack via the API:

        curl -s -X POST http://my.ip.v4.address:5000/v2.0/tokens -d '{"auth": {"passwordCredentials": {"username":"demo", "password":"MY_DEVSTACK_PASSWORD"}, "tenantName":"demo"}}' -H "Content-type: application/json" | python -m json.tool

    See the [Getting Started Guide](http://docs.openstack.org/api/quick-start/content/) and the [Complete Reference](http://developer.openstack.org/api-ref.html).

9. To access your DevStack screen session:

        sudo chmod o+rwx /dev/pts/0
        screen -r stack

    See the [Quick Reference](http://aperiodic.net/screen/quick_reference).

### local.conf.template
<script src="http://gist-it.appspot.com/github/everett-toews/devstacker/blob/master/local.conf.template"></script>

## Automate It

The above instructions are meant to be very accessible and educational for those new to OpenStack and DevStack. But sometimes DevStack instances don't last that long. They fail in some way and it's *never* worth troubleshooting a failed DevStack instance. It's much easier to just terminate the VM and start over, in which case you can wind up doing the instructions above over and over. Clearly this calls for some automation.

There are many ways you can automate starting a VM in the cloud and running DevStack on it. You could do it with a bash script, a script in another language, Vagrant, Ansible, or whatever. To keep things relatively simple and educational with a minimum of installation we're going to use a bash script.

There are a few extras steps before you automate everything.

_Note_: We're creating these resources in the Northern Virgina (IAD) region.

1. Go to the [Cloud Control Panel](https://mycloud.rackspace.com/)
2. Click Server > SSH Keys
  1. Key Name: devstacker
  1. Region: Northern Virgina (IAD)
  1. Public Key: Paste in a public key
    * See how to [Generate a new SSH key pair](http://www.rackspace.com/knowledge_center/article/connecting-to-a-server-using-ssh-on-linux-or-mac-os#SSH_keygen) (save the key as `$HOME/.ssh/id_rsa.devstacker`)
3. [Install python-novaclient](http://docs.openstack.org/user-guide/content/install_clients.html). For the instructions on that page, replace _`PROJECT`_ with `nova`.
4. [Install git](http://git-scm.com/downloads).
5. Set some environment variables:

        export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
        export OS_REGION_NAME=IAD
        export OS_TENANT_ID=MY_RACKSPACE_ACCOUNT_ID
        export OS_USERNAME=MY_RACKSPACE_USERNAME
        export OS_PASSWORD=MY_RACKSPACE_PASSWORD

    `MY_RACKSPACE_ACCOUNT_ID` is found in the top right corner of the [Cloud Control Panel](https://mycloud.rackspace.com/) under Account

6. Run these commands:

        git clone https://github.com/everett-toews/devstacker.git
        cd devstacker
        ./devstacker.sh MY_OPENSTACK_VERSION MY_DEVSTACK_PASSWORD

    e.g. ./devstacker.sh kilo ajbk4389iuKjknab1

## Coda

This will be my last post on running DevStack. By making a couple of replacements this should work with future versions of DevStack for a long time to come. I'll keep this post up-to-date for as long as I'm able to so if you run into problems, please let me know in the comments and I'll fix it. Happy DevStackering!
