---
title: vSphere Rescan all HBA
tags:
	- vmware
	- powershell
	- powercli
	- snippets
date: 2019-12-08 11:53:06
---

When adding iSCSI or Fiber Channel LUNs to your vSphere cluster, you'll need to rescan the vHBA on all of your hosts. Here's a quick snippet to facilitate that in PowerCLI.

## Single Host
```powershell
Get-VMHost | Get-VMHostStorage -RescanAllHba
```

## Entire Cluster
```powershell
Get-Cluster -Name “GC” | Get-VMHost | Get-VMHostStorage -RescanAllHba
```