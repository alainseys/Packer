##################################################################################
# VARIABLES
##################################################################################

# Credentials

vcenter_username                = "sysadmin@vsphere.local"
vcenter_password                = "password-vcenter"

# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = "vcenter.yourdomain.local"
vcenter_datacenter              = "EDC"
vcenter_host                    = "ESX-01"
vcenter_datastore               = "DS-01"
vcenter_network                 = "defaultvlan"
vcenter_folder                  = "templates"

# ISO Objects
iso_path                        = "[DS-01] Rocky-9.3-x86_64-minimal.iso"
