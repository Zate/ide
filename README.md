# code-server deployment

Use this to deploy a remote vcsode system for use as a Web Development IDE.

## Features

Supports:

- Golang latest
    - `goUp` from terminal to update golang
- aws cli v2
    - `upAWS` from terminal to update aws cli v2
- terraform
    - `upTerraform` from terminal to update terraform
- puts new functions in `~/.local/.bash_inc`
- installs git
- mounts local folders from host for:
    - ssh
    - aws
    - projects

## Setup

- copy env.example to .env and change IMAGE, EMAIL and USER to match what you need for git
- `docker-compose config` to check the config is picking up those values
- `docker-compose build` to build it.
- `docker-compose up` to test it comes up ok.
- `docker-compose up -d` sets it running in the background.  It's listening on 8443 (not SSL) with no auth by default, so you want to front it with something.
- you can use the docker-compose.yaml to build out a docker-stack.yaml and deploy to a swarm, or I am sure someone will work out how to set this up to work in k8s at some point (maybe even me)

