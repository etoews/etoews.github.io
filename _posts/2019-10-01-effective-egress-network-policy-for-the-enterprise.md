---
author: Everett Toews
comments: true
date: 2019-10-01 10:00:00+00:00
layout: post
slug: effective-egress-network-policy-for-the-enterprise
title: Effective Egress Network Policy for the Enterprise
image: /img/posts/git1.png
categories:
  - network
  - kubernetes
  - openshift
  - platform
---
<img class="img-right" src="{{ page.image }}"/>

<!--more-->

## Egress Network Policy


minikube start \
    --network-plugin=cni \
    --enable-default-cni \
    --vm-driver=hyperkit \
    --memory=4096mb

kubectl create namespace test-network-policy
kubectl run --generator=run-pod/v1 -i --tty netshoot --image=nicolaka/netshoot -n test-network-policy -- bash

default-deny-all-egress.yaml

kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: default-deny-all-egress
  namespace: default
spec:
  policyTypes:
  - Egress
  podSelector: {}
  egress: []

kubectl apply -f default-deny-all-egress.yaml -n test-network-policy



## Coda
