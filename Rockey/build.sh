#!/bin/bash

packer build -force -on-error=ask -var-file variables.pkvar-80GB.hcl -var-file vsphere.pkrvars.hcl oracle.pkr.hcl
