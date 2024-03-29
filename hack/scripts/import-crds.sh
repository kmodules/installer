#!/bin/bash

# Copyright AppsCode Inc. and Contributors
#
# Licensed under the AppsCode Community License 1.0.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# import cert-manager crds
crd-importer \
    --input=https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.crds.yaml \
    --out=./charts/cert-manager-crds/crds

# import prometheus-operator crds
crd-importer \
    --input=https://github.com/prometheus-operator/prometheus-operator/releases/download/v0.60.1/stripped-down-crds.yaml \
    --out=./charts/prometheus-operator-crds/crds

crd-importer \
    --input=https://github.com/kmodules/custom-resources/raw/release-1.25/crds/appcatalog.appscode.com_appbindings.yaml \
    --input=https://github.com/kmodules/custom-resources/raw/release-1.25/crds/metrics.appscode.com_metricsconfigurations.yaml \
    --out=./charts/kmodules-crds/crds
rm -rf charts/kmodules-crds/crds/auditor.appscode.com_siteinfoes.yaml
rm -rf charts/kmodules-crds/crds/auditor.appscode.com_siteinfos.yaml
