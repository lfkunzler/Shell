#!/bin/bash

clear
read -p "primeiro valor: " V1
read -p "segundo valor: " V2
echo "A soma é: "$(expr $V1 + $V2)
