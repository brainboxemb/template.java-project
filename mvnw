#!/bin/sh
# Apache Maven Wrapper startup script, version 3.3.4.
# Licensed to the Apache Software Foundation under the Apache License 2.0.
set -euf
scriptDir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
props="$scriptDir/.mvn/wrapper/maven-wrapper.properties"
distributionUrl="$(sed -n 's/^distributionUrl=//p' "$props" | tr -d '\r')"
expectedSha="$(sed -n 's/^distributionSha256Sum=//p' "$props" | tr -d '\r')"
[ -n "$distributionUrl" ] || { echo "Missing distributionUrl in $props" >&2; exit 1; }
MAVEN_USER_HOME="${MAVEN_USER_HOME:-$HOME/.m2}"
archive="${distributionUrl##*/}"
name="${archive%-bin.zip}"
key="$(printf '%s' "$distributionUrl" | sha256sum | awk '{print $1}')"
home="$MAVEN_USER_HOME/wrapper/dists/$name/$key"
if [ ! -x "$home/bin/mvn" ]; then
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT HUP INT TERM
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$distributionUrl" -o "$tmp/$archive"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$distributionUrl" -O "$tmp/$archive"
  else
    echo "curl or wget is required to bootstrap Maven." >&2
    exit 1
  fi
  if [ -n "$expectedSha" ]; then
    echo "$expectedSha  $tmp/$archive" | sha256sum -c - >/dev/null
  fi
  unzip -q "$tmp/$archive" -d "$tmp"
  mkdir -p "$(dirname "$home")"
  mv "$tmp/$name" "$home"
  rm -rf "$tmp"
  trap - EXIT HUP INT TERM
fi
exec "$home/bin/mvn" "$@"
