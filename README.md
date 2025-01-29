# Packer


## Passwords
The passwords are encrypted in the preseed config files using openssl
```shell openssl passwd -6 yourpasswordhere ```
mkpasswd -m sha-512 -S saltsalt yourpassword
