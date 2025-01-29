winrm enumerate winrm/config/Listener

New-NetFirewallRule -DisplayName "Allow ansible to machine" -Direction Inbound -Profile Any -Action Allow -LocalPort 5986 -Protocol TCP

