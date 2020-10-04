echo "Building the images"
docker build -t nayaran/multi-client ./client
docker build -t nayaran/multi-nginx ./nginx
docker build -t nayaran/multi-server ./server
docker build -t nayaran/multi-worker ./worker

echo "Pushing to docker-hub"
docker push nayaran/multi-client
docker push nayaran/multi-nginx
docker push nayaran/multi-server
docker push nayaran/multi-worker
