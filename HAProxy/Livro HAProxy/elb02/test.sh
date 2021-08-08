#!/bin/bash
# Chage the localhost, although it can work
while true; do curl --silent localhost 2>&1 | grep title; done
