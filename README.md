# Introduction
# Prerequisites
1. [Install git](https://git-scm.com/downloads)
2. [Install Minishift](https://docs.openshift.org/latest/minishift/getting-started/installing.html) (see support section for details how to install)
3. [Do the "Minishift Quickstart"](https://docs.openshift.org/latest/minishift/getting-started/quickstart.html)

# Get the Git Repo
```git clone https://github.com/iptrha/openshift_techbier.git```

# Tour de Git Repo

## Content
The git repo consists of 4 folders that represent the four elements we want to look at today:
* 1_s2i-openjdk_setup
  * Contains the scripts needed to build the s2i (Source-to-Image) builder image
* 2_jenkins_setup
  * Contains the very simple Jenkins install script
* 3_project_initialization
  * Contains the scripts to setup the necessary resources initially. In an enterprise setting, this would typically be executed by an admin with elevated rights
* 4_helloworld
  * Contains the scripts and code for the example Spring/Boot application

## Structure
We have applied a convention throughout the repo that:
* **docker** contains the resources needed for a dockerbuild
* **jenkins** contains the jenkinsfile with the pipeline definition
* **openshift** contains the yaml files used to configure resources on openshift
* **scripts** contains bash scripts that are executed by you locally on your machines

# Installation
* check out the repo if not done already
  ```
  https://github.com/iptrha/openshift_techbier.git
  cd openshift_techbier
  ```
  * Start the minishift cluster and log in as developer
    ```
    minishift start
    oc login -u developer -p d
    ```

    
# Support

## OSX
### I am getting ```xcrun: error: (...)``` when running git. What can I do?
Install XCode commandline tools ```xcode-select --install``` (see [here]( https://stackoverflow.com/questions/32893412/command-line-tools-not-working-os-x-el-capitan-macos-sierra-macos-high-sierra/32894314#32894314) for more details)

### How to install Minishift on OSX?**
Make your life easy and install [HomeBrew](https://brew.sh/index_de.html):
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask install minishift
brew install docker-machine-driver-xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
eval $(minishift oc-env)
```

## Windows
### How to install Minishift on OSX?**
Maybe this guide can help you, if you are lost: [bierkowski.com](https://bierkowski.com/minishift-setup-on-windows/)
