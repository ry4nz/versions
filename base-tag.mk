# TODO - consider moving this to the mk/ dir as well

# REGISTRY_URL variable is introduced in order to enable logging into private docker registries
# such as MSR. This is used in maybe-login target in push.mk make file. If you need to login to a
# private registry, set the value of this variable to the URL of the registry or just leave it empty
# if you need to use Docker Hub.
REGISTRY_URL ?= msr.ci.mirantis.com
K8S_REGISTRY_URL = 'registry.k8s.io'

DOCKER_ENGINE_DOCS_BRANCH=20.10
DEV_ORG=mirantiseng
DOCKER_EE_REPO_URL=https://repos.mirantis.com
DOCKER_EE_REPO_VERSION=23.0
# To get the list of available docker-ee-cli versions, on an Ubuntu machine use
#    apt-cache madison docker-ee-cli | grep -oE '[0-9.]+{3}~[0-9.a-zA-Z]+-0~ubuntu' | sed 's/-0~ubuntu$//'
DOCKER_EE_CLI_VERSION=23.0.11~3
TESTKIT_IMAGE=$(REGISTRY_URL)/${DEV_ORG}/testkit:v0.10.1

# Used for all pinned base images
BASE_IMAGE_TAG=3.7.4-e025550
UI_BASE_IMAGE_TAG=3.7.9-c334365

RETHINKDB_BASE_IMAGE_TAG=2.4.3-mirantis-0.1.0

ETCD_COMMIT=v3.5.13

NVIDIA_PLUGIN_COMMIT=0d8326a
NVIDIA_GPU_DISCOVERY_COMMIT=v0.8.2
NODE_FEATURE_DISCOVERY_COMMIT=v0.13.6

# Default configuration for selenium tests
SELENIUM_BROWSERS=chrome
SELENIUM_VERSION=3.141.59
SELENIUM_SESSIONS_PER_NODE=2
BROWSERSTACK_PARALLEL_SESSIONS=2

INTERLOCK_VER=v3.3.13
CALICO_VER=v3.28.0
CALICO_VER_WINDOWS=v3.28.0
COREDNS_VER=v1.11.1
KUBE_INGRESS_CONTROLLER_VER=v1.10.1
# NOTE: Update gatekeepertemplate.go, gatekeepernamespace.go or gatekeepercrds.go
# in agent2/reconciler/kubeyamlfixtures/ if needed for this version bump.
GATEKEEPER_VERSION=v3.14.2
METALLB_VERSION=v0.14.5
NODE_LOCAL_DNS_VERSION=1.23.1
KUBE_STATE_METRICS_VERSION=v2.12.0
ENZI_VERSION=1.2.0
PYYAML_VERSION=6.0
RETHINKCLI_NI_VERSION=v2.2.0-ni
RETHINKDB_EXPORTER_VERSION=v1.0.1
NODE_EXPORTER_VERSION=d333366
MULTUS_CNI_VERSION=e2e8cfb

PROMETHEUS_VERSION=2.48.0
BLACKBOX_VERSION=0.25.0
ALERT_MANAGER_VERSION=0.27.0
CADVISOR_VERSION=v0.49.1

KUBE_GMSA_WEBHOOK_VER=v0.8.0

## Make sure to run `make kube-swagger` when KUBE_VER is updated.
KUBE_VER=v1.27.14
PAUSE_VER=3.8
HYPERKUBE_VER=${KUBE_VER}-mirantis-1-7b54040
ALPINE_VER=3.18
# if you change it here, change the value in the go.mod file as well
GOLANG_VER=1.21.10
PYTHON_VER=3.12.1
ALPINE=alpine:${ALPINE_VER}
CLOUD_CONTROLLER_VER=v1.27.7

# For Windows and Linux Dockerfile guidelines, refer https://github.com/containerd/containerd/blob/v1.3.2/docs/managed-opt.md
# TODO change back to containerd-shim-process
CONTAINERD_SHIM_PROCESS=mirantiseng/ucp-containerd-shim-process

MAX_BUNDLE_SIZE=1000000000
MAX_BUNDLE_SIZE_WINDOWS = 850000000

# Linux or multi-arch images
GOLANG_ALPINE=golang:${GOLANG_VER}-alpine${ALPINE_VER}
PYTHON_ALPINE=python:${PYTHON_VER}-alpine${ALPINE_VER}
GOLANG_NVIDIA=golang:${GOLANG_VER}
GOLANG_COREDNS=golang:${GOLANG_VER}
UBUNTU=ubuntu:22.04
UCP_CRI_DOCKERD_VERSION=0.3.14
UCP_HYPERKUBE_BASE=ubuntu:22.04
SWARM=$(REGISTRY_URL)/mirantiseng/ucp-swarm:v1.3.0-ucp28
NODE_ALPINE=node:18.17.0-alpine
NODE_SLIM=node:18.17.0-slim
KUBE=$(REGISTRY_URL)/mirantiseng/hyperkube-amd64:${HYPERKUBE_VER}
COREDNS=coredns/coredns:${COREDNS_VER}
KUBE_INGRESS_CONTROLLER=$(K8S_REGISTRY_URL)/ingress-nginx/controller:${KUBE_INGRESS_CONTROLLER_VER}
CALICO_KUBE_CONTROLLERS=calico/kube-controllers:$(CALICO_VER)
CALICO_NODE=calico/node:$(CALICO_VER)
CALICO_CNI=calico/cni:$(CALICO_VER)
PAUSE=$(REGISTRY_URL)/mirantiseng/k8s-pause:${PAUSE_VER}
INTERLOCK=$(REGISTRY_URL)/mirantiseng/interlock:$(INTERLOCK_VER)-linux-amd64
INTERLOCK_EXTENSION=$(REGISTRY_URL)/mirantiseng/interlock-extension-nginx:$(INTERLOCK_VER)-linux-amd64
INTERLOCK_CONFIG=$(REGISTRY_URL)/mirantiseng/interlock-config:$(INTERLOCK_VER)-linux-amd64
INTERLOCK_PROXY=$(REGISTRY_URL)/mirantiseng/interlock-proxy:$(INTERLOCK_VER)-linux-amd64
export INTERLOCK_RTTF=$(REGISTRY_URL)/mirantiseng/interlock-rttf:$(INTERLOCK_VER)-linux-amd64
OPENLDAP=$(REGISTRY_URL)/mirantiseng/openldap-docker:latest
SAML_IDP=$(REGISTRY_URL)/mirantiseng/saml-idp:latest
ENZI_EXAMPLE_SERVICE=$(REGISTRY_URL)/mirantiseng/ucp-oidc-client:latest
ENZI=$(REGISTRY_URL)/mirantiseng/enzi:${ENZI_VERSION}
BROWSERSTACK_LOCAL_IMAGE=${REGISTRY_URL}/${DEV_ORG}/browserstack-local:${BASE_IMAGE_TAG}
GATEKEEPER=openpolicyagent/gatekeeper:${GATEKEEPER_VERSION}
METALLB_SPEAKER=quay.io/metallb/speaker:${METALLB_VERSION}
METALLB_CONTROLLER=quay.io/metallb/controller:${METALLB_VERSION}
NODE_LOCAL_DNS=k8s.gcr.io/dns/k8s-dns-node-cache:${NODE_LOCAL_DNS_VERSION}
KUBE_STATE_METRICS=registry.k8s.io/kube-state-metrics/kube-state-metrics:${KUBE_STATE_METRICS_VERSION}
GMSA_WEBHOOK=registry.k8s.io/gmsa-webhook/k8s-gmsa-webhook:$(KUBE_GMSA_WEBHOOK_VER)
CADVISOR=gcr.io/cadvisor/cadvisor:${CADVISOR_VERSION}
CLOUD_CONTROLLER_MANAGER=registry.k8s.io/provider-aws/cloud-controller-manager:$(CLOUD_CONTROLLER_VER)

# Tags correspond to commit of repo https://github.com/Mirantis/containerd-shim-process.
CONTAINERD_SHIM_PROCESS_VER=3.7.4
CONTAINERD_SHIM_PROCESS_VER_WINDOWS=3.7.7win

# For Apple Silicon chips modify OS_ARCH to x86 to let the build progress.
ifeq ("$(OS_ARCH)","linux:aarch64")
    OS_ARCH=linux:x86_64
endif

ifeq ("$(OS_ARCH)","linux:x86_64")
    ARCH=x86_64
    ARCH_EXT=
    ARCH_NS=
    ARCH_IMG=$(ARCH_IMG_LINUX)
    _ARCH= _linux
    PRODUCT_IMAGE_DEPS=$(DEV_ORG)/ucp-build$(ARCH_IMG) $(DEV_ORG)/ucp-base$(ARCH_IMG) $(DEV_ORG)/ucp-base-ubuntu$(ARCH_IMG)
    PRODUCT_UI_IMAGE_DEPS=$(DEV_ORG)/ucp-ui-dependencies$(ARCH_IMG)
    ifeq ("$(DETECTED_LINUX_CONTEXT)","$(LINUX_CONTEXT)")
        USE_TARGET_CONTEXT=$(USE_LINUX_CONTEXT)
    endif
else ifeq ("$(OS_ARCH)","windows:x86_64")
    ARCH_DOCKERFILE_EXT = $(ARCH_DOCKERFILE_WINDOWS_EXT)
    ARCH_IMG = $(ARCH_IMG_WINDOWS)

    # Windows used to be very particular about builds, but now has better
    # backwards compatibility, so we just have to make sure the golang image runs properly
    # to confirm we're on a recent enough build to be "safe"
    ifeq "$(WIN_BUILD)" ""
        WIN_BUILD := $(word 2,$(shell docker info --format='{{.KernelVersion}}'))
    endif
    # windows specific images
    ifeq "$(WIN_BUILD)" "20348"
        ARCH_TAG_EXT= .win2022
        _ARCH = _win_2022
        GOLANG_WINDOWS = golang:${GOLANG_VER}-windowsservercore-ltsc2022
        NANOSERVER = mcr.microsoft.com/powershell:nanoserver-ltsc2022
    else ifeq "$(WIN_BUILD)" "17763"  # RS5
        ARCH_TAG_EXT= .win2019
        _ARCH = _win_2019
        GOLANG_WINDOWS = golang:${GOLANG_VER}-windowsservercore-1809
        NANOSERVER = mcr.microsoft.com/powershell:nanoserver-1809
    else
        $(error Windows build $(WIN_BUILD) is not supported)
    endif
    ifeq ("$(DETECTED_WINDOWS_CONTEXT)","$(WINDOWS_CONTEXT)")
        USE_TARGET_CONTEXT=$(USE_WINDOWS_CONTEXT)
    endif
else
    $(error $(OS_ARCH) not supported)
endif


# Export all the relevant variables so they get picked up in helper scripts
export ALPINE
export ARCH
export ARCH_EXT
export ARCH_IMG
export ARCH_NS
export BROWSERSTACK_LOCAL_IMAGE
export BROWSERSTACK_PARALLEL_SESSIONS
export CALICO_VER
export CALICO_VER_WINDOWS
export CONTAINERD_SHIM_PROCESS
export CONTAINERD_SHIM_PROCESS_VER
export DOCKER_ENGINE_DOCS_BRANCH
export ENZI
export GOLANG_ALPINE
export PYTHON_ALPINE
export INTERLOCK
export INTERLOCK_EXTENSION
export INTERLOCK_PROXY
export KUBE
export KUBE_VER
export KUBE_INGRESS_CONTROLLER
export KUBE_INGRESS_CONTROLLER_VER
export NODE_ALPINE
export NODE_SLIM
export OPENLDAP
export SAML_IDP
export SELENIUM_BROWSERS
export SELENIUM_SESSIONS_PER_NODE
export SELENIUM_VERSION
export SWARM
export UBUNTU
export UCP_HYPERKUBE_BASE
export _ARCH
export ARCH_TAG_EXT
export GATEKEEPER_VERSION
export GATEKEEPER
export METALLB_VERSION
export METALLB_CONTROLLER
export METALLB_SPEAKER
export NODE_LOCAL_DNS_VERSION
export NODE_LOCAL_DNS
export KUBE_STATE_METRICS_VERSION
export KUBE_STATE_METRICS
export PYYAML_VERSION
export RETHINKCLI_NI_VERSION
export RETHINKDB_EXPORTER_VERSION
export NODE_EXPORTER_VERSION
export MULTUS_CNI_VERSION
export PROMETHEUS_VERSION
export BLACKBOX_VERSION
export ALERT_MANAGER_VERSION
export CADVISOR_VERSION
export CADVISOR
export CLOUD_CONTROLLER_MANAGER
export CLOUD_CONTROLLER_VER
