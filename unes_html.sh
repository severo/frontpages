#!/bin/bash

# Configuration (plus tard : lire le fichier config.ini)
declare -a sites=("www.liberation.fr" "www.lefigaro.fr")
baseUrl=/tmp

# Telecharger l'url
function downloadUrl {
  # Parameter 1: url
  # Parameter 2: siteDir

  mkdir -p $siteDir
  date=`date +%Y%m%d%H%M%S`
  downloadDir="$siteDir/$date"

  # -E: Append .html to the file name if it is an HTML file but doesn't end in .html or similar
  # -H: Download files from other hosts, too
  # -k: After downloading convert any link in it so they point to the downloaded files
  # -p: Download anything the page needs for proper offline viewing
  # -r: Download internal files recursively
  # -e robots=off: Ignore robot files
  # -P: save to this directory
  cmd="wget -E -H -k -p -nd -r -l 10 -e robots=off -P $downloadDir $1"
  echo cmd
  eval $cmd;
}

# Boucle sur les journaux
for site in "${sites[@]}"
do
  echo Download "$site"
  downloadUrl $site "$baseUrl/$site"
done
