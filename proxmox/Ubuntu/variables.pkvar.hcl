##################################################################################
# VARIABLES
##################################################################################
# HTTP Settings
vm_storage_pool = "local-lvm"
vm_storage_type = "scsi"
proxmox_host = "DC2-PVE-01"

http_directory = "http"
vm_name                     = "Ubuntu-24.04.1-min-80GB-Thin"
vm_cores                     = 2
vm_sockets                  = 1
vm_mem_size                 = 4048
vm_disk_size                = "20G"
ssh_username                = "ansible"
proxmox_vm_id               = 104
# ISO Objects

#DVD Installer
iso_file                     = "local:iso/ubuntu-24.04.1-live-server-amd64.iso"
# sha256sum ubuntu-24.04.1-live-server-amd64.iso
iso_checksum                = "e240e4b801f7bb68c20d1356b60968ad0c33a41d00d828e74ceb3364a0317be9"
iso_checksum_type           = "sha256"
shell_scripts               = ""
template_description = "The tempalte dscription here"
iso_storage_pool = "local"
