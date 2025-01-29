##################################################################################
# VARIABLES
##################################################################################

# HTTP Settings

http_directory = "http"
vm_name                     = "Ubuntu-24.04.1-min-80GB-Thin"
vm_guest_os_type            = "ubuntu64Guest"
vm_version                  = 14
vm_firmware                 = "bios"
vm_cdrom_type               = "sata"
vm_cpu_sockets              = 2
vm_cpu_cores                = 1
vm_mem_size                 = 4048
vm_disk_size                = 102400
thin_provision              = true
disk_eagerly_scrub          = false
vm_disk_controller_type     = ["pvscsi"]
vm_network_card             = "vmxnet3"
vm_boot_wait                = "5s"
ssh_username                = "ansible"
ssh_password                = "Unecrpted password here"
# ISO Objects

#DVD Installer
iso_url			    = "https://releases.ubuntu.com/noble/ubuntu-24.04.1-live-server-amd64.iso"
# sha256sum ubuntu-24.04.1-live-server-amd64.iso
iso_file		    = "ubuntu-24.04.1-live-server-amd64.iso"
iso_checksum		    = "e240e4b801f7bb68c20d1356b60968ad0c33a41d00d828e74ceb3364a0317be9"
iso_checksum_type	    = "sha256"
shell_scripts               = ["./scripts/bootstrap.sh"]