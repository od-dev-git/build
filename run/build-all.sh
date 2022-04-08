#!/bin/bash
currentdir=$(pwd)
configdir="../../od-config"
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
                  b=$(python -c "import os.path; print (os.path.relpath('$pathname', '$configdir'))")
                  copy_file "$pathname" "$configdir/../$b" -f
          esac
      fi
  done

}
while IFS=',' read -r f1 f2 f3
do 
  echo "$f1 $f2"
  if [ -d "$configdir/$f2/$f1" ]
    then
      replace_files "$configdir/$f2/$f1"
  # else
      # echo "directory $configdir/$f2/$f1 doesnot exist"
  fi
  sh ../src/build.sh "../../$f2" $f1
  cd "$currentdir"
done < "$input"

# replace_files