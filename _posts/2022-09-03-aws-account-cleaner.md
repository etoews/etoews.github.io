---
author: Everett Toews
comments: true
date: 2022-09-03 10:00:00+00:00
future: true
layout: post
slug: aws-account-cleaner
title: AWS Account Cleaner
image: /img/posts/be-a-tidy-kiwi-modern.jpg
categories:
  - devops
  - aws
---
<img class="img-right" src="{{ page.image }}"/>Whether you're new to AWS and just learning or you're a seasoned veteran, working with AWS usually involves extensive experimentation. That means constantly creating, reading, updating, and deleting resources as you experiment. However, sometimes you forget to delete something or AWS automatically creates associated resources that you might not even be aware of that don't get automatically deleted. It can all amount to considerable cruft in your account, which can be quite costly in terms of dollars or cognitive load as you have to sift through resources and question whether or not they are actually necessary. Be a tidy Kiwi and keep your AWS account clean!

<!--more-->

<!-- TOC -->

* [Choosing an AWS Account Cleaner](#choosing-an-aws-account-cleaner)
* [Using AWSweeper](#using-awsweeper)
* [Installation](#installation)
* [Configuration](#configuration)
* [Dry Run](#dry-run)
* [Tag Filters](#tag-filters)
* [Tag Filters Example](#tag-filters-example)
* [Including More Resources](#including-more-resources)
* [Coda](#coda)

<!-- /TOC -->

I have a corporate sandbox AWS account with a pre-determined budget that I can use for experimentation. As I was studying for the AWS Solution Architect Associate certification, I used this sandbox account for the hands-on labs that I was doing as part of my study. After completing just a couple of labs, I already noticed there were numerous resources that I had forgotten to delete or wasn't even sure where they came from. Wanting to be a tidy Kiwi, I immediately went on the hunt for a tool that could help.

## Choosing an AWS Account Cleaner

<img class="img-right" src="/img/posts/be-a-tidy-kiwi.jpeg"/>There are a number of tools that can do the job to keep an AWS account clean. I won't go into an exhaustive comparison but I was primarily looking for a tool that met the following requirements.

* Works well with AWS resource tags (important for accounts following the best practices for [Tagging AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html))
* Supports a majority of AWS resources
* Reasonably well maintained

In the end, I chose [AWSweeper](https://github.com/jckuester/awsweeper). It is flexible in how it works with resources tags, supports many AWS resources by leveraging the AWS Terraform provider, and is reasonably well maintained with many thanks to its maintainer and contributors!

## Using AWSweeper

AWSweeper has [good documentation](https://github.com/jckuester/awsweeper#readme) so I'll just provide my experience with using it.

## Installation

By far, the fastest way to start using it is via [CloudShell](https://aws.amazon.com/cloudshell/). In a CloudShell session, follow the [installation instructions](https://github.com/jckuester/awsweeper#binary-releases). Double check that you're using the most recent [release](https://github.com/jckuester/awsweeper/releases).

```bash
[cloudshell-user@ip-10-0-189-11 ~]$ curl -sSfL https://raw.githubusercontent.com/jckuester/awsweeper/master/install.sh | sh -s v0.12.0
jckuester/awsweeper info checking GitHub for tag 'v0.12.0'
jckuester/awsweeper info found version: 0.12.0 for v0.12.0/linux/amd64
jckuester/awsweeper info installed ./bin/awsweeper

[cloudshell-user@ip-10-0-189-11 ~]$ awsweeper --version
version: 0.12.0
commit: 09952ce
built at: 2022-02-08T22:59:30Z
using: go1.17.3
```

## Configuration

AWSweeper requires a YAML file to configure it. Keep it simple to start and begin with exactly one resource type.

Create a file called `awsweeper.yaml` and add this one line.

```yaml
aws_instance:
```

## Dry Run

Always do a dry-run of AWSweeper first before you do anything else. That gives you a baseline of what resources are already in your account.

```bash
[cloudshell-user@ip-10-0-182-207 ~]$ awsweeper --dry-run awsweeper.yaml

   • SHOWING RESOURCES THAT WOULD BE DELETED (DRY RUN)

        ---
        Type: aws_instance
        Found: 3

                Id:             i-0250d2cd1c2640b16
                Tags:           [Name: Important] [Purpose: Prod]
                Created:        2022-09-02 04:56:30 +0000 UTC

                Id:             i-0221ae44df26eba10
                Tags:           [Name: Temporary] [Purpose: Experiment]
                Created:        2022-09-02 04:56:30 +0000 UTC

                Id:             i-0958016c7117fe5df
                Tags:           [Name: No Purpose]
                Created:        2022-09-02 23:08:49 +0000 UTC

        ---

   • TOTAL NUMBER OF RESOURCES THAT WOULD BE DELETED: 3
```

We see that there are a couple of EC2 instances in this account. They would be deleted if we weren't doing a dry-run but even when you're doing a real-run, there's a confirmation step before anything is actually deleted.

## Tag Filters

Using tag filters lets us control what AWSweeper deletes. The tag filters are pretty good but they take some getting used to. When a tag matches, that means the resource(s) are to be deleted. I found I had to do an example table like the one below for a resource to get a feel for how the "NOT" operator works for tag filters.

The "Purpose" table headers below mean the EC2 instance has that tag or not.

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Filter</th>
      <th>Purpose:&nbsp;Experiment</th>
      <th>Purpose:&nbsp;Prod</th>
      <th>No Purpose tag</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <pre>
- tags:
    Purpose:&nbsp;Experiment</pre>
      </td>
      <td>Delete</td>
      <td>Keep</td>
      <td>Keep</td>
    </tr>
    <tr>
      <td>
        <pre>
- tags:
    Purpose:&nbsp;NOT(Experiment)</pre>
      </td>
      <td>Keep</td>
      <td>Delete</td>
      <td>Keep</td>
    </tr>
    <tr>
      <td>
        <pre>
- tags:
    NOT(Purpose):&nbsp;Experiment</pre>
      </td>
      <td>Keep</td>
      <td>Delete</td>
      <td>Delete</td>
    </tr>
    <tr>
      <td>
        <pre>
- tags:
    NOT(Purpose):&nbsp;NOT(Experiment)</pre>
      </td>
      <td>Delete</td>
      <td>Keep</td>
      <td>Delete</td>
    </tr>
  </tbody>
</table>

## Tag Filters Example

To use a tag filter, include it below the resource type you want to filter in `awsweeper.yaml`.

For example.

```yaml
aws_instance:
- tags:
    Purpose: Experiment
```

That tag filter would delete any EC2 instance tagged with `Purpose: Experiment`.

```bash
[cloudshell-user@ip-10-0-182-207 ~]$ awsweeper --dry-run awsweeper.yaml

   • SHOWING RESOURCES THAT WOULD BE DELETED (DRY RUN)

        ---
        Type: aws_instance
        Found: 1

                Id:             i-0221ae44df26eba10
                Tags:           [Name: Temporary] [Purpose: Experiment]
                Created:        2022-09-02 04:56:30 +0000 UTC

        ---

   • TOTAL NUMBER OF RESOURCES THAT WOULD BE DELETED: 1
```

## Including More Resources

Add more resources to your `awsweeper.yaml` file one by one or in small batches between dry-runs. This enables you build up your understanding of how AWSweeper will affect the resources. As you go, add tags to your resources and your `awsweeper.yaml` file as necessary to ensure nothing important gets deleted accidentally.

For example.

```yaml
aws_instance:
- tags:
    Purpose: Experiment
aws_key_pair:
- tags:
    Purpose: Experiment
aws_security_group:
- tags:
    Purpose: Experiment
```

These tag filters would delete any of those resources with tag `Purpose: Experiment`.

```bash
[cloudshell-user@ip-10-0-182-207 ~]$ awsweeper --dry-run awsweeper.yaml

   • SHOWING RESOURCES THAT WOULD BE DELETED (DRY RUN)

        ---
        Type: aws_instance
        Found: 1

                Id:             i-0221ae44df26eba10
                Tags:           [Name: Temporary] [Purpose: Experiment]
                Created:        2022-09-02 04:56:30 +0000 UTC

        ---


        ---
        Type: aws_key_pair
        Found: 1

                Id:             EC2 Tutorial
                Tags:           [Purpose: Experiment]

        ---

   • TOTAL NUMBER OF RESOURCES THAT WOULD BE DELETED: 2
```

After many rounds of adding resources from the list of [Supported resources](https://github.com/jckuester/awsweeper#supported-resources), you'll wind up with a file that looks like [awsweeper.yaml](https://gist.github.com/etoews/fe197bf00c732bc2e30395175dc37acc).

## Coda

<p class="note">AWSweeper is a very useful tool but can be quite dangerous too. Take care to always do a dry-run before executing it for a real-run.<p>

Personally I find running AWSweeper fascinating. It gives you some real insight into what AWS is doing and how its services are stitched together.

Of course it also does an excellent job of keeping your AWS Account free of cruft and helps keep costs down to boot!
