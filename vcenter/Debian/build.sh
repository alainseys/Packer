#!/bin/bash
packer build -force -on-error=ask -var-file variables.pkvar-80GB.hcl -var-file vsphere.pkvars.hcl debian.pkr.hcl

