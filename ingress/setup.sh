# install nginx ingress controller
# NOTE update to stable branch v1.0.0 once that is stable out of alpha
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/baremetal/deploy.yaml

# Add a load balancer

# create patch definition
read -d '' ingress << EOF
spec:
  template:
    spec:
      hostNetwork: true
#   
EOF || true 

# apply patch
kubectl patch deployment ingress-nginx-controller -n ingress-nginx --patch "$ingress"