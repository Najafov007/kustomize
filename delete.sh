#!/bin/bash

kubectl delete deploy adminer mysql pgadmin postgres
kubectl delete svc adminer-svc mysql pgadmin-svc postgres
kubectl delete cj database-backup
kubectl delete ingress adminer-ingress pgadmin-ingress
kubectl get secret -o name | grep '^secret/mysql-secret-' | xargs kubectl delete
kubectl get secret -o name | grep '^secret/postgres-secret-' | xargs kubectl delete
