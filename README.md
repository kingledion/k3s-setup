# k3s-setup

### Local machine setup

 - Execute `k3s-server`
 - Find the local ip address of our machine
 - Find the K3S token, by `sudo cat /var/lib/rancher/k3s/server/node-token`
 - Store the token in a secure online location

 ### Intall agents and connect to master

  - Execute `k3s-server <ip> <token>` with values from above
  
