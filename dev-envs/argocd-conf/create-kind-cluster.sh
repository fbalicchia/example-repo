kind create cluster --config ./clusterconfig-1.24.1.yaml --name argocd
kubectl create ns argocd
#kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.7/manifests/install.yaml -n argocd
kubectl apply -f ./install-argocd.yaml -n argocd
echo "####### CREARTE NAMESPACE #############"
kubectl create ns org-147
kubectl create ns org-148
kubectl create ns argo-rollouts
kubectl create ns paas-application-staging
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl create serviceaccount -n kubernetes-dashboard admin-user
kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
#token=$(kubectl -n kubernetes-dashboard create token admin-user)
