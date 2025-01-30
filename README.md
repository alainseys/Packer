# Packer
In this project you will find a collection of vm templates that can be created on vmware or proxmox virtualisation platforms.
This allows you to create standarized vms and you can make them comply with any policy of choice.

I will add the ansible playbooks when the packer images are present in this GIT repo so you have a reference how to use this with ansible.

## Passwords
The passwords are encrypted in the preseed config files using openssl
```shell openssl passwd -6 yourpasswordhere ```
mkpasswd -m sha-512 -S saltsalt yourpassword

## Tech used
🧊 [Proxmox](https://github.com/ChristianLempa/boilerplates/tree/main/packer/proxmox)

🧊 [Vcenter](https://www.vmware.com/products/cloud-infrastructure/vcenter)

🧊 [Vscode](https://code.visualstudio.com/)

🧊 [Mobaxterm](https://mobaxterm.mobatek.net/)

🧊 [Ansible](https://docs.ansible.com/)

🧊 [Awx](https://github.com/ansible/awx)

## Used Resources
[Packer](https://www.packer.io/)

[Packer Proxmox](https://developer.hashicorp.com/packer/integrations/hashicorp/proxmox/latest/components/builder/iso)

[Packer Vcenter](https://developer.hashicorp.com/packer/integrations/hashicorp/vsphere/latest/components/builder/vsphere-iso)

[ChristionLempa Boiler plates (specialy for the boot commands)](https://github.com/ChristianLempa/boilerplates/tree/main/packer/proxmox)