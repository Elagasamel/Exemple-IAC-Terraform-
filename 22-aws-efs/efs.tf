resource "aws_efs_file_system" "arviu-aws-efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "EFS"
   }
 }


resource "aws_efs_mount_target" "aws-arviu-efs-mt" {
   file_system_id  = aws_efs_file_system.arviu-aws-efs.id
   subnet_id = "${var.subnet_ids}"
   security_groups = [aws_security_group.arviu-aws-efs-sg.id]
 }




