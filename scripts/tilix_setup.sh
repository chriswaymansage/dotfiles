#!/bin/bash

function echoStars {
  for i in { 1..5 }; do echo "*                                                *"; done
}

echoStars
echo "Installing terminix..."
echoStars
echo -e "admin\n" | sudo -S apt-get update
echo -e "admin\n" | sudo -S add-apt-repository ppa:webupd8team/terminix -y
echo -e "admin\n" | sudo -S apt install terminix -y

echoStars
echo "Installing dconf..."
echoStars
echo -e "admin\n" | sudo -S apt install dconf-cli -y
dconf load /com/gexperts/Tilix/ < ./tilix.dconf

echoStars
echo ".....Finished....."
