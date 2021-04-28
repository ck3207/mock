# mock
mock the response of interface

# 配置说明
建议程序通过nginx反向代理设置；
如下，前端需要调用接口 127.0.0.1:8099/mock/<uri:path>, 可参考 location /mock 配置
如下，前端需调用接口  /boci/public/get_token， 可参考 location /boci/public/get_token 配置
上述两种情况的不同之处在于， 第一种情况针对三方接口设置比较适宜；
第二种情况一般针对访问服务的接口里面， 某几个特殊的接口无数据时，单独配置；
    server{
        listen 8099;
        server_name 10.2018.174;
        access_log logs/chenk.access.log;
        proxy_set_header Host $http_host;
        client_max_body_size 10M;

        proxy_connect_timeout 6000;
        proxy_read_timeout 6000;
        proxy_send_timeout 6000;

        proxy_intercept_errors on;

        satisfy all;

        location /boci/public/get_token {
                #proxy_pass http://10.20.34.76:18082;
                proxy_pass http://127.0.0.1:8889/mock$request_uri;
                add_header Access-Control-Allow-Origin *;
                add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
                add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization';

        }

        location /mock {
                #proxy_pass http://10.20.34.76:18082;
                proxy_pass http://127.0.0.1:8889$request_uri;
                add_header Access-Control-Allow-Origin *;
                add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
                add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization';

        }


        location /boci {
                proxy_pass http://127.0.0.1:8999;
        }


    }