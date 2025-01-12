# Packer
This repository contains terraform build process to build templates on vcenter so all of your machines can use this.
This build is optimized to use in a ansible landscape (my user are herefor called ansible).

My process goes as following:
- Packer Build
- AWX Form (where users can enter the hostname, mem, cpu, annotations)
- AWX communicates with netbox to get a free IP address.
- AWX Registers the IP in netbox
- AWX passes the IP from netbox to the host to create a host record in the inventory file with the correct IP.
- AWX gives command to vcenter to create the vm on vcenter using the passed variables and the network infromation (received earlier from netbox).
- AWX sends a email when the process is finished.

### Changelog
- 20/11/2024: Updated Rockelinux to version v9.5
- 12/01/2025: Added Ubuntu configuration
- 12/01/2025: Updated Readme instructions

## Installation
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install packer
packer plugins install github.com/hashicorp/vsphere
```
## Password Encryption
For the creation of the password i recomend if you store your configuration on Git that you encrypt your password, you can do this with python.

```python3 -c 'import crypt; print(crypt.crypt("Enter your password here", crypt.mksal(crypt.METHOD_SHA512)))' ```
Use the output of this command to update user-data

## Get sha256sum of iso
``sha256sum name-of-your-iso-file.iso``

## Running the builds
In evry version of the packerbuild projects you can find a build.sh file when you run this the automated process is executed.

```
chmod +x build.sh
.\build.sh
```
