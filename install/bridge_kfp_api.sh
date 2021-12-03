#!/bin/bash

# Get the pod running the kfp api
export pod=$(microk8s kubectl get pods -n kubeflow -o wide | grep "kfp-api-[^o]" | cut -f1 -d ' ' -)

# Get the port of that pod that is open to html traffic
export port=$(microk8s kubectl get pod $pod -n kubeflow --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}')

# This processes doesn't escape, so run this in a separate terminal
microk8s kubectl port-forward -n kubeflow $pod 3000:$port