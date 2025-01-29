##################################################################################
# VARIABLES
##################################################################################

# HTTP Settings

http_directory = "http"
vm_name                     = "Debian-Linux-12.8.0-x64-min-80GB-Thin"
vm_guest_os_type            = "debian8_64Guest"
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
iso_url			    = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.8.0-amd64-netinst.iso"
iso_file		    = "debian-12.8.0-amd64-netinst.iso"
iso_checksum		    = "04396d12b0f377958a070c38a923c227832fa3b3e18ddc013936ecf492e9fbb3"
iso_checksum_type	    = "sha256"
shell_scripts               = ["./scripts/bootstrap.sh"]

#########################################################################################################
# DOCUMENTATION RESOURCES
#########################################################################################################
# SHA256 Verification: certutil -hashfile yourfile.iso SHA256
# https://knowledge.broadcom.com/external/article?legacyId=1003746
# https://docs.vmware.com/en/VMware-HCX/4.9/hcx-user-guide/GUID-D4FFCBD6-9FEC-44E5-9E26-1BD0A2A81389.html
