#!/bin/bash 

echo "`date +%c` [INFO]: ############# Starting Traefik Components Deployment #############"
echo " "

displayComponents() {
   echo " "
   kubectl get pods  --namespace kube-system | grep traefik
   sleep $1 
}

deployApps () {

    kubectl apply -f traefik-rbac.yml
    sleep 3
    kubectl apply -f traefik-deployment.yml
    sleep 3
    kubectl apply -f traefik-ingressroute.yml
    sleep 3
}


# Starting to delete everything in creating All components again 
displayComponents 3
deployApps
displayComponents 2

echo " "
echo "`date +%c` [INFO]: ############# DONE....Traefik Components Up & Running #############"  