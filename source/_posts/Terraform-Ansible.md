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
  * The local-exec method calling ansible from Terraform
  * Using a tool to create a dynamic ansible inventory from the `.tfstate`
  * Create an Ansible inventory from Terraform

I tried several of these methods and the one which worked best for me was to have terraform generate an Ansible inventory. This solution was simple yet functional for our organization. We have no need to maintain the `.tfstate` long-term as we're only needing terraform to stand up several long-running VMs which will be maintained & patched. This may seem like the old-school method of infrastructure as code, because it is, but it works and works well. I've created a [Github repo](https://github.com/nicholasvmoore/terraform-ansible-inventory) as an example.

# Terraform templatefile()
The key to getting Terraform to generate a file from the `.tfstate` is the `templatefile()` function. Several attempts at getting this to work included using a `null_resource` with a local-exec but that failed to loop properly when generating the inventory from my template and that's where `templatefile()` came in handy.

## HCL Code
```
######################################
# Terraform Ansible Inventory Creation
######################################
data "template_file" "hosts" {
  template              = templatefile("${path.module}/templates/hosts.tpl", { default_ip_address = ["${vsphere_virtual_machine.vm.*.default_ip_address}"]}
  )
}

resource "null_resource" "hosts" {
  triggers              = {
    template_rendered   = "${data.template_file.hosts.rendered}"
  }
  provisioner "local-exec" {
    command             = "echo '${data.template_file.hosts.rendered}' > '${path.module}/ansible/hosts.yml'"
  }
}
```

## Template hosts.tpl
```
all:
  hosts:
%{ for addr in default_ip_address ~}
    ${addr}:
%{ endfor ~}
```

# References
[Github Code Repo](https://github.com/nicholasvmoore/terraform-ansible-inventory)
[Terraform Templates](https://www.terraform.io/docs/configuration/expressions.html#string-templates)