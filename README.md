# extensive_kitchen_terraform

extensive_kitchen_terraform test from [extensive_kitchen_terraform.html](https://newcontext-oss.github.io/kitchen-terraform/tutorials/extensive_kitchen_terraform.html)

## Clone this project

- In a directory of your choice, clone the github repository :
  
    ```bash
    git clone git@github.com:orlando-pereira/kitchen-ec2-example.git
    ```

- Change into the directory :
  
    ```bash
    cd kitchen-ec2-example
    ```

## How to setup KitchenCI and RBENV (MacOS Mojave 10.14.5) :

- Run `brew install ruby`
- After previous command finish, run `gem install rbenv`, this would give you ability to choose particular version of Ruby. This is a prerequisite.
- Run the following two commands, to setup Ruby environment for the local directory.

    ```bash
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    ```

- Reload your BASH interpreter or apply the changes to the profile :
  
    ```shell
    source ~/.bash_profile 
    ```

- Verify rbenv is installed properly with :
  
    ```shell
    type rbenv   # → "rbenv is a function"
    ```

- To install the particular version that we need, run the following command in the project directory:
  
    ```shell
    rbenv install 2.3.1
    ```

- Set local version to be used with command :
  
    ```shell
    rbenv local 2.3.1
    ```

- Previous step is going to create a file named .ruby-version, with the following content `2.3.1`

- Next, [Bundler](https://bundler.io) needs to be installed, run `gem install bundler`, this would provide the dependencies that KitchenCI needs. It is going to install the Gems defined in the `Gemfile`
  
## Setup aws access

- update with your credentials
  
```bash
  export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxx"
  export AWS_SECRET_ACCESS_KEY="xxxxxxxxxxxxx"
```

## add the correct terraform version ">= 0.11.4, < 0.12.0"

- install [tfswitch](https://warrensbox.github.io/terraform-switcher/)

    ```bash
    tfswitch
    Use the arrow keys to navigate: ↓ ↑ → ← 
    ? Select Terraform version: 
      ▸ 0.11.13 *recent
        0.12.16 *recent
        0.12.13 *recent
        0.12.15
    ↓   0.12.14
    ```

## create a ssh_key

```bash
chmod +x generate_ssh_key.bash
./generate_ssh_key.bash
```

## run the test

```bash
chmod +x execute_kitchen_terraform.bash
./execute_kitchen_terraform.bash
```

- The result should terminate like the follow:
  
```bash
Profile: Extensive Kitchen-Terraform (extensive_suite)
Version: 0.1.0
Target:  local://
  ✔  state_file: 0.11.13
     ✔  0.11.13 is expected to match /\d+\.\d+\.\d+/
  ✔  inspec_attributes: static terraform output
     ✔  static terraform output is expected to eq "static terraform output"
     ✔  static terraform output is expected to eq "static terraform output"
Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
```

- clean all infrastructure

```bash 
chmod +x kitchen_destroy.bash
./kitchen_destroy.bash
```

  - The result should be similar to the follow:
  
```bash
 ./kitchen_destroy.sh
-----> Starting Kitchen (v1.25.0)
-----> Destroying <extensive-suite-centos>...
       Terraform v0.11.13
       
       Your version of Terraform is out of date! The latest version
       is 0.12.16. You can update by downloading from www.terraform.io/downloads.html
$$$$$$ Running command `terraform init -input=false -lock=true -lock-timeout=0s  -force-copy -backend=true  -get=true -get-plugins=true -verify-plugins=true` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Initializing modules...
       - module.extensive_kitchen_terraform
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Running command `terraform workspace select kitchen-terraform-extensive-suite-centos` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       
       Workspace "kitchen-terraform-extensive-suite-centos" doesn't exist.
       
       You can create this workspace with the "new" subcommand.
$$$$$$ Running command `terraform workspace new kitchen-terraform-extensive-suite-centos` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Created and switched to workspace "kitchen-terraform-extensive-suite-centos"!
       
       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Running command `terraform destroy -auto-approve -lock=true -lock-timeout=0s -input=false  -parallelism=10 -refresh=true -var="instances_ami=ami-ae7bfdb8" -var="subnet_availability_zone=us-east-1a" ` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       
       Destroy complete! Resources: 0 destroyed.
$$$$$$ Running command `terraform workspace select default` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Switched to workspace "default".
$$$$$$ Running command `terraform workspace delete kitchen-terraform-extensive-suite-centos` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Deleted workspace "kitchen-terraform-extensive-suite-centos"!
       Finished destroying <extensive-suite-centos> (0m1.09s).
-----> Destroying <extensive-suite-ubuntu>...
       Terraform v0.11.13
       
       Your version of Terraform is out of date! The latest version
       is 0.12.16. You can update by downloading from www.terraform.io/downloads.html
$$$$$$ Running command `terraform init -input=false -lock=true -lock-timeout=0s  -force-copy -backend=true  -get=true -get-plugins=true -verify-plugins=true` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Initializing modules...
       - module.extensive_kitchen_terraform
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Running command `terraform workspace select kitchen-terraform-extensive-suite-ubuntu` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Switched to workspace "kitchen-terraform-extensive-suite-ubuntu".
$$$$$$ Running command `terraform destroy -auto-approve -lock=true -lock-timeout=0s -input=false  -parallelism=10 -refresh=true -var="instances_ami=ami-1ee65166" -var="subnet_availability_zone=us-west-2b" ` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       random_string.key_name: Refreshing state... (ID: Yz97FCvqK)
       aws_vpc.extensive_tutorial: Refreshing state... (ID: vpc-0b8810a32d3e7d9ce)
       aws_key_pair.extensive_tutorial: Refreshing state... (ID: kitchen-terraform-Yz97FCvqK)
       aws_subnet.extensive_tutorial: Refreshing state... (ID: subnet-0d1f97be57b10d795)
       aws_internet_gateway.extensive_tutorial: Refreshing state... (ID: igw-0c6e326993d5c00d4)
       aws_security_group.extensive_tutorial: Refreshing state... (ID: sg-030fe12cf9ab2ead6)
       aws_route_table.extensive_tutorial: Refreshing state... (ID: rtb-0ad295d525e019f09)
       aws_instance.reachable_other_host: Refreshing state... (ID: i-0c54ad116ccb9a7d3)
       aws_instance.remote_group[1]: Refreshing state... (ID: i-0d532b67a69a67f64)
       aws_instance.remote_group[0]: Refreshing state... (ID: i-074f99097ada5bfed)
       aws_route_table_association.extensive_tutorial: Refreshing state... (ID: rtbassoc-057136abb8553d9c3)
       module.extensive_kitchen_terraform.random_string.key_name: Destroying... (ID: Yz97FCvqK)
       module.extensive_kitchen_terraform.random_string.key_name: Destruction complete after 0s
       module.extensive_kitchen_terraform.aws_route_table_association.extensive_tutorial: Destroying... (ID: rtbassoc-057136abb8553d9c3)
       module.extensive_kitchen_terraform.aws_route_table_association.extensive_tutorial: Destruction complete after 0s
       
       Destroy complete! Resources: 2 destroyed.
$$$$$$ Running command `terraform workspace select default` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Switched to workspace "default".
$$$$$$ Running command `terraform workspace delete kitchen-terraform-extensive-suite-ubuntu` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Deleted workspace "kitchen-terraform-extensive-suite-ubuntu"!
       Finished destroying <extensive-suite-ubuntu> (0m8.09s).
-----> Kitchen is finished. (0m10.68s)
-----> Starting Kitchen (v1.25.0)
-----> Destroying <extensive-suite-centos>...
       Terraform v0.11.13
       
       Your version of Terraform is out of date! The latest version
       is 0.12.16. You can update by downloading from www.terraform.io/downloads.html
$$$$$$ Running command `terraform init -input=false -lock=true -lock-timeout=0s  -force-copy -backend=true  -get=true -get-plugins=true -verify-plugins=true` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Initializing modules...
       - module.extensive_kitchen_terraform
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Running command `terraform workspace select kitchen-terraform-extensive-suite-centos` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       
       Workspace "kitchen-terraform-extensive-suite-centos" doesn't exist.
       
       You can create this workspace with the "new" subcommand.
$$$$$$ Running command `terraform workspace new kitchen-terraform-extensive-suite-centos` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Created and switched to workspace "kitchen-terraform-extensive-suite-centos"!
       
       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Running command `terraform destroy -auto-approve -lock=true -lock-timeout=0s -input=false  -parallelism=10 -refresh=true -var="instances_ami=ami-ae7bfdb8" -var="subnet_availability_zone=us-east-1a" ` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       
       Destroy complete! Resources: 0 destroyed.
$$$$$$ Running command `terraform workspace select default` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Switched to workspace "default".
$$$$$$ Running command `terraform workspace delete kitchen-terraform-extensive-suite-centos` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Deleted workspace "kitchen-terraform-extensive-suite-centos"!
       Finished destroying <extensive-suite-centos> (0m1.11s).
-----> Destroying <extensive-suite-ubuntu>...
       Terraform v0.11.13
       
       Your version of Terraform is out of date! The latest version
       is 0.12.16. You can update by downloading from www.terraform.io/downloads.html
$$$$$$ Running command `terraform init -input=false -lock=true -lock-timeout=0s  -force-copy -backend=true  -get=true -get-plugins=true -verify-plugins=true` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Initializing modules...
       - module.extensive_kitchen_terraform
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Running command `terraform workspace select kitchen-terraform-extensive-suite-ubuntu` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       
       Workspace "kitchen-terraform-extensive-suite-ubuntu" doesn't exist.
       
       You can create this workspace with the "new" subcommand.
$$$$$$ Running command `terraform workspace new kitchen-terraform-extensive-suite-ubuntu` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Created and switched to workspace "kitchen-terraform-extensive-suite-ubuntu"!
       
       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Running command `terraform destroy -auto-approve -lock=true -lock-timeout=0s -input=false  -parallelism=10 -refresh=true -var="instances_ami=ami-1ee65166" -var="subnet_availability_zone=us-west-2b" ` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       
       Destroy complete! Resources: 0 destroyed.
$$$$$$ Running command `terraform workspace select default` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Switched to workspace "default".
$$$$$$ Running command `terraform workspace delete kitchen-terraform-extensive-suite-ubuntu` in directory /Users/orlando/GITHUB/terraform/kitchen-tutorial/extensive_kitchen_terraform/test/fixtures/wrapper
       Deleted workspace "kitchen-terraform-extensive-suite-ubuntu"!
       Finished destroying <extensive-suite-ubuntu> (0m1.11s).
-----> Kitchen is finished. (0m3.76s)
``` 