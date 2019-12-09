---
title: PXE Install ESXi
tags:
	- vmware
	- esxi
	- dhcp
	- pxe
	- tftp
	- cisco
	- ucs
---
Throughout my career, I've been through the ESXi installer more times than I care to admit, if I never have to confirm the root password again, I'd be ecstatic. It's true that today having service profile based blade centers greatly reduce the number of ESXi installs. But, there comes a time where you have to do a large scale deployment. Say for instance you have an 2,000 concurrent user VDI footprint comprising 32 hosts spanning two datacenters and 4 Cisco UCS failure domains, installing ESXi is less than exciting.

I chose to automate this using PXE, yeah, TFTP still hasn't gone the way of IPX or Token Ring yet!

## Network Design

## DHCP Scope

## TFTP Server config

## NGINX Server Config

## ESXi Kickstart