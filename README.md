rustup-toolbox
==============

The rustup-toolbox container image is used with
[Toolbox](https://github.com/containers/toolbox) as a development environment that combines a Fedora base image with [rustup](https://rustup.rs/).

Usage
-----

``` bash
toolbox create -c quay.io/owtaylor/rustup-toolbox:33 RS+F33
toolbox enter RS+F33
```
