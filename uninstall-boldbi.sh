#!/usr/bin/env bash.
# Copyright (c) Syncfusion Inc. All rights reserved.

services_array=("bold-id-web" "bold-id-api" "bold-ums-web" "bold-bi-web" "bold-bi-api" "bold-bi-jobs" "bold-bi-designer")

uninstall_boldbi() {
                stop_boldbi_services
                echo "Removing Bold BI Service Files"
                rm -rf /etc/systemd/system/bold-*
                echo "Removing Bold BI Installed Files"
                rm -rf /var/www/bold-*
                echo "Bold BI Uninstalled Successfully.."
                   }
stop_boldbi_services() {
				for t in ${services_array[@]}; do
				echo " stopping services - $t"
				systemctl stop $t
				done
						}
read -p "Do you wish to Uninstall Bold BI? [yes / no]:" yn
			case $yn in
				[Yy]* ) uninstall_boldbi;;
				[Nn]* ) exit;;
				* ) echo "Please answer yes or no.";;
			esac