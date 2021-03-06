#!/bin/sh
# 添加域名对应dns的服务商，
set -e
oldpwd=$PWD
cd $(dirname $0)
domain=$1
value=$2

if test -z "$domain"; then
  echo domain empty
  exit 1
fi
if test -z "$value"; then
  echo value empty
  exit 2
fi

if test ! -d "$value"; then
  echo $value not support
  exit 3
fi

domainFile=domain.json
if test ! -e $domainFile; then
  echo '{}' >$domainFile
fi
jq ".+{\"$domain\":\"$value\"}" $domainFile >$domainFile.bak
mv -f $domainFile.bak $domainFile
