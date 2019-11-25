# extensive_kitchen_terraform

extensive_kitchen_terraform test from [extensive_kitchen_terraform.html](https://newcontext-oss.github.io/kitchen-terraform/tutorials/extensive_kitchen_terraform.html)

- [x] If you are using the last terraform version this will not work

Please install tfswitch it will permit you to chose the terraform version you need

```bash
brew install warrensbox/tap/tfswitch
```

`tfswitch <version>`

```bash
tfswitch 0.11.4
terraform -version
Terraform v0.11.4
```

## Clone this project
- In a directory of your choice, clone the github repository :
  
    ```bash
    git clone git@github.com:orlando-pereira/extensive_kitchen_terraform.git
    ```

- Change into the directory :
  
    ```bash
    cd extensive_kitchen_terraform
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
    rbenv install 2.5.3
    ```

- Set local version to be used with command :
  
    ```shell
    rbenv local 2.5.3
    ```

- Previous step is going to create a file named .ruby-version, with the following content `2.5.3`

- Next, [Bundler](https://bundler.io) needs to be installed, run `gem install bundler`, this would provide the dependencies that KitchenCI needs. It is going to install the Gems defined in the `Gemfile`

## Setup KitchenCI:

- Install the needed Gems for KitchenCI using Bundle with command :
  
    ```shell
    bundle install
    ```

## How to use it:

- Make sure that you are in the project's directory.

- Edit a filed named `env.tfvars` in `test/fixtures/wrapper` with the following content that fits for you:

    ```bash
    access_key = "YOUR_ACCESS_KEY"
    secret_key = "YOUR_SECRET_KEY"
    region = "YOUR_REGION"
    ```

- Now, `execute_kitchen_terraform.bash` should be used to provision the infrastructure that is going to be tested, the output should look like :

```bash
./execute_kitchen_terraform.bash
```

- It should show a result as:

```bash
Profile: Extensive Kitchen-Terraform (extensive_suite)
Version: 0.1.0
Target:  local://

  ✔  state_file: 0.11.4
     ✔  0.11.4 is expected to match /\d+\.\d+\.\d+/
  ✔  inspec_attributes: static terraform output
     ✔  static terraform output is expected to eq "static terraform output"
     ✔  static terraform output is expected to eq "static terraform output"


Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
```

- To clean environement:

```bash
./kitchen_destroy.bash
```
