# k3s-setup

Set up a 

## Local machine setup

### k3s-install
Execute `k3s-server`

### Set up kubectl access 
 - First method:
```shell
# make sure ~/.kube exists; swallow error if it does
mkdir ~/.kube 2> /dev/null

# create kube config file (for use with helm)
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

# remove group and world read premissions on kube config file
# This may not be required if kubeconfig already has 644 access
sudo chmod u=rw ~/.kube/config
```

   - Second method
```shell
# concat kubeconfigs
export KUBECONFIG=~/.kube/config:/etc/rancher/k3s/k3s.yaml
# make kubeconfig editable to current user (can be done many ways)
sudo chmod 666 config
# Flatten kubeconfig and save as itself
sudo kubectl config view --flatten > ~/.kube/config
```

## Intall agents and connect to master

  - Find IP or lan address of server machine
  - Find node token (requires ssh access and sudo access to server):
```
ssh <user>@<server-address> 'sudo -S cat /var/lib/rancher/k3s/server/node-token'
```

  - Execute `k3s-server <ip> <token>` with values from above


Alternately, follow here: https://pet2cattle.com/2021/11/k3s-multimaster-embedded-db

## Set up k8s dashboard

Install with:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml
```

Get Bearer token:

Access with:
```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```