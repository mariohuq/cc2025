# Params file for variables

variable "image.name" {
  type    = string
  default = "ununtu-22.04"
}

#### VM parameters
variable "server.flavor" {
  type    = string
  default = "m1.small"
}

variable "key_pair" {
  default = "2025-kondraev"
}

# Network params
variable "security_group" {
  default = "default"
}

variable "network.name" {
  default = "sutdents-net"
}