#!/bin/bash
while read -r name ip
do
    if sudo virsh list --all | grep -qw "$name"; then
        vm remove "$name" &> /dev/null
    fi
    vm clone "$name"
    vm setip "$name" "$ip"
done < vm.txt
