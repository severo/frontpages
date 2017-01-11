#!/bin/bash

# Configuration (plus tard : lire le fichier config.ini)
declare -a sites=("www.liberation.fr" "www.lefigaro.fr" "www.lemonde.fr" "www.liberation.fr/france" "www.lefigaro.fr/politique/" "www.lemonde.fr/politique/")
baseUrl=/var/www/unes

# Telecharger l'url
function downloadUrl {
  # Parameter 1: url
  # Parameter 2: siteDir

  mkdir -p $2
  date=`date +%Y%m%d%H%M%S`
  downloadDir="$2/$date"

  # -E: Append .html to the file name if it is an HTML file but doesn't end in .html or similar
  # -H: Download files from other hosts, too
  # -k: After downloading convert any link in it so they point to the downloaded files
  # -p: Download anything the page needs for proper offline viewing
  # -e robots=off: Ignore robot files
  # -P: save to this directory
  cmd="wget -E -H -k -p -nd -l 10 -e robots=off -P $downloadDir $1"
  echo $cmd
  eval $cmd;
}

# Boucle sur les journaux
for site in "${sites[@]}"
do
  dir=${site//\//_}
  echo Download "$site" in $dir
  downloadUrl $site "$baseUrl/$dir"
done
