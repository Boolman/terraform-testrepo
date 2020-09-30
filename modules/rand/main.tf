variable "common" {
  default = {}
  type    = map(string)
  validation {
    condition     = can(var.common.byte_length)
    error_message = "Missing configuration, maybe?"
  }
}

resource "random_id" "dummy" {
  //for_each = var.var
  //name        = each.key
  byte_length = var.common.byte_length
}


output "rand" {
  value = random_id.dummy
}
