# kubedemo
Kubernetes setup &amp; demos


# demo 0

1) source activate
2) ansible-playbook -K playbooks/virt.yml 
3) minikube dashboard
4) kubectl -n kube-system get pods
5) kubectl create -f  https://k8s.io/examples/controllers/nginx-deployment.yaml
6) kubectl -n default edit pods/nginx-deployment-86d59dd769-6xp86

