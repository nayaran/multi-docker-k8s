docker build -t nayaran/multi-client:latest -t nayaran/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t nayaran/multi-server:latest -t nayaran/multi-server:$SHA ./server/Dockerfile ./server
docker build -t nayaran/multi-worker:latest -t nayaran/multi-worker:$SHA ./worker/Dockerfile ./worker
docker push nayaran/multi-client:latest
docker push nayaran/multi-client:$SHA
docker push nayaran/multi-server:latest
docker push nayaran/multi-server:$SHA
docker push nayaran/multi-worker:latest
docker push nayaran/multi-worker:$SHA

kubectl apply k8s
kubectl set image deployments/server-deployment server=nayaran/multi-server:$SHA
kubectl set image deployments/client-deployment client=nayaran/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=nayaran/multi-worker:$SHA
