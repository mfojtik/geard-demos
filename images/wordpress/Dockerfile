FROM wordpress

ENV	MYSQL_PORT_3306_TCP   tcp://127.0.0.1:3306

ENV	WORDPRESS_DB_USER     admin
ENV	WORDPRESS_DB_PASSWORD wordpress123

ADD ./docker-entrypoint.sh /usr/src/wordpress/docker-entrypoint.sh
