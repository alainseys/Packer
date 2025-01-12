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
