output vpc_id{
    value =  aws_vpc.myvpc.id
}

output public_subnet_id{
    value =  aws_subnet.public-subnet-1.id
}

output private_subnet_id{
    value =  aws_subnet.private-subnet-1.id
}