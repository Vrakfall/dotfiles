function bb
  if [ $argv[1] = "--sudo" ]
    set -e argv[1]
    command sudo bb-wrapper $argv
  else
    command bb-wrapper $argv
  end
end
