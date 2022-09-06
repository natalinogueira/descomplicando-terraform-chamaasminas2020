
### Terraform Commands:

## Basic Commands:
```
terraform init
terraform plan
terraform apply
terraform destroy
```
```
$ terraform --help
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    login              Obtain and save credentials for a remote host
    logout             Remove locally-stored credentials for a remote host
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management

All other commands:
    <VERSION>upgrade        Rewrites pre-0.12 module source code for <VERSION>
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    push               Obsolete command for Terraform Enterprise legacy (v1)
    state              Advanced state management
```

# TERRAFORM WORKSPACE
 ´´´
$ terraform workspace --help
Usage: terraform workspace

   new, list, show, select and delete Terraform workspaces.

 Subcommands:
     delete    Delete a workspace
     list      List Workspaces
     new       Create a new workspace
     select    Select a workspace
     show      Show the name of the current workspace
 $ terraform workspace list
 * default


 $ terraform workspace new dev
 Created and switched to workspace "dev"!

 You're now on a new, empty workspace. Workspaces isolate their state,
 so if you run "terraform plan" Terraform will not see any existing state
 for this configuration.


 $ terraform workspace list
   default
 * dev
 $ terraform workspace select prod
  Switched to workspace "prod".

´´´


