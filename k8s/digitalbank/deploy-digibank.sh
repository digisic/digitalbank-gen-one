#!/bin/bash 

echo "`date +%c` [INFO]: ############# Starting Digital Bank Deployment #############"
echo " "

displayComponents() {
   echo " "
   kubectl get cm,pods,deploy,svc,ingress -n digibank
   sleep $1 
}

deployApps () {

    kubectl apply -f digibank-namespace.yml
    sleep 2
    kubectl apply -f deployment-broker.yml
    sleep 3
    kubectl apply -f deployment-credit.yml
    sleep 3
    kubectl apply -f deployment-bank.yml
    sleep 3
    kubectl apply -f deployment-bank-route.yml
    sleep 3
}


# Starting to delete everything in creating All components again 
displayComponents 3
deployApps
displayComponents 2

echo " "
echo "`date +%c` [INFO]: ############# DONE....Digital Bank Up & Running #############"  