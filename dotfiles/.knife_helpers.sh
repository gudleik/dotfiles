function knife-ssh() {
  node=$1;
  shift;

  host=`knife node show $node -a ec2.public_hostname | cut -d' ' -f3`

  ssh ubuntu@$host
}
