function lla
  if [ $argv[1] = "--sudo" ]
    set -e argv[1]
    command sudo ls -alh --color=auto $argv
  else
    command ls -alh --color=auto $argv
  end
end
