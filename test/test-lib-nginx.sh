#!/bin/bash
#
# Functions for tests for the nginx image in OpenShift.
#
# IMAGE_NAME specifies a name of the candidate image used for testing.
# The image has to be available before this script is executed.
#

THISDIR=$(dirname ${BASH_SOURCE[0]})

source "${THISDIR}/test-lib.sh"
source "${THISDIR}/test-lib-openshift.sh"

function test_nginx_integration() {
  ct_os_test_s2i_app "${IMAGE_NAME}" \
                     "https://github.com/sclorg/nginx-container.git" \
                     "examples/${VERSION}/test-app" \
                     "Test NGINX passed"
}

# Check the imagestream
function test_nginx_imagestream() {
  case ${OS} in
    rhel7|centos7|rhel8|rhel9) ;;
    *) echo "Imagestream testing not supported for $OS environment." ; return 0 ;;
  esac

  ct_os_test_image_stream_s2i "${THISDIR}/imagestreams/nginx-${OS%[0-9]*}.json" "${IMAGE_NAME}" \
                              "https://github.com/sclorg/nginx-container.git" \
                              "examples/${VERSION}/test-app" \
                              "Test NGINX passed"
}
# vim: set tabstop=2:shiftwidth=2:expandtab:
