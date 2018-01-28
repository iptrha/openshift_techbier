# Introduction
# Prerequisites
1. [Install git](https://git-scm.com/downloads)
2. [Install Minishift](https://docs.openshift.org/latest/minishift/getting-started/installing.html) (see support section for details how to install)
3. [Do the "Minishift Quickstart"](https://docs.openshift.org/latest/minishift/getting-started/quickstart.html)

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
