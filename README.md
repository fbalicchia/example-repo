# Example-repo
Repo used for experiments Argocd Ecosystem. The goal of this branch is to understand how to tune the system based on the number
of installed applications.

There are two scripts one that generates k8s namespaces and another one that generates applications, in this manner, we simulate NxM applications


`generator-apps` generate n applications from a base number and put those in startup order through the waves.
for example typing 

```bash
./generator-apps.sh 2 150
```
it generated two nginx application called 150 and 151

I the same ways `generator-org.sh` generate n namespaces from a base

```bash
./generator-org.sh 2 150
```
it generated two namespaces called 150 and 151


# Notes
Application Dependencies can be useful in our env only in the first installation. When auto sync is enabled needs to be done manually