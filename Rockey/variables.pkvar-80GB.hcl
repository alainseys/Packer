##################################################################################
# VARIABLES
##################################################################################

# HTTP Settings

http_directory = "http"
vm_name                     = "Rockey-Linux-9.4-min"
vm_guest_os_type	    = "rhel7_64Guest"
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
ssh_password                = "123456" 
# ISO Objects


#DVD Installer
iso_url			    = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9.5-x86_64-minimal.iso"
iso_file		    = "Rocky-9.5-x86_64-minimal.iso"
iso_checksum		    = "242f0ecc37417995137507862cb170215c0b5bd512c47badd16b623686ef39e2"
iso_checksum_type	    = "sha256"
shell_scripts               = ["./scripts/bootstrap.sh"]
