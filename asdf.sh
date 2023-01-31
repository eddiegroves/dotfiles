#!/bin/bash

asdf plugin-add direnv
asdf direnv setup --shell fish --version system

asdf plugin add dotnet https://github.com/hensou/asdf-dotnet.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
