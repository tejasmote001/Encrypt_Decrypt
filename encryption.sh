#!/bin/bash

openssl rand 214 > symmetric_keyfile.key

openssl enc -in "$@" -out "$@.enc" -e -aes256 -pbkdf2 -kfile symmetric_keyfile.key

openssl rsautl -encrypt -inkey public_key.pem -pubin -in symmetric_keyfile.key -out symmetric_keyfile.key.enc

rm symmetric_keyfile.key
rm "$@"
