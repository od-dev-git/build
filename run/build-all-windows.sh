#!/bin/bash
currentdir="/c/Users/Prasun.Kumar/code/od2/build/run"
configdir="/c/Users/Prasun.Kumar/code/od2/od-config"
input="./projects.csv"
copy_file() {
  shopt -s nullglob dotglob
  mkdir -p $(dirname $2)
  if cmp -s "$1" "$2"; then
    printf 'The file "%s" is the same and not copied\n' "$1"
  else
      cp -f $1 $2
      echo "Overwrite $2 with $1"
  fi
  
}
replace_files() {
  shopt -s nullglob dotglob
  for pathname in "$1"/*; do
      if [ -d "$pathname" ]; then
          replace_files "$pathname"
      else
          case "$pathname" in
              *.sql|*.java|*.pom|*.properties|*.yml)
                  # printf copy_file "$pathname" "../../$f2/"
                  #b=$(python -c "import os.path; print (os.path.relpath('$pathname', '$configdir'))")
                  copy_file "$pathname" "${pathname//od-config\//}" -f
          esac
      fi
  done

}
while IFS=',' read -r f1 f2 f3
do
  path="$(readlink -e  ${configdir})"
  full_path_1=$(echo ${path}/${f2})
  full_path=$(echo ${full_path_1}/${f1})
  if [[ -d "$full_path" ]]
    then
      replace_files "$full_path"
  else
       echo $full_path "doesn't exists"
  fi
  sh ../src/build-windows.sh "$full_path_1" $f1
  cd "$currentdir"
done < "$input"

# replace_files