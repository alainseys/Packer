variable proxmox_api_url {
    type = string
    description = "The proxox api url"
}
variable proxmox_api_token_id {
    type = string
}

variable proxmox_api_token_secret {
    type = string
}
variable http_directory {
  type    = string
  description = "Directory of config files(user-data, meta-data)."
  default = "http"
}

variable proxmox_insecure_connection {
    type = bool
    description = "If true, does not validate the TLS certificate"
    default = true
}

variable proxmox_host {
    type = string
    description = "The Proxox active node where the target vm is created"
    default = ""
}

variable proxmox_vm_id {
    type = string
    description = "The proxmox vm id to create template (unique)"
    default = "103"
}

variable vm_name{
    type = string
    description = "The template vm name"
    default = ""
}

variable vm_cores{
    type = number
    description = "The number of virtual cpu cores per socket"
}

variable vm_sockets {
    type = number
    description = "The number of virtual sockets"
}

variable vm_mem_size{
    type = number
    description = "The size for the virtual memory in MB"
}

variable vm_disk_size {
    type = string
    description = "The size for the virtual disk in GB "
}

variable vm_disk_format {
    type = string
    description = "The format of disk to use"
    default = "raw"
}



variable vm_storage_pool {
    type = string
    description = "the storage pool to use"
}
variable vm_storage_pool_type{
    type = string
    description = "The storage pool type to user"
    default = ""
}
variable "vm_storage_type"{
    type = string
    description = "The storage type (eg: virtio)"
}

variable iso_storage_pool {
    type = string
    description = "The iso storage pool name"
    default = ""
}
variable vm_network_model{
    type = string
    description = "The type of the network interface"
    default = "virtio"
}
variable vm_network_bridge{
    type = string
    description = "the bridge to user"
    default = "vmbr0"
}
variable vm_network_firewall{
    type = bool
    description = "If true firewall will be enable at hypervisor level"
    default = false
}

variable iso_unmount{
    type = bool
    description = "If true the iso wil be unmounted when install is done"
    default = true
}

variable qemu_agent {
    type = bool
    description = "If ture the qemu agent wil be installed"
    default = true
}
variable scsi_controller {
    type = string
    description = "The correct naming convention of the scsi_controller"
    default = ""
}
variable ssh_username {
    type = string
    description = "The username to use to test the ssh functionality"
}
variable ssh_password {
    type = string
    description = "The ssh password to authenticate the ssh user"
}
variable iso_file{
    type = string
    description = "The location of the iso"
}
variable iso_checksum {
     type = string
    description = "The iso checksum"
}

variable shell_scripts{
    type = string
    description = "The download url"
}
variable template_description {
   type = string
   description = "The tempalte description"
}
source "proxmox" "ubuntu-server-focal" {

    # Proxmox connection settings
    proxmox_url = "${var.proxmox_api_url}"
    username =  "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    insecure_skip_tls_verify = "${var.proxmox_insecure_connection}"


    # VM Settings
    template_description = "${var.template_description}"
    node = "${var.proxmox_host}"
    vm_id = "${var.proxmox_vm_id}"
    vm_name = "${var.vm_name}"
    # CPU
    cores = "${var.vm_cores}"
    sockets = "${var.vm_sockets}"
    # Memory
    memory = "${var.vm_mem_size}"
    # Storage
    scsi_controller = "${var.scsi_controller}"
    disks {
        disk_size = "20G"
        format = "${var.vm_disk_format}"
        storage_pool = "${var.vm_storage_pool}"
        storage_pool_type = "${var.vm_storage_pool_type}"
        type = "${var.vm_storage_type}"
    }
    # Networking
    network_adapters {
        model = "${var.vm_network_model}"
        bridge = "${var.vm_network_bridge}"
        firewall = "${var.vm_network_firewall}"
    }
    # ISO Part
    boot_iso {
        type = "scsi"
        iso_file = "${var.iso_file}"
        unmount = "${var.iso_unmount}"
        iso_checksum = "${var.iso_checksum}"
    }
    qemu_agent = "${var.qemu_agent}"

    # Cloud Init
    cloud_init = true
    cloud_init_storage_pool = "${var.vm_storage_pool}"

    #boot_command = [
    #    "e<down><down><down><end>",
    #    " autoinstall ds=nocloud;",
    #    "<F10>"
    #]
    # PACKER Boot Commands
    boot_command = [
        "<esc><wait>",
        "e<wait>",
        "<down><down><down><end>",
        "<bs><bs><bs><bs><wait>",
        "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
        "<f10><wait>"
    ]
    boot = "c"
    boot_wait = "5s"
    http_directory = "${var.http_directory}"
    ssh_username = "${var.ssh_username}"
    ssh_password = "${var.ssh_password}"
    #ssh_private_key_file = "${var.ssh_private_key_file}"
    ssh_timeout = "20m"


}
##################################################################################
# BUILD
##################################################################################
build {
    name = "build-ubuntu-server"
    sources = ["source.proxmox.ubuntu-server-focal"]

 # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
    provisioner "shell" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo rm /etc/ssh/ssh_host_*",
            "sudo truncate -s 0 /etc/machine-id",
            "sudo apt -y autoremove --purge",
            "sudo apt -y clean",
            "sudo apt -y autoclean",
            "sudo cloud-init clean",
            "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
            "sudo sync"
        ]
    }

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #2
    provisioner "file" {
        source = "files/99-pve.cfg"
        destination = "/tmp/99-pve.cfg"
    }

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #3
    provisioner "shell" {
        inline = [ "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg" ]
    }

    # Provisioning the VM Template with Docker Installation #4
    provisioner "shell" {
        inline = [
            "sudo apt-get install -y ca-certificates curl gnupg lsb-release",
            "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
            "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
            "sudo apt-get -y update",
            "sudo apt-get install -y docker-ce docker-ce-cli containerd.io"
        ]
    }
}
