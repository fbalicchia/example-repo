kind create cluster --config ./clusterconfig-1.27.0.yaml --name learing-scheduler
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl create serviceaccount -n kubernetes-dashboard admin-user
kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
#token=$(kubectl -n kubernetes-dashboard create token admin-user)

