kubectl create ns metrics
helm install prometheus prometheus-community/kube-prometheus-stack --values $PWD/values-latest.yaml -n metrics
kubectl apply -f $PWD/fix-app.yaml -n default
kubectl apply -f $PWD/service-monitor-definition.yaml -n default