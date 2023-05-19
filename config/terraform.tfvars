region = "us-east-1"
environment = "testeks"
solution = "eksworld"

vpc_config = {

    vpc01 = {

    vpc_cidr_block = "192.168.0.0/16"
    

    tags = {

        "Name" = "pv_vpc"
    }
    }
}

subnet_config = {

    "pv-us-east-1a" = {

    
     vpc_name = "vpc01"
     cidr_block = "192.168.0.0/18"
     availability_zone = "us-east-1a"
     tags = {

        "Name" = "pv-us-east-1a"
     }

    }

    "pv-us-east-1b" = {
          
          vpc_name = "vpc01"
     
     cidr_block = "192.168.64.0/18"
     availability_zone = "us-east-1b"
     tags = {

        "Name" = "pv-us-east-1b"
     }

    }

    "pv-private-us-east-1a" = {
        
        vpc_name = "vpc01"
     
     cidr_block = "192.168.128.0/18"
     availability_zone = "us-east-1a"
     tags = {

        "Name" = "pv-private-us-east-1a"
     }

    }

    "pv-private-us-east-1b" = {
          
          vpc_name = "vpc01"
     
     cidr_block = "192.168.192.0/18"
     availability_zone = "us-east-1b"
     tags = {

        "Name" = "pv-private-us-east-1b"
     }

    }
}


internet_GW_config = {
    
    igw01 = {

        vpc_name = "vpc01"

        tags = {

            "Name" = "Pv_IGW"
        }

    }

}


elastic_IP_config = {

    eip01 = {

        tags = {

            "Name" = "nat01"
        }

    }

    eip02 = {

        tags = {

            "Name" = "nat02"
        }

    }



}

nat_GW_config = {

        natGW01 = {

            eip_name = "eip01"

            subnet_name = "pv-us-east-1a"

            tags = {
                "Name" = "natGW01"
            }
        }

        natGW02 = {

            eip_name = "eip02"

            subnet_name = "pv-us-east-1b"

            tags = {
                "Name" = "natGW02"
            }
        }

}


aws_route_table_config = {

    RT01 = {

        private = 0

        vpc_name = "vpc01"
        gateway_name = "igw01"
        tags = {

            "Name" = "Pv-public-route"

        }
    }

    RT02 = {

        private = 1

        vpc_name = "vpc01"
        gateway_name = "natGW01"
        tags = {

            "Name" = "Pv-private-route"

        }


    }

    RT03 = {

        private = 1

        vpc_name = "vpc01"
        gateway_name = "natGW02"
        tags = {

            "Name" = "Pv-private-route"

        }


    }

}


aws_route_table_association_config = {

    RT01assoc = {

        subnet_name = "pv-us-east-1a"
        route_table_name = "RT01"

    }

    RT02assoc = {
        
        subnet_name = "pv-us-east-1b"
        route_table_name = "RT01"

    }

    RT03assoc = {

        subnet_name = "pv-private-us-east-1a"
        route_table_name = "RT02"
        
    }

    RT04assoc = {

        subnet_name = "pv-private-us-east-1b"
        route_table_name = "RT03"
        
    }


}


aws_eks_cluster_config = {


    "sai-cluster" = {

        eks_cluster_name = "sai-cluster"
        subnet1 = "pv-us-east-1a"
        subnet2 = "pv-us-east-1b"
        subnet3 = "pv-private-us-east-1a"
        subnet4 = "pv-private-us-east-1b" 


    
    tags = {

        "Name" = "cluster-sai"

    }
    }

}

aws_eks_node_group_config = {

    "node1" = {
    node_group_name = "node1"

    eks_cluster_name = "sai-cluster"

    node_iam_role= "eks-node-general3"
    subnet1 = "pv-private-us-east-1a"
    subnet2 = "pv-private-us-east-1b"

    tags = {

        "Name" = "node1"
    }


    }

    "node2" = {
    node_group_name = "node2"

    eks_cluster_name = "sai-cluster"

    node_iam_role= "eks-node-general4"
    subnet1 = "pv-private-us-east-1a"
    subnet2 = "pv-private-us-east-1b"

    tags = {

        "Name" = "node2"
    }


    }

}