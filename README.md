rustup-toolbox
==============

The rustup-toolbox container image is used with
[Toolbox](https://github.com/containers/toolbox) as a development environment that combines a Fedora base image with [rustup](https://rustup.rs/).

Usage
-----

``` bash
$ toolbox create -i quay.io/owtaylor/rustup-toolbox:35 RS_F35
$ toolbox enter RS_F35
# Workaround for https://github.com/containers/crun/issues/644
⬢$ sudo chown -R $USER:$USER /rustup /cargo
# Use rustup/cargo/...
⬢$ rustup component add rls

Source
------
https://github.com/owtaylor/rustup-toolbox
```
