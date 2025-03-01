all:
	kubectl apply -f pvc-mariadb.yaml
	kubectl apply -f pvc-nginx-php-fpm.yaml
	kubectl apply -f service-mariadb.yaml
	kubectl apply -f service-php-fpm.yaml
	kubectl apply -f service-nginx.yaml
	kubectl apply -f configMap.yaml
	kubectl apply -f secret.yaml
	kubectl apply -f pod-mariadb.yaml
	kubectl apply -f pod-php-fpm.yaml
	kubectl apply -f pod-nginx.yaml

restart:
	kubectl delete pod pod-mariadb
	kubectl delete pod pod-nginx
	kubectl delete pod pod-php-fpm
	kubectl apply -f pod-mariadb.yaml
	kubectl apply -f pod-php-fpm.yaml
	kubectl apply -f pod-nginx.yaml

clean:
	kubectl delete pod pod-mariadb
	kubectl delete pod pod-nginx
	kubectl delete pod pod-php-fpm

fclean: clean
	kubectl delete pvc pvc-mariadb
	kubectl delete pvc pvc-nginx-php-fpm

re: fclean all

.PHONY: all restart clean fclean re