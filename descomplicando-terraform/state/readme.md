# Command: TERRAFORM STATE
´´´
$ terraform state --help
 Usage: terraform state <subcommand> [options] [args]

   This command has subcommands for advanced state management.

   These subcommands can be used to slice and dice the Terraform state.
   This is sometimes necessary in advanced cases. For your safety, all
   state management commands that modify the state create a timestamped
   backup of the state prior to making modifications.

   The structure and output of the commands is specifically tailored to work
   well with the common Unix utilities such as grep, awk, etc. We recommend
   using those tools to perform more advanced state tasks.

 Subcommands:
     list    List resources in the state
     mv      Move an item in the state
     pull    Pull current state and output to stdout
     push    Update remote state from a local state file
     rm      Remove instances from the state
     show    Show a resource in the state

´´´

´´´
$ terraform state list
 module.app.aws_instance.web
´´´
´´´
$ terraform state mv aws_instance.web module.app.aws_instance.web
 Move "aws_instance.web" to "module.app.aws_instance.web"
 Successfully moved 1 object(s).
´´´

# IMPORT
´´´
$ terraform import aws_instance.web i-0e26be5c20cddf090
 Error: resource address "aws_instance.web" does not exist in the configuration.

 Before importing this resource, please create its configuration in the root module. For example:

 resource "aws_instance" "web" {
   # (resource arguments)
 }
 $ terraform import aws_instance.web i-0
 aws_instance.web: Importing from ID "i-0"...
 aws_instance.web: Import prepared!
   Prepared aws_instance for import
 aws_instance.web: Refreshing state... [id=0]

 Import successful!

 The resources that were imported are shown above. These resources are now in
 your Terraform state and will henceforth be managed by Terraform.
 
 ´´´