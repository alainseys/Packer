#!/bin/bash

packer build --var-file=variables.pkvar.hcl --var-file=credentials.pkr.hcl ubuntu.pkr.hcl
