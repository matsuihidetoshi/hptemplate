error_log  /var/www/rails/hptemplate/log/nginx.error.log;
access_log /var/www/rails/hptemplate/log/nginx.access.log;

client_max_body_size 2G;
upstream app_server {
  server unix:/var/www/rails/hptemplate/tmp/sockets/.unicorn.sock fail_timeout=0;
}
server {
  listen 80;
  server_name 13.115.163.169;
  keepalive_timeout 5;
  root /var/www/rails/hptemplate/public;
  try_files $uri/index.html $uri.html $uri @app;
  location @app {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://app_server;
  }
  error_page 500 502 503 504 /500.html;
  location = /500.html {
    root /var/www/rails/hptemplate/public;
  }
}
