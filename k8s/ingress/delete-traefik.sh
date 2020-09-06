#!/bin/bash 

echo "`date +%c` [INFO]: ############# Deleting Traefik Components #############"
echo " "

displayComponents() {
   echo " "
   kubectl get pods  --namespace kube-system | grep traefik
   sleep $1 
}

deleteAppComponents() {
    kubectl delete -f traefik-ingressroute.yml
    sleep 3
    kubectl delete -f traefik-deployment.yml
    sleep 3
    kubectl delete -f traefik-rbac.yml
    sleep 3
}


# Starting to delete everything in creating All components again 
displayComponents 4
deleteAppComponents
displayComponents 2

echo " "
echo "`date +%c` [INFO]: ############# DONE....Traefik Components Deleted #############"  