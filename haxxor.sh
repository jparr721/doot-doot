usage() {
  printf "Usage: ./haxxor.sh\n -i - Install programs\n -d setup docker\n -c connect to the container"
}

setup_docker() {
  docker run \
  --name fuck \
  -e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  -v /tmp/skeletor:/home/skeletor \
  -t -i \
  fuck /bin/bash
}

roll_it() {
  docker volume create haxbox
  docker build -t skelly .
}

connect_it() {
  docker exec -it fuck /bin/zsh
}

d_flag=false
i_flag=false
c_flag=false

while getopts 'idc' flag; do
  case "${flag}" in
    d) d_flag='true' ;;
    i) i_flag='true' ;;
    c) c_flag='true' ;;
    *) usage exit 1;;
  esac
done


if [ $d_flag = 'true' ]; then
  setup_docker
elif [ $i_flag = 'true' ]; then
  roll_it
elif [ $c_flag = 'true' ]; then
  connect_it
else
  usage
fi
