# Velocifire CLI

Velocifire CLI is a command line tool for interfacing with 
the Velocifire service. It can be used within your CI/CD pipelines
to help measure the performance of your pipelines.

## Usage

Running the `velocifire` command without any arguments will
display the help message. You can also use the `--help` flag:

    $ velocifire --help

### Common Commands

The two primary commands when using the Velocifire CLI are `start`, which will start a timing session and `stop` to end it. Both commands require a few arguments to be passed in, primarily `auth_key`, `service_name` and `session_id`.

#### Parameter: auth_key

The `auth_key` is a unique key that is used to authenticate the user. It is used to identify the user and to ensure that the user has the correct permissions to access the service.

#### Parameter: service_name

The `service_name` parameter is used to identify the service that is being measured. This is used to group the measurements together and to help identify the service that is being measured.
  
When used within a CI/CD pipeline, the `service_name` parameter can be set to the name of the pipeline or the name of the service being measured.

#### Parameter: session_id

The `session_id` is a unique key that is used to identify the session. The key should be unique for the service being measured. This is used to group the measurements together and to help identify the session that is being measured.

When used within a CI/CD pipeline, the `session_id` parameter can be set to the build number or the commit hash.

### General Example

    $ velocifire start --auth_key <auth_key> --service_name <service> --session_id <session>

    $ velocifire stop --auth_key <auth_key> --service_name <service> --session_id <session>

### Example when used in CI/CD

To record the performance of a CI/CD pipeline execution, you can use the `start` command at the beginning of the pipeline and the `stop` command at the end of the pipeline. The `service_name` parameter can be set to the name of the pipeline and the `session_id` parameter can be set to the build number or the commit hash.

    $ velocifire start --auth_key <auth_key> --service_name myreactapp --session_id 432

    $ velocifire stop --auth_key <auth_key> --service_name myreactapp --session_id 432

## Installation

There are two ways to install the Velocifire CLI depending on your preferences and tech stack. The primary methods are either via Docker or direct.

### Docker

The Velocifire CLI is available as a Docker image. You can pull the image from the Docker Hub and run the CLI from within a container.

    $ docker pull velocifire/cli

    $ docker run -it velocifire/cli

### Direct

Coming soon!

## Building from Source

To build Velocifire CLI from source, we've included a Nix Shell configuration that will help you get started. Install Nix onto your operating system and then you can use the following command to enter the Nix Shell:

    $ nix-shell
