#!/bin/bash
sed "s/tagversion/$1/g" myapp.yml > pods.yml
