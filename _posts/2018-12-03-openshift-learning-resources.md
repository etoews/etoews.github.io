---
author: Everett Toews
comments: true
date: 2018-12-03 10:00:00+00:00
layout: post
slug: openshift-learning-resources
title: OpenShift Learning Resources
image: /img/posts/openshift.png
categories:
  - openshift
---
<img class="img-right" src="{{ page.image }}"/>A curated list of learning resources I've used as I've climbed the learning curve on OpenShift.

<!--more-->

## Experiment

Get your hands dirty in a safe environment by using [installing and using MiniShift](https://docs.openshift.org/latest/minishift/index.html).

Or you can skip localhost and use the [Starter plan for OpenShift online](https://www.openshift.com/products/online/).

Good for developers but not as good for learning how to admin an OpenShift cluster.

## Training

* [Interactive Learning Portal](https://learn.openshift.com/)
* [Red Hat Certified System Administrator](https://www.redhat.com/en/services/certification/rhcsa)
* [Red Hat OpenShift Training](https://www.redhat.com/en/services/training/courses-by-curriculum#OpenShift)

## Docs

The [official docs](https://docs.openshift.com/container-platform/latest/welcome/index.html) are quite good.

Note that if you’re Googling for results, most times you wind up at an older version of the docs. It’s usually just a simple matter of editing the URL in your location bar to get to the version you need.

Also note that you can use `latest` in place of the version (as I do in the links below) and you'll be redirected to the latest version of the docs.

### Developer

* [OpenShift 3 Demystified. For Developers](http://platform.deloitte.com.au/articles/2017/openshift-3-demystified-for-developers/)
* [Developer Guide](https://docs.openshift.com/container-platform/latest/dev_guide/index.html)
* [Container Security Guide](https://docs.openshift.com/container-platform/latest/security/index.html)
* [Creating Images](https://docs.openshift.com/container-platform/latest/creating_images/index.html)
* [Using Images](https://docs.openshift.com/container-platform/latest/using_images/index.html)
* [CLI Reference](https://docs.openshift.com/container-platform/latest/cli_reference/index.html)

### Admin

* [Cluster Administration](https://docs.openshift.com/container-platform/latest/admin_guide/index.html)

### Ops

* [Day Two Operations Guide](https://docs.openshift.com/container-platform/latest/day_two_guide/index.html)
* [Upgrading Clusters](https://docs.openshift.com/container-platform/latest/upgrading/index.html)

## Books

These books are a decent intro. However, they both focus heavily on the imperative approach and skip the declarative approach to Infra as Code. Meaning they focus on running a bunch of commands sequentially via the CLI vs declaring the infra as code (manifests) and applying them. The latter being a more mature approach to container management.

* [Deploying to OpenShift](https://www.openshift.com/deploying-to-openshift/)
* [DevOps with OpenShift](https://www.openshift.com/devops-with-openshift/)

## Blogs

To keep up with the rapid evolution I find it very valuable to subscribe to blogs. I’m old school and still use RSS/Atom for this sort of thing with [Feedly](https://feedly.com/).

### OpenShift

* [Red Hat’s official OpenShift blog](https://blog.openshift.com/)
* [Red Hat’s official Developer blog (Containers category)](https://developers.redhat.com/blog/category/topics/containers/)
* [OpenShift category of the Open Sourcerer’s blog](http://www.opensourcerers.org/category/paas/openshift/) (it’s gone a bit quiet)

### Kubernetes/Containers

* [The New Stack](https://thenewstack.io/)
  * All the new and shiny. Vendor heavy. Yet still useful/informative.
* [Kubernetes Blog](https://kubernetes.io/blog/)
* [Technology Conservations](https://technologyconversations.com/)
* [Container Solutions](https://container-solutions.com/blog/)

The last few are Kubernetes related but it gives you a good idea where OpenShift is going.

## Podcasts

* [PodCTL](https://blog.openshift.com/tag/podctl/)
* [Kubernetes Podcast](https://kubernetespodcast.com/)

## Specific Topics

### Networking

* [Understanding kubernetes networking: pods](https://medium.com/google-cloud/understanding-kubernetes-networking-pods-7117dd28727)
* [Understanding kubernetes networking: services](https://medium.com/google-cloud/understanding-kubernetes-networking-services-f0cb48e4cc82)
* [Understanding kubernetes networking: ingress](https://medium.com/google-cloud/understanding-kubernetes-networking-ingress-1bc341c84078)

### Networking Deep Dive

I can't recommend this series highly enough. The back-of-the-napkins diagrams alone are worth the read.

* [Part 1: Container networking on a plain Docker host](http://www.opensourcerers.org/openshift-3-1-networking-from-a-containerworkload-point-of-view-part-1-container-networking-on-a-plain-docker-host/)
* [Part 2: Container networking on an OpenShift node](http://www.opensourcerers.org/openshift-networking-from-a-containerworkload-point-of-view-part-2-container-networking-on-an-openshift-node/)
* [Part 3: Container networking across OpenShift nodes](http://www.opensourcerers.org/openshift-networking-from-a-containerworkload-point-of-view-part-3-container-networking-across-openshift-nodes/)
* [Part 4: Container networking using OpenShift/Kubernetes services](http://www.opensourcerers.org/openshift-networking-from-a-containerworkload-point-of-view-part-3-container-networking-using-openshiftkubernetes-services/)
* [Part 5: OpenShift router](http://www.opensourcerers.org/openshift-networking-from-a-containerworkload-point-of-view-part-5-openshift-router/)
* [Part 6: Controlling egress traffic](http://www.opensourcerers.org/openshift-networking-from-a-containerworkload-point-of-view-part-6-controlling-egress-traffic/)

### Ingress Traffic

* [OpenShift Router Sharding for Production and Development Traffic](https://blog.openshift.com/openshift-router-sharding-for-production-and-development-traffic/)
* [Router Sharding](https://docs.openshift.com/container-platform/3.9/architecture/networking/routes.html#router-sharding)

### Egress Traffic

* [Controlling Egress Traffic](https://docs.openshift.com/container-platform/3.9/admin_guide/managing_networking.html#admin-guide-controlling-egress-traffic)
* [Accessing External Services Using Egress Router](https://blog.openshift.com/accessing-external-services-using-egress-router/)
* [Enabling Static IPs for External Project Traffic](https://docs.openshift.com/container-platform/3.9/admin_guide/managing_networking.html#enabling-static-ips-for-external-project-traffic)
* [How to enable static egress IP in Red Hat OpenShift Container Platform](https://www.redhat.com/en/blog/how-enable-static-egress-ip-red-hat-openshift-container-platform)

### DNS

* [OpenShift 3.6 DNS In Pictures](https://zwischenzugs.com/2017/10/21/openshift-3-6-dns-in-pictures/)

### AuthN

* [Authentication](https://docs.openshift.com/container-platform/latest/architecture/additional_concepts/authentication.html)
* [Configuring Authentication](https://docs.openshift.com/container-platform/latest/install_config/configuring_authentication.html)
* [Syncing Groups With LDAP](https://docs.openshift.com/container-platform/latest/install_config/syncing_groups_with_ldap.html)

### AuthZ

* [Authorization](https://docs.openshift.com/container-platform/latest/architecture/additional_concepts/authorization.html)
* [Managing Role-based Access Control](https://docs.openshift.com/container-platform/latest/admin_guide/manage_rbac.html)
* [Managing Users](https://docs.openshift.com/container-platform/latest/admin_guide/manage_users.html)
* [Users and RBAC Cookbook](https://github.com/openshift-evangelists/openshift-cookbook/tree/master/users-and-role-based-access-control)

### Disaster Recovery

* [Disaster Recovery with Containers? You Bet!](https://keithtenzer.com/2018/03/21/disaster-recovery-with-containers-you-bet/)
