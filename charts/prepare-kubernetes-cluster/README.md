# Prepare Kubernetes Cluster

[Prepare Kubernetes Cluster by AppsCode](https://github.com/kmodules/installer) - Update Linux Kernel configuration of a Kubernetes Cluster nodes

## TL;DR;

```bash
$ helm repo add appscode https://charts.appscode.com/stable/
$ helm repo update
$ helm search repo appscode/prepare-kubernetes-cluster --version=v0.1.0
$ helm upgrade -i prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system --create-namespace --version=v0.1.0
```

## Introduction

This chart deploys a Kubernetes Job on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+

## Installing the Chart

To install/upgrade the chart with the release name `prepare-kubernetes-cluster`:

```bash
$ helm upgrade -i prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system --create-namespace --version=v0.1.0
```

The command deploys a Kubernetes Job on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `prepare-kubernetes-cluster`:

```bash
$ helm uninstall prepare-kubernetes-cluster -n kube-system
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `prepare-kubernetes-cluster` chart and their default values.

|         Parameter          |                                                                                                                       Description                                                                                                                       |                           Default                           |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| nameOverride               | Overrides name template                                                                                                                                                                                                                                 | <code>""</code>                                             |
| fullnameOverride           | Overrides fullname template                                                                                                                                                                                                                             | <code>""</code>                                             |
| preparer.repository        | Docker image used to run kernel configuration commands                                                                                                                                                                                                  | <code>tianon/toybox</code>                                  |
| preparer.pullPolicy        | Image pull policy of Docker image used for node preparation                                                                                                                                                                                             | <code>IfNotPresent</code>                                   |
| preparer.tag               | Image tag of Docker image used for node preparation                                                                                                                                                                                                     | <code>0.8.4</code>                                          |
| preparer.securityContext   | Security options the node preparer container should run with                                                                                                                                                                                            | <code>{"privileged":true}</code>                            |
| cleaner.repository         | Docker image used to uninstall this helm release                                                                                                                                                                                                        | <code>appscode/helm</code>                                  |
| cleaner.pullPolicy         | Image pull policy of Docker image used for helm command                                                                                                                                                                                                 | <code>IfNotPresent</code>                                   |
| cleaner.tag                | Image tag of Docker image used for helm command                                                                                                                                                                                                         | <code>3.4.2</code>                                          |
| cleaner.skip               | Skip generating cleaner YAML                                                                                                                                                                                                                            | <code>true</code>                                           |
| cleaner.securityContext    | Security options the helm cleaner container should run with                                                                                                                                                                                             | <code>{}</code>                                             |
| imagePullSecrets           | Specify an array of imagePullSecrets. Secrets must be manually created in the namespace. <br> Example: <br> `helm template charts/prepare-kubernetes-cluster \` <br> `--set imagePullSecrets[0].name=sec0 \` <br> `--set imagePullSecrets[1].name=sec1` | <code>[]</code>                                             |
| serviceAccount.create      | Specifies whether a service account should be created                                                                                                                                                                                                   | <code>true</code>                                           |
| serviceAccount.annotations | Annotations to add to the service account                                                                                                                                                                                                               | <code>{}</code>                                             |
| serviceAccount.name        | The name of the service account to use. If not set and create is true, a name is generated using the fullname template                                                                                                                                  | <code>""</code>                                             |
| podAnnotations             | Annotations passed to operator pod(s).                                                                                                                                                                                                                  | <code>{}</code>                                             |
| podSecurityContext         | Security options the operator pod should run with.                                                                                                                                                                                                      | <code>{}</code>                                             |
| resources                  | Compute Resources required by the node preparer and helm cleaner container                                                                                                                                                                              | <code>{}</code>                                             |
| nodeSelector               | Node labels for pod assignment                                                                                                                                                                                                                          | <code>{"beta.kubernetes.io/os":"linux"}</code>              |
| tolerations                | Tolerations for pod assignment                                                                                                                                                                                                                          | <code>[]</code>                                             |
| affinity                   | Affinity rules for pod assignment                                                                                                                                                                                                                       | <code>{}</code>                                             |
| node.features              | Specify an array of features to be enabled in a Kubernetes node. Available features: - DISABLE_THP: Disable Transparent Huge Page <br> Example: <br> `helm template charts/prepare-kubernetes-cluster \` <br> `--set node.features[0]=DISABLE_THP`      | <code>[]</code>                                             |
| node.sysctls               | Specify an array of sysctl parameters. <br> Example: <br> `helm template charts/prepare-kubernetes-cluster \` <br> `--set node.sysctls[0].name=vm.max_map_count \` <br> `--set node.sysctls[0].value=300000`                                            | <code>[{"name":"vm.max_map_count","value":"262144"}]</code> |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm upgrade -i`. For example:

```bash
$ helm upgrade -i prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system --create-namespace --version=v0.1.0 --set preparer.repository=tianon/toybox
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm upgrade -i prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system --create-namespace --version=v0.1.0 --values values.yaml
```
