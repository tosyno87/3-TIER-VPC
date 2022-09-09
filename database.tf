# # Create a database server
resource "aws_db_instance" "default" {
allocated_storage = 5
engine         = "mysql"
engine_version = "5.7"
instance_class = "db.t3.micro"
name           = "initial_db"
username       = "tosinmaster"
password       = "tosin-master"
skip_final_snapshot = true
}