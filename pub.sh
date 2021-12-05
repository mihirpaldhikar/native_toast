#
# Copyright 2021 Mihir Paldhikar
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
# OR OTHER DEALINGS IN THE SOFTWARE.
#

# This script creates/updates credentials.json file which is used
# to authorize publisher when publishing packages to pub.dev

# Checking whether the secrets are available as environment
# variables or not.
if [ -z "${PUB_DEV_PUBLISH_ACCESS_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_ACCESS_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_ID_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_ID_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_REFRESH_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_REFRESH_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_TOKEN_ENDPOINT}" ]; then
  echo "Missing PUB_DEV_PUBLISH_TOKEN_ENDPOINT environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_EXPIRATION}" ]; then
  echo "Missing PUB_DEV_PUBLISH_EXPIRATION environment variable"
  exit 1
fi

# Create credentials.json file.
cat <<EOF >/opt/hostedtoolcache/flutter/master/x64/.pub-cache/credentials.json
{
  "accessToken":"${PUB_DEV_PUBLISH_ACCESS_TOKEN}",
  "refreshToken":"${PUB_DEV_PUBLISH_REFRESH_TOKEN}",
  "idToken":"${PUB_DEV_PUBLISH_ID_TOKEN}",
  "tokenEndpoint":"${PUB_DEV_PUBLISH_TOKEN_ENDPOINT}",
  "scopes":["openid","https://www.googleapis.com/auth/userinfo.email"],
  "expiration":${PUB_DEV_PUBLISH_EXPIRATION}
}
EOF