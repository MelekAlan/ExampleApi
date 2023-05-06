# APP-K8S Setup

Documentation of how to set up a newly created cluster.
The commands have to be executed once per cluster. Because of that a Github Pipeline is not required.

## Prerequisites

- Have a fresh Kubernetes cluster installed
- Have `kubectl` and `helm` cli installed
- Downloaded the kubectl `kubeconfig` file and placed it in `~/.ssh/config` (config is the filename here) (this directory is for linux based machines)

## 1. Install Nginx Ingress Controller (HA Webserver with 3 replicas)

- We are installing the NGINX ingress controller from https://kubernetes.github.io/ingress-nginx/
- We set the replica count to 3 to have a high available "Loadbalanced Webserver Cluster"
```shell
kubectl create namespace ingress
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress --set controller.replicaCount=3
```

- The ingress creates a Service of type LoadBalancer with a public IP. Run the following command to get the public IP:
```shell
kubectl get services -ningress
```

- In the test-cluster setup the public IP of the webserver is: 123.45.678.901
- There should be a `404 - nginx` message on http://123.45.678.901/

## 2. Install Cert-Manager (Get auto-renewed Lets-Encrypt HTTPS Certs for your websites)

- For our services to get automatic HTTPS certificates we install CertManager:
```shell
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0 \
  --set installCRDs=true
```
- After installing the CertManager we add a `ClusterIssuer` (see file `CertManagerClusterIssuer.yaml`):
- Note: we create one `ClusterIssuer` in the namespace `ingress` which is available in all namespaces and can be used by all ingresses.
```shell
kubectl apply -f CertManagerClusterIssuer.yaml
```

## 3. Install ArgoCD

- in this section we install ArgoCD + HTTPS domains 
- for now we use argo.dev.example.com

```shell
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install \
  argocd argo/argocd \
  --namespace argocd  \
  --create-namespace
```
- After installing the ArgoCD we add a `ArgoCDValues` (see file `ArgoCDValues.yaml`):

```shell
kubectl apply -f ArgoCDValues.yaml
```
## 4. Namespace setup for our application

- Have a look at the readme at `namespace/README.md`

## 5. ExampleApi setup

- Have a look at the readme at exampleApi/README.md

## 6. Continuous Deployment Options

```shell
- Argo CD
- GitHub Actions Pipeline 
```