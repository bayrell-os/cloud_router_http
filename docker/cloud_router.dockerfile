FROM bayrell/alpine_php_fpm:7.3

RUN apk update && apk add dnsmasq php7-curl curl && rm -rf /var/cache/apk/*

ADD router /src/files
RUN cd ~; \
	cp -rf /src/files/etc/* /etc/; \
	cp -rf /src/files/root/* /root/; \
	rm -rf /src/files; \
	rm /var/www/html/index.php; \
	rm /etc/supervisor.d/php-fpm.ini; \
	chmod +x /root/router.php; \
	chmod +x /root/run.sh; \
	echo "Ok"