#!/bin/bash

if [[ $UID -ne 0 ]]; then echo "Please run $1 as root." && exit 1; fi
