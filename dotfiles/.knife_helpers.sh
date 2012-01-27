function kssh() {
  node=$1;
  shift;

  host=`knife node show $node -a ec2.public_hostname | cut -d' ' -f3`

  ssh ubuntu@$host
}

function knife-create-server() {
  name=$1;
  flavor=$2;
  ami=$3;

  knife ec2 server create -N ${name} -f ${flavor} -I ${ami} -S default -x ubuntu -r "role[base]" -i ~/.ssh/aws-skalar-default.pem --region eu-west-1 -Z eu-west-1a
}

function knife-create-medium() {
  name=$1;
  knife-create-server $name "c1.medium" "ami-359ea941"
}
