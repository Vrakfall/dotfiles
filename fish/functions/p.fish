function p
  if [ $argv[1] = "--sudo" ]
    set -e argv[1]
    command sudo pacman $argv
  else
    command pacman $argv
  end
end
