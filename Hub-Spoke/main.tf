# main.tf
terraform {
  required_version = ">= 0.12.0"
}

#---------------------------------------------------------------------------
# tls.tf
resource "tls_private_key" "public_private_key_pair" {
  algorithm   = "RSA"
}

#---------------------------------------------------------------------------
# outputs.tf

output "bastion_public_ip" {
  value = oci_core_instance.bastion_instance.*.public_ip
}

output "vcn_id_spoke01" {
  value = oci_core_vcn.spoke01.id
}

output "vcn_id_spoke02" {
  value = oci_core_vcn.spoke02.id
}

output "generated_ssh_private_key" {
  value = tls_private_key.public_private_key_pair.private_key_pem
}

#--------------------------------------------------------------------------
# tags.tf
resource "random_id" "tag" {
  byte_length = 2
}

resource "oci_identity_tag_namespace" "ArchitectureCenterTagNamespace" {
    provider = oci.homeregion    
    compartment_id = var.compartment_ocid
    description = "ArchitectureCenterTagNamespace"
    name = "ArchitectureCenter\\hub-spoke-network-${random_id.tag.hex}"
  
    provisioner "local-exec" {
       command = "sleep 10"
    }
}

resource "oci_identity_tag" "ArchitectureCenterTag" {
    provider = oci.homeregion
    description = "ArchitectureCenterTag"
    name = "release"
    tag_namespace_id = oci_identity_tag_namespace.ArchitectureCenterTagNamespace.id

    validator {
        validator_type = "ENUM"
        values         = ["release", "1.1"]
    }

    provisioner "local-exec" {
       command = "sleep 120"
    }

}
#--------------------------------------------------------------------
                