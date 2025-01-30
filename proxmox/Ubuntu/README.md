# Ubuntu on Proxmox
How to use this ? 
- Install packer
- Install the plugin (packer plugins install github.com/hashicorp/proxmox-iso)
- Copy template.credentials.hcl to credentials.pkr.hcl
- Navigate to http/user-data & update the password ssl encrypted format (or plain text, you will need update the code then)
- Run ```shell chmod +x build.sh``` followed by ```shell sh ./build.sh ``` to start the deployment.

Notice this uses a fixed number of vm if the vm number is in use this will not automaticly jump to a new id.

