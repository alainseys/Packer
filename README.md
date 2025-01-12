# Packer
Diferent packer builds

### Changelog
- 20/11/2024: Updated Rockelinux to version v9.5
- 12/01/2025: Added Ubuntu configuration

## Installation
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install packer
packer plugins install github.com/hashicorp/vsphere
```

## Get sha256sum of iso
``sha256sum name-of-your-iso-file.iso``

## Running the builds
In evry version of the packerbuild projects you can find a build.sh file when you run this the automated process is executed.

```
chmod +x build.sh
.\build.sh
```
