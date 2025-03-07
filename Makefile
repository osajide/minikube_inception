all:
	@kubectl apply -f pvc-mariadb.yaml
	@kubectl apply -f pvc-nginx-php-fpm.yaml
	@kubectl apply -f service-mariadb.yaml
	@kubectl apply -f service-php-fpm.yaml
	@kubectl apply -f service-nginx.yaml
	@kubectl apply -f configMap.yaml
	@kubectl apply -f secret.yaml
	@kubectl apply -f pod-mariadb.yaml
	@kubectl apply -f pod-php-fpm.yaml
	@kubectl apply -f pod-nginx.yaml
	@kubectl wait --for=condition=Ready=true pod/pod-mariadb pod/pod-php-fpm pod/pod-nginx
	@kubectl port-forward svc/service-nginx 9999:7777 &

restart:
	@kubectl delete pod pod-mariadb
	@kubectl delete pod pod-nginx
	@kubectl delete pod pod-php-fpm
	@kubectl apply -f pod-mariadb.yaml
	@kubectl apply -f pod-php-fpm.yaml
	@kubectl apply -f pod-nginx.yaml

clean:
	@kubectl delete pod pod-mariadb
	@kubectl delete pod pod-nginx
	@kubectl delete pod pod-php-fpm

fclean: clean
	@kubectl delete pvc pvc-mariadb
	@kubectl delete pvc pvc-nginx-php-fpm
	@kubectl delete configmap conf
	@kubectl delete secret credentials
	@kubectl delete svc service-mariadb
	@kubectl delete svc service-php-fpm
	@kubectl delete svc service-nginx
	@kill $(shell pgrep -f "kubectl port-forward svc/service-nginx 9999:7777")


re: fclean all

.PHONY: all restart clean fclean re