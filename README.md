# Heavy Wizardry 101 **Un**official Repo

This is the unofficial Repo for the book: Heavy Wizardry 101. 

References:
 * The official repo can be found at https://github.com/0x00pf/heavywizardry101
 * The official page of the book is at  https://nostarch.com/heavy-wizardry-101

## About this repository

This repository started from a fork of the official repository and has as sole 
purpose to track some of my experiments while working through the book.

## Requirements

You need to install docker on your machine in order to install the development environment. 

## Development Environment 

The repository includes a Dockerfile that can be used to create a docker image with all the required images. 

To create the image execute:

```bash
$ ./build.sh
```

Once the image is created you can access the development environment running the script `start_env.sh`.

*NOTE: Execute the script from the repo root directory. The script makes all the source code available inside the docker container as a volume*
