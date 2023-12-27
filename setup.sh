#!/bin/bash

set -eux

bin/install_mitamae.sh

bin/mitamae local lib/recipe.rb
