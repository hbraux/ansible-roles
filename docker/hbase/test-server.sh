# check hbase shell and thrift API 
dockerRun shell <<EOF
create_namespace 'test_ns'
create 'test_ns:test_table','C'
put 'test_ns:test_table','1234','C:a','aaaa'
EOF

# check Master web UI
curl -s http://$DOCKER_HOST:16010/master-status | grep test_ns:test_table

# Check Rest API
curl -s http://$DOCKER_HOST:8084/test_ns:test_table/1234/C:a
