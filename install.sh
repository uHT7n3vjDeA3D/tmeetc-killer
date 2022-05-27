#!/bin/bash

current_dir_path=${BASH_SOURCE[0]/"install.sh"/""}
tmeetc_killer_folder="${current_dir_path}tmeetc-killer"
tmeetc_killer_service="${current_dir_path}tmeetc-killer.service"

cp -r $tmeetc_killer_folder /etc/systemd/system
cp $tmeetc_killer_service /etc/systemd/system

unset current_dir_path
unset tmeetc_killer_folder
unset tmeetc_killer_service
