echo "BUILDING multi-client"
docker build -t nayaran/multi-client:latest -t nayaran/multi-client:$SHA -f ./client/Dockerfile ./client

echo "BUILDING multi-server"
docker build -t nayaran/multi-server:latest -t nayaran/multi-server:$SHA -f ./server/Dockerfile ./server

echo "BUILDING multi-worker"
docker build -t nayaran/multi-worker:latest -t nayaran/multi-worker:$SHA -f ./worker/Dockerfile ./worker

echo "UPLOADING multi-client"
docker push nayaran/multi-client:latest
docker push nayaran/multi-client:$SHA

echo "UPLOADING multi-server"
docker push nayaran/multi-server:latest
docker push nayaran/multi-server:$SHA

echo "UPLOADING multi-worker"
docker push nayaran/multi-worker:latest
docker push nayaran/multi-worker:$SHA

echo "UPDATING KUBERNETES"
kubectl apply -f k8s

echo "UPDATING KUBERNETES - using latest images"
kubectl set image deployments/server-deployment server=nayaran/multi-server:$SHA
kubectl set image deployments/client-deployment client=nayaran/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=nayaran/multi-worker:$SHA
