kind create cluster --config clusterconfig-1.24.1.yaml --name argocd
kubectl create ns argocd
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.7/manifests/install.yaml -n argocd
kubectl create ns org-147
#Check password
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d