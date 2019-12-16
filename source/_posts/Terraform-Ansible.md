---
title: Terraform & Ansible
date: 2019-12-16 13:51:35
tags: 
  - terraform
  - ansible
  - devops
  - vmware
  - hcl
  - yaml
---
I'm sure many of you have stumbled across the article [Ansible and HashiCorp: Better Together](https://www.hashicorp.com/resources/ansible-terraform-better-together) and wondered, how can I do this in my environment? I, like many folks, really wanted to think that Terraform could configure a VM while its deploying the rest of the infrastructure. Y'know, that whole frying of an instance from a baked image. This may work in very simple, caveat free, environments who have little technological baggage. Unfortunately, that's not the world we all live in. This led me down the path of investigating a potential cooperation between Terraform & Ansible of which there are a few options:
  * The [Ansible provisioner](https://github.com/radekg/terraform-provisioner-ansible)
  * The remote-exec method of calling ansible from Terraform
  * 