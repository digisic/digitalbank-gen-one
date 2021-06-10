#!/bin/bash 

echo "`date +%c` [INFO]: ############# Deleting Digital Bank K8s Deployment #############"
echo " "

displayComponents() {
   echo " "
   kubectl get cm,pods,deploy,svc,ingress -n digibank
   sleep $1 
}

deleteAppComponents() {
    kubectl delete -f deployment-bank-route.yml
    sleep 3
    kubectl delete -f deployment-broker.yml
    sleep 3
    kubectl delete -f deployment-credit.yml
    sleep 3
    kubectl delete -f deployment-bank.yml
    sleep 3
    kubectl delete -f digibank-namespace.yml
}


# Starting to delete everything in creating All components again 
displayComponents 4
deleteAppComponents
displayComponents 2

echo " "
echo "`date +%c` [INFO]: ############# DONE....Digital Bank Deleted #############"  