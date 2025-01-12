##################################################################################
# VARIABLES
##################################################################################

# Credentials

vcenter_username                = "ansible@vsphere.local"
vcenter_password                = "yourpassword here"

# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = "vcenter.yourdomain.com"
vcenter_datacenter              = "DC1"
vcenter_host                    = "DC1-HOST1"
vcenter_datastore               = "DC01-VMWARE-LUN1"
vcenter_network                 = "appnetwork"
vcenter_folder                  = "templates"

# ISO Objects
iso_path                        = "[DC01-VMWARE-LUN1] ubuntu-24.04.1-live-server-amd64.iso"
