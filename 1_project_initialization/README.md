# Introduction
The project initialization takes place at the beginning of a new application project. During initialization, all the necessary Openshift artifacts are created.

In our case, 3 Openshifts projects are created <app_name>**-devl**, <app_name>**-test**, <app_name>**-prod**,

# Installation
```bash
cd 1_project_initialization/scripts
sh initialize_project.sh -p <app_name>
```
If no argument is presented, the script initializes the default app ```demoapp```.
