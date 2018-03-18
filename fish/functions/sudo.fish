# Simple sudo function so sudo can work on custom functions.
# !!!! ATTENTION - BREAKS ADVANCED SUDO USAGES (args, etc...) !!!!
function sudo
  set arg1 $argv[1]
  set -e argv[1]

  if echo $arg1 | string match -qr -- "^-"
    # Execute normally if sudo has any argument (arg1 is actually not a command)
    command sudo $arg1 $argv
  else if functions -q $arg1
    # Tell the function to sudo itself if it exists
    fish -c "$arg1 --sudo $argv"
  else
    # Execute normally if it doesn't
    command sudo $arg1 $argv
  end
end
