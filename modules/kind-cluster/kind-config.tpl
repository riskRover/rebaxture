kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    image: kindest/node:${kubernetes_version}
    extraMounts:
      - hostPath: /etc/kubernetes/pki
        containerPath: /etc/kubernetes/pki
    extraPortMappings:
      - containerPort: 6443
        hostPort: 6443
        protocol: TCP
  - role: worker
    image: kindest/node:${kubernetes_version}
    extraMounts:
      - hostPath: /etc/kubernetes/pki
        containerPath: /etc/kubernetes/pki
    extraPortMappings:
      - containerPort: 6443
        hostPort: 6443
        protocol: TCP
  - role: worker
    image: kindest/node:${kubernetes_version}
    extraMounts:
      - hostPath: /etc/kubernetes/pki
        containerPath: /etc/kubernetes/pki
    extraPortMappings:
      - containerPort: 6443
        hostPort: 6443
        protocol: TCP
