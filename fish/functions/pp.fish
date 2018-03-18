function pp
  if [ $argv[1] = "--sudo" ]
    set -e argv[1]
    command sudo powerpill $argv
  else
    command powerpill $argv
  end
end
