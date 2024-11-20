# Packer
Diferent packer builds

## Installation
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install packer
packer plugins install github.com/hashicorp/vsphere
```

## Get sha256sum of iso
``sha256sum name-of-your-iso-file.iso``
