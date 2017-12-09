provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
	key_name			= "${var.key_name}"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.example.id}"
  allocation_id = "${var.eip}"
}
