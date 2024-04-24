#!/bin/bash
echo -e "Checking Objectives..."
OBJECTIVE_NUM=0
function printresult {
  ((OBJECTIVE_NUM+=1))
  echo -e "\n----- Checking Objective $OBJECTIVE_NUM -----"
  echo -e "----- $1"
  if [ $2 -eq 0 ]; then
      echo -e "      \033[0;32m[COMPLETE]\033[0m Congrats! This objective is complete!"
  else
      echo -e "      \033[0;31m[INCOMPLETE]\033[0m This objective is not yet completed!"
  fi
}

expected="nginx:stable"
actual=$(kubectl get deployment bruce -o jsonpath='{.spec.template.spec.containers[0].image}' 2>/dev/null)
[[ "$actual" = "$expected" ]]
printresult "Fix a Deployment with an incorrect image name." $?

expected="gotham-sa"
actual=$(kubectl get deployment bat -n cave -o jsonpath='{.spec.template.spec.serviceAccountName}' 2>/dev/null)
[[ "$actual" = "$expected" ]]
printresult "Fix an issue with a broken Pod." $?