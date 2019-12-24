#!/bin/bash
# 
echo $(pwd)
echo "$(pwd)/roles/${ROLE_NAME}"

docker run --rm -i \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$(pwd)/roles/${ROLE_NAME}":/tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
-w /tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
quay.io/ansible/molecule:2.22 molecule test

docker run --rm -i \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$(pwd)/roles/${ROLE_NAME}":/tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
-w /tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
quay.io/ansible/molecule:2.22 molecule syntax
