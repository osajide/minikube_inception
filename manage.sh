#!/bin/bash

set -e

run() {
    kubectl apply -f manifests/mariadb/pvc-mariadb.yaml
	kubectl apply -f manifests/shared/pvc-nginx-php-fpm.yaml
	kubectl apply -f manifests/mariadb/service-mariadb.yaml
	kubectl apply -f manifests/php-fpm/service-php-fpm.yaml
	kubectl apply -f manifests/nginx/service-nginx.yaml
	kubectl apply -f manifests/shared/configMap.yaml
	kubectl apply -f manifests/shared/secret.yaml
	kubectl apply -f manifests/mariadb/pod-mariadb.yaml
	kubectl apply -f manifests/php-fpm/pod-php-fpm.yaml
	kubectl apply -f manifests/nginx/pod-nginx.yaml
	kubectl wait --for=condition=Ready=true pod/pod-mariadb pod/pod-php-fpm pod/pod-nginx
	kubectl port-forward svc/service-nginx 9999:7777 &
}

restart() {
	kubectl delete pod pod-mariadb
	kubectl delete pod pod-nginx
	kubectl delete pod pod-php-fpm
	kubectl apply -f manifests/mariadb/pod-mariadb.yaml
	kubectl apply -f manifests/php-fpm/pod-php-fpm.yaml
	kubectl apply -f manifests/nginx/pod-nginx.yaml
}

stop() {
	kubectl delete pod pod-mariadb
	kubectl delete pod pod-nginx
	kubectl delete pod pod-php-fpm
}

fclean() {
    stop
	kubectl delete pvc pvc-mariadb
	kubectl delete pvc pvc-nginx-php-fpm
	kubectl delete configmap conf
	kubectl delete secret credentials
	kubectl delete svc service-mariadb
	kubectl delete svc service-php-fpm
	kubectl delete svc service-nginx
	kill `pgrep -f "kubectl port-forward svc/service-nginx 9999:7777"`
}

re() {
    fclean
    run
}

ARG=$1

case "$ARG" in
  "" | "all" | "run")
    run
    ;;
  "restart")
    restart
    ;;
  "stop")
    stop
    ;;
  "fclean")
    fclean
    ;;
  "re")
    re
    ;;
  *)
    echo "Invalid option"
    ;;
esac