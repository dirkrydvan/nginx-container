Nginx container images
======================

[![Build and push container images to quay.io registry](https://github.com/sclorg/nginx-container/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/sclorg/nginx-container/actions/workflows/build-and-push.yml)

Images available on Quay are:
* CentOS 7 [nginx-1.20](https://quay.io/repository/centos7/nginx-120-centos7)
* CentOS Stream 8 [nginx-1.20](https://quay.io/repository/sclorg/nginx-120-c8s)
* CentOS Stream 9 [nginx-1.20](https://quay.io/repository/sclorg/nginx-120-c9s)
* Fedora [nginx-1.20](https://quay.io/repository/fedora/nginx-120)
* Fedora [nginx-1.22](https://quay.io/repository/fedora/nginx-122)
* Micro CentOS Stream 8 [nginx-1.22](https://quay.io/repository/sclorg/nginx-122-micro-c8s)
* Micro CentOS Stream 9 [nginx-1.22](https://quay.io/repository/sclorg/nginx-122-micro-c9s)
* Micro Fedora [nginx-1.22](https://quay.io/repository/fedora/nginx-122-micro)


This repository contains Dockerfiles for Nginx images for OpenShift.
Users can choose between RHEL, Fedora, CentOS and CentOS Stream based images.

For more information about contributing, see
[the Contribution Guidelines](https://github.com/sclorg/welcome/blob/master/contribution.md).
For more information about concepts used in these container images, see the
[Landing page](https://github.com/sclorg/welcome).


Versions
--------
Nginx versions currently provided are:
* [nginx-1.20](1.20)
* [nginx-1.22](1.22)
* [nginx-1.22 micro](1.22-micro)

RHEL versions currently supported are:
* RHEL7
* RHEL8
* RHEL9

CentOS versions currently supported are:
* CentOS7
* CentOS Stream 8
* CentOS Stream 9


Installation
----------------------
Choose either the CentOS7 or RHEL7 based image:

*  **RHEL7 based image**

    These images are available in the [Red Hat Container Catalog](https://access.redhat.com/containers/#/registry.access.redhat.com/rhscl/nginx-120-rhel7).
    To download it run:

    ```
    $ podman pull registry.access.redhat.com/rhscl/nginx-120-rhel7
    ```

    To build a RHEL7 based Nginx image, you need to run Docker build on a properly
    subscribed RHEL machine.

    ```
    $ git clone --recursive https://github.com/sclorg/nginx-container.git
    $ cd nginx-container
    $ git submodule update --init
    $ make build TARGET=rhel7 VERSIONS=1.20
    ```

*  **CentOS7 based image**

    This image is available on DockerHub. To download it run:

    ```
    $ podman pull quay.io/centos7/nginx-120-centos7
    ```

    To build a CentOS based Nginx image from scratch, run:

    ```
    $ git clone --recursive https://github.com/sclorg/nginx-container.git
    $ cd nginx-container
    $ git submodule update --init
    $ make build TARGET=centos7 VERSIONS=1.20
    ```

For using other versions of Nginx, just replace the `1.20` value by particular version
in the commands above.

Note: while the installation steps are calling `podman`, you can replace any such calls by `docker` with the same arguments.

**Notice: By omitting the `VERSIONS` parameter, the build/test action will be performed
on all provided versions of Nginx, which must be specified in  `VERSIONS` variable.
This variable must be set to a list with possible versions (subdirectories).**


Usage
-----

For information about usage of Dockerfile for nginx 1.20,
see [usage documentation](1.20).

For information about usage of Dockerfile for nginx 1.22,
see [usage documentation](1.22).

Build
-----
Images can be built using `make` command.

```
$ cd nginx-container
$ git submodule update --init
$ make build TARGET=centos7 VERSIONS=1.20
```

For more information about make rules see [README](https://github.com/sclorg/container-common-scripts/blob/master/README.md).

Test
---------------------------------

This repository also provides a test framework, which checks basic functionality
of the Nginx image.

Users can choose between testing Nginx based on a RHEL or CentOS image.

*  **RHEL based image**

    To test a RHEL7 based Nginx image, you need to run the test on a properly
    subscribed RHEL machine.

    ```
    $ cd nginx-container
    $ git submodule update --init
    $ make test TARGET=rhel7 VERSIONS=1.20
    ```

*  **CentOS based image**

    ```
    $ cd nginx-container
    $ git submodule update --init
    $ make test TARGET=centos7 VERSIONS=1.20
    ```

For using other versions of Nginx, just replace the `1.20` value by particular version
in the commands above.

**Notice: By omitting the `VERSIONS` parameter, the build/test action will be performed
on all provided versions of Nginx, which must be specified in  `VERSIONS` variable.
This variable must be set to a list with possible versions (subdirectories).**
