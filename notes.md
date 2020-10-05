#### Encrypting a file using travis

```bash
docker run -it -v $(pwd):/app ruby:2.4 sh
gem install travis
cd app
travis encrypt-file <SECRET-FILE> -r <USER/REPO>
```

#### Configure gcloud

```bash
gcloud config set compute/zone <ZONE>
gcloud config set project <PROJECT>
gcloud container clusters get-credentials <CLUSTER>
```

#### Install helm on gcloud console

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

#### Install nginx on gcloud console

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install my-release ingress-nginx/ingress-nginx
```

IMPORTANT: If you get an error such as chart requires kubeVersion: >=1.16.0-0..... you may need to manually upgrade your cluster to at least the verison specified:

```bash
gcloud container clusters upgrade  <YOUR_CLUSTER_NAME> --master --cluster-version 1.16
helm install my-release ingress-nginx/ingress-nginx
```

#### Create kubernetes secret

```bash
kubectl create secret generic <SECRET-NAME> --from-literal <KEY=VALUE pair of secret>
# E.g. - kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
```
