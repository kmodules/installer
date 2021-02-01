# Prepare Kubernetes Cluster

[Prepare Kubernetes Cluster by AppsCode](https://github.com/kmodules/installer) - Update Linux Kernel configuration of a Kubernetes Cluster nodes

## TL;DR;

```console
$ helm repo add appscode https://charts.appscode.com/stable/
$ helm repo update
$ helm install prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system
```

## Introduction

This chart deploys a Kubernetes Job on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+

## Installing the Chart

To install the chart with the release name `prepare-kubernetes-cluster`:

```console
$ helm install prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system
```

The command deploys a Kubernetes Job on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `prepare-kubernetes-cluster`:

```console
$ helm delete prepare-kubernetes-cluster -n kube-system
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `prepare-kubernetes-cluster` chart and their default values.

|         Parameter          |                                                                                                                       Description                                                                                                                       |                     Default                      |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| nameOverride               | Overrides name template                                                                                                                                                                                                                                 | `""`                                             |
| fullnameOverride           | Overrides fullname template                                                                                                                                                                                                                             | `""`                                             |
| preparer.repository        | Docker image used to run kernel configuration commands                                                                                                                                                                                                  | `tianon/toybox`                                  |
| preparer.pullPolicy        | Image pull policy of Docker image used for node preparation                                                                                                                                                                                             | `IfNotPresent`                                   |
| preparer.tag               | Image tag of Docker image used for node preparation                                                                                                                                                                                                     | `0.8.4`                                          |
| preparer.securityContext   | Security options the node preparer container should run with                                                                                                                                                                                            | `{"privileged":true}`                            |
| cleaner.repository         | Docker image used to uninstall this helm release                                                                                                                                                                                                        | `appscode/helm`                                  |
| cleaner.pullPolicy         | Image pull policy of Docker image used for helm command                                                                                                                                                                                                 | `IfNotPresent`                                   |
| cleaner.tag                | Image tag of Docker image used for helm command                                                                                                                                                                                                         | `3.4.2`                                          |
| cleaner.skip               | Skip generating cleaner YAML                                                                                                                                                                                                                            | `true`                                           |
| cleaner.securityContext    | Security options the helm cleaner container should run with                                                                                                                                                                                             | `{}`                                             |
| imagePullSecrets           | Specify an array of imagePullSecrets. Secrets must be manually created in the namespace. <br> Example: <br> `helm template charts/prepare-kubernetes-cluster \` <br> `--set imagePullSecrets[0].name=sec0 \` <br> `--set imagePullSecrets[1].name=sec1` | `[]`                                             |
| serviceAccount.create      | Specifies whether a service account should be created                                                                                                                                                                                                   | `true`                                           |
| serviceAccount.annotations | Annotations to add to the service account                                                                                                                                                                                                               | `{}`                                             |
| serviceAccount.name        | The name of the service account to use. If not set and create is true, a name is generated using the fullname template                                                                                                                                  | `""`                                             |
| podAnnotations             | Annotations passed to operator pod(s).                                                                                                                                                                                                                  | `{}`                                             |
| podSecurityContext         | Security options the operator pod should run with.                                                                                                                                                                                                      | `{}`                                             |
| resources                  | Compute Resources required by the node preparer and helm cleaner container                                                                                                                                                                              | `{}`                                             |
| nodeSelector               | Node labels for pod assignment                                                                                                                                                                                                                          | `{"beta.kubernetes.io/os":"linux"}`              |
| tolerations                | Tolerations for pod assignment                                                                                                                                                                                                                          | `[]`                                             |
| affinity                   | Affinity rules for pod assignment                                                                                                                                                                                                                       | `{}`                                             |
| node.features              | Specify an array of features to be enabled in a Kubernetes node. Available features: - DISABLE_THP: Disable Transparent Huge Page <br> Example: <br> `helm template charts/prepare-kubernetes-cluster \` <br> `--set node.features[0]=DISABLE_THP`      | `[]`                                             |
| node.sysctls               | Specify an array of sysctl parameters. <br> Example: <br> `helm template charts/prepare-kubernetes-cluster \` <br> `--set node.sysctls[0].name=vm.max_map_count \` <br> `--set node.sysctls[0].value=300000`                                            | `[{"name":"vm.max_map_count","value":"262144"}]` |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system --set preparer.repository=tianon/toybox
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install prepare-kubernetes-cluster appscode/prepare-kubernetes-cluster -n kube-system --values values.yaml
```
