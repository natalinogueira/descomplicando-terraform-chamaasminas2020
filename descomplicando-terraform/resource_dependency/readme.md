# Resource Dependency
Exemplo Dependencia implicita
Elastic IP depende da instancia:
 - apply: a instancia é criada primeiro, depois EIP.
 - destroy: é o inverso.

# Exemplo dependencia explicita: depends_on

# DEBUGGING TERRAFORM
Options: TRACE, DEBUG, INFO, WARN
´´´
$ TF_LOG=DEBUG terraform plan -out=plan.out

´´´

# TAINT
Warning: This command is deprecated. For Terraform v0.15.2 and later, we recommend using the -replace option with terraform apply instead (details below).

Recommended Alternative
For Terraform v0.15.2 and later, we recommend using the -replace option with terraform apply to force Terraform to replace an object even though there are no configuration changes that would require it.
´´´
$ terraform apply -replace="aws_instance.example[0]"

´´´

´´´
$ terraform plan
$ terraform taint aws_instance.web
Resource instance aws_instance.web has been marked as tainted.

$ terraform apply
...
Plan: 1 to add, 1 to change, 1 to destroy.

------------------------------------------------------------------------

´´´

# Comando: terraform graph - GRAFO
´´´
$ terraform graph -draw-cycles
digraph {
        compound = "true"
        newrank = "true"
        subgraph "root" {
                "[root] aws_eip.ip" [label = "aws_eip.ip", shape = "box"]
                "[root] aws_instance.web" [label = "aws_instance.web", shape = "box"]
                "[root] aws_instance.web2" [label = "aws_instance.web2", shape = "box"]
                "[root] data.aws_ami.ubuntu" [label = "data.aws_ami.ubuntu", shape = "box"]
                "[root] output.dns_name" [label = "output.dns_name", shape = "note"]
                "[root] provider.aws" [label = "provider.aws", shape = "diamond"]
                "[root] var.image_id" [label = "var.image_id", shape = "note"]
                "[root] aws_eip.ip" -> "[root] aws_instance.web"
                "[root] aws_instance.web" -> "[root] data.aws_ami.ubuntu"
                "[root] aws_instance.web2" -> "[root] aws_instance.web"
                "[root] data.aws_ami.ubuntu" -> "[root] provider.aws"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] aws_eip.ip"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] aws_instance.web2"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] output.dns_name"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] var.image_id"
                "[root] output.dns_name" -> "[root] aws_instance.web"
                "[root] provider.aws (close)" -> "[root] aws_eip.ip"
                "[root] provider.aws (close)" -> "[root] aws_instance.web2"
                "[root] root" -> "[root] meta.count-boundary (EachMode fixup)"
                "[root] root" -> "[root] provider.aws (close)"
        }
}
´´´

# terraform fmt
Options:

  -list=false    Don't list files whose formatting differs
                 (always disabled if using STDIN)

  -write=false   Don't write to source files
                 (always disabled if using STDIN or -check)

  -diff          Display diffs of formatting changes

  -check         Check if the input is formatted. Exit status will be 0 if all
                 input is properly formatted and non-zero otherwise.

  -no-color      If specified, output won't contain any color.

  -recursive     Also process files in subdirectories. By default, only the
                 given directory (or current directory) is processed.

´´´
$ terraform fmt -check -diff
ec2.tf
--- old/ec2.tf
+++ new/ec2.tf
@@ -19,9 +19,9 @@
 }

 resource "aws_eip" "ip" {
-  vpc = true
+  vpc      = true
   instance = aws_instance.web.id
-
+
 }
´´´

# terraform validate
´´´
$ terraform validate
Success! The configuration is valid.

$ terraform validate

Error: Missing newline after argument

  on main.tf line 2, in provider "aws":
   2:   region  = us-east-1"

An argument definition must end with a newline.
´´´
