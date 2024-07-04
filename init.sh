kind create cluster --name=fc --config=k8s/kind.yml

kubectl cluster-info --context kind-fc
sleep 5

docker build ./go-api -t leonardo/hello-go
docker build ./node-api -t leonardo/hello-express

sleep 5

kind load docker-image leonardo/hello-go --name=fc
kind load docker-image leonardo/hello-express --name=fc

sleep 5

echo -e "Adding metric server\n"
kubectl apply -f k8s/metrics-server.yml

echo -e "Adding local ingress\n"
kubectl apply -f k8s/local-ingress-nginx.yml

echo -e "Waiting for ingress-nginx be ready\n"
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

sleep 10
kubectl apply -f k8s/goserver.yml
kubectl apply -f k8s/namespaces/deployment.yml

echo -e "Adding ingress\n"
kubectl apply -f k8s/ingress.yml