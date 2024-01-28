#!/bin/bash

openssl rsautl -decrypt -inkey private_key.pem -in symmetric_keyfile.key.enc -out symmetric_keyfile.key

openssl enc -in "$@" -out "${@%.enc}" -d -aes256 -pbkdf2 -kfile symmetric_keyfile.key
