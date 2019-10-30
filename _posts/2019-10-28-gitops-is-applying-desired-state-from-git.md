---
author: Everett Toews
comments: true
date: 2019-10-28 10:00:00+00:00
layout: post
slug: gitops-is-applying-desired-state-from-git-to-a-runtime-environment
title: GitOps is Applying Desired State from Git to a Runtime Environment
image: /img/posts/git1.png
categories:
  - git
  - ops
---
<img class="img-right" src="{{ page.image }}"/>I recently did an ignite talk at DevOpsDays Auckland 2019 titled "[Is GitOps worthy of the [BuzzWord]Ops moniker?](https://devopsdays.org/events/2019-auckland/program/everett-toews/)". It's a purposefully inane title but, while doing the deck for the talk, I had a chance to really reflect on question "What is GitOps?".

<!--more-->

## Definition

There have been a number of definitions of GitOps offered. Most notably from WeaveWorks, the people who [coined the term GitOps](https://www.weave.works/technologies/gitops/). However, I found that their definition is very Kubernetes centric and doesn't capture the essential elements of a what is actually a more general technique.

To start, GitOps is the same general Git workflow we've known for years with one simple additional step.

1. Pull request
1. Review
1. Merge
1. Action

It's that last step that distinguishes GitOps from the usual Git workflow. Automatically taking action when a commit is merged. That action takes place in a reconciliation system, which is triggered by a push or pull event. That reconciliation system then applies the desired state from Git to a runtime environment.

At a high level it looks like this.

<img src="/img/posts/reconciliation-system.jpg"/>

Some examples of the various pieces (the table is meant to be read column-wise).

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Git</th>
      <th>Push</th>
      <th>Pull</th>
      <th>Reconciliation System</th>
      <th>Reconcile</th>
      <th>Runtime Environment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>GitHub</td>
      <td>Webbook</td>
      <td>Poll</td>
      <td>Flux</td>
      <td>SSH</td>
      <td>Kubernetes</td>
    </tr>
    <tr>
      <td>GitLab</td>
      <td></td>
      <td></td>
      <td>Jenkins</td>
      <td>File transfer</td>
      <td>Cloud (AWS, Azure, GCP, etc.)</td>
    </tr>
    <tr>
      <td>Bitbucket</td>
      <td></td>
      <td></td>
      <td>ArgoCD</td>
      <td>API call</td>
      <td>A DNS server</td>
    </tr>
  </tbody>
</table>

Git is not only the source of truth for your source code but it also becomes the source of truth for your runtime environment.

<p class="note">GitOps is applying desired state from Git to a runtime environment.</p>

## Use Cases

Here are a handful of use cases of where you could apply GitOps. Of course, it's is not limited to these and I'd be interested to hear if you've applied GitOps to any other use cases.

### Deployment

Deployment is one of the most common use cases for GitOps. You need to deploy a new version of some software to an environment so you make a change in Git and that software is automatically deployed to your runtime environment. [Flux](https://fluxcd.io/) is a Kubernetes operator for doing so. I also built a system for doing so that I wrote about in [GitOps Driven Deployments on OpenShift]({% post_url 2019-04-16-gitops-driven-deployments-on-openshift %}).

### Infrastructure

Infrastructure as Code (IaC) (e.g. Terraform, CloudFormation, etc.) is perhaps the canonical use case for GitOps. You need to change your infrastructure in some way (e.g. add a VM) so you update your IaC in Git and that change is automatically run on your infrastructure. This can be done by your reconciliation system executing commands that apply the configuration to the infrastructure.

### DNS

I found the paper [GitOps: A Path to More Self-service IT](https://queue.acm.org/detail.cfm?id=3237207) by Thomas A. Limoncelli really inspirational. The author does an excellent job of describing GitOps in much more general terms. The primary use case he offers as an example is for DNS.

In the author's own words,

> Initially the DNSControl configuration file (dnsconfig.js) is stored in Git. A CI system is configured so that changes trigger the test-and-push cycle of DNSControl, and updates to the file result in the changes propagating to the DNS providers. This is a typical IaC pattern. When changes are needed, someone from the IT team updates the file and commits it to Git.

### On/Off Boarding

## Barriers

## Benefits

## Coda

It's been six months since I wrote about a system
