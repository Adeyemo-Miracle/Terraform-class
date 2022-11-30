variable "cidr_block" {
  type = list(string)
  default = [ "172.30.0.0/16", "172.30.10.0/24" ]
}
variable "ami" {
  type = string
  default = "ami-094125af156557ca2"
}
variable "ports" {
  type = list(number)
  default = [ 22 , 80, 8081 ]
}
variable "instance_type" {
  type = list(string)
  default = [ "t2.micro" ]
}