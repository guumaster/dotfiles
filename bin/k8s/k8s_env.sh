#!/bin/bash

DEV_LOCAL_KUBECONFIG=$HOME/.kube/config.microk8s
DEV_LOCAL_DASHBOARD=https://localhost:8080

DEV_METAL_KUBECONFIG=$HOME/.kube/config.kst-dev-metal
DEV_METAL_DASHBOARD=https://192.168.77.77:6443

DEV_EKS_KUBECONFIG=$HOME/.kube/config.kst-dev-eks

export K8S_ENV=local

function k8s_get_nodes() {
  echo "$K8S_ENV nodes: \n"
  kubectl get nodes
  echo ""
  echo "kubectl setup to $K8S_ENV"
}

function kenv() {
  ENV=$1
  if [ -z "$ENV" ]; then
    echo "k8s env: $K8S_ENV"
    k8s_get_nodes
    return
  fi
  case $ENV in

    local)
      export K8S_DASHBOARD_URL=$DEV_LOCAL_DASHBOARD
      export KUBECONFIG=$DEV_LOCAL_KUBECONFIG
    ;;

    dev_metal)
      export K8S_DASHBOARD_URL=$DEV_METAL_DASHBOARD
      export KUBECONFIG=$DEV_METAL_KUBECONFIG
    ;;

    *)
      echo "Unknown env $K8S_ENV"
      return

  esac
  export K8S_ENV=$1
  k8s_get_nodes
}

