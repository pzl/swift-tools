Swift Tools
===========

Installing swift on a non-ubuntu linux distribution was annoying at best. Mostly due to library linkages, and versions installed. Which is a great case for just throwing it in a container that has the necessary libs in the right places. And apple graciously provides a docker image already!

This automates the process of building your project in a swift container, then copying into a trimmed down swift-runtime container.

And it supports unprivileged (i.e. rootless) containers. (Just run `./rootless-setup.sh` to prep your system).

Also, as I dislike the docker runtime, this uses `podman` and `buildah` instead. But the `podman run` commands are essentially the exact same as `docker run`, so you could reasonably just swap out the command being called. And change out the `buildah` commands for an equivalent multistage dockerfile.


Installation
-------------

1. Clone the repository
1. Put it in your `$PATH` perhaps


You are welcome to rename the `swift` script to something else, if you don't want to shadow the _actual_ swift binary. But if you did get that installed, what are you doing here?

Usage
-----

### Building

_From your project root_, run `swift`. This will copy your current dir to the build container, compile, and copy the resulting binary to the runtime container. It will print out the commands you can run to then run your binary


### Running

Run the command printed out from the build step. It will likely be `podman run --rm -it swift-<projectname>`. Where `projectname` is the name of the directory you were in. You can change this name during build, by running `swift NAME` to make a container called `swift-NAME`. 

### REPL

You may launch into a swift repl by running `swift-repl`. This requires a few extra permissions and capabilities (when run unprivileged), so those flags have been taken care of in this script. It is necessary to keep the `swift-seccomp.json` file alongside the `swift-repl` script for it to run correctly.

---

As a convenience, you can reuse the `Makefile` template given here, to automate this _even further_. Just put your preferred [NAME] into the `TARGET=` line. Then running `make` will build. `make run` will run. `make clean` will clean up the built container.



License
-------

MIT License, Copyright 2019 Dan Panzarella

