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

  * remember the IP of your minishift instance for later


* start the s2i build (because it takes a lot of time)
  ```
  cd 1_s2i-openjdk/scripts
  sh install_s2i-openjdk.sh
  cd ../..
  ```

  * While it rödels, feel free to have a look at the code in ```1_s2i-openjdk/docker``` and ```1_s2i-openjdk/openshift``` (Hint: Contains lots of magic)


* install jenkins
  ```
  cd 2_jenkins_setup/scripts
  sh install-jenkins.sh
  cd ../..
  ```

  * This will create the projects ```cicd``` and ```build``` and install jenkins into the cicd project
  * Learn to pronounce the word "ephemeral". Again: "[Ephemeral](https://de.wiktionary.org/wiki/ephemeral)". It kind of means, when the juice stops, everything is gone. Like [Enron](https://en.wikipedia.org/wiki/Enron) stock.



* do the project initialization for your application
  ```
  cd 3_project_initialization/scripts
  sh initialize_project.sh
  cd ../..
  ```

  * It creates 3 projects ```helloworld-devl```, ```helloworld-test``` and ```helloworld-prod```. These represent the environments (Hint: There is no physical separation of environments, just trust the thing. No, really.)
  * Also it configures some access rights
  * Typically this would be executed by an admin


* Setup the application pipeline
  * First configure the minishift IP into the pipeline.yml
    ```
    cd 4_helloworld/openshift
    nano pipeline.yml
    ```

  * set the ```OPENSHIFT_URL``` to your minishift IP and save

  * Create the pipeline
    ```
    cd ../scripts
    sh create_helloworld_pipeline.sh
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
### How to install Minishift on Windows?**
Maybe this guide can help you, if you are lost: [bierkowski.com](https://bierkowski.com/minishift-setup-on-windows/)
