#!/bin/sh

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_ndru
ssh-add -l