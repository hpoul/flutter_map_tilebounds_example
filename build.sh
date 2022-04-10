#!/bin/bash

set -xe

flutter build web --base-href="/flutter_map_tilebounds_example/"
rm -rf docs
mv build/web docs

