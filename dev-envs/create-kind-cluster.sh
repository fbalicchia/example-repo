kind create cluster --config ./conf-files/clusterconfig-1.24.1.yaml --name argocd
kubectl create ns argocd
#kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.7/manifests/install.yaml -n argocd
kubectl apply -f ./conf-files/install-argocd.yaml -n argocd
echo "####### create ns"
kubectl create ns org-147
kubectl create ns org-148
kubectl create ns paas-application-staging
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
#Check password
