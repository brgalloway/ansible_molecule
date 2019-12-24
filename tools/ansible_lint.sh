#!/bin/bash
# 
# yaml lint and ansible lint from molecule
# cd .git/hooks
# ln -s ../../toos/ansible_lint.sh ./pre-commit

echo "[+] Linting started on role ${ROLE_NAME}"

docker run --rm -i \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$(pwd)/roles/${ROLE_NAME}":/tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
-w /tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
quay.io/ansible/molecule:2.22 molecule lint

docker run --rm -i \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$(pwd)/roles/${ROLE_NAME}":/tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
-w /tmp/$(basename "${PWD}")/roles/${ROLE_NAME} \
quay.io/ansible/molecule:2.22 molecule syntax
