resource "null_resource" "cluster" {
  triggers = {
    always = timestamp()
  }

  provisioner "local-exec" {
    command = var.cmd
  }
}
