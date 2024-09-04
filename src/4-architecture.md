# Architecture

Kubernetes uses a highly modular and distributed architecture designed to handle
complex containerized workloads at scale. It separates the control plane (master
components) from the data plane (worker components), ensuring scalability,
reliability, and flexibility [@burns2019kubernetes].

## Control Plane

The control plane consists of multiple components that manage the lifecycle and state
of containers.

- The [API Server](https://kubernetes.io/docs/concepts/architecture/#kube-apiserver)
  acts as the core hub, receiving commands from the users and provides the interface
  for other components to communicate [@k8s-architecture].
- The Scheduler efficiently allocates workloads (Pods) to nodes based on resource
  requirements and policies [@k8s-architecture].
- The Controller Manager ensures the cluster's current state aligns with the declared
  state by running processes to create, delete, or scale containers as needed. etcd
  serves as the cluster’s source of truth, storing all cluster configuration and
  state data in a distributed, consistent manner [@k8s-architecture].
- [**etcd**](https://kubernetes.io/docs/concepts/architecture/#etcd) serves as the
  cluster’s source of truth, storing all cluster configuration and state data in a
  distributed, consistent manner [ @k8s-architecture].

## Worker Nodes

These run the actual applications and contain:

- Kubelet, which directly manages containers on the node, ensuring that the pods are
  running in line with the specifications [@burns2019kubernetes].
- Kube-Proxy, which handles networking between the pods, ensuring that services are
  accessible and load-balanced [@burns2019kubernetes].
- Container Runtime (such as Docker or containerd) that runs and isolates application
  containers [@burns2019kubernetes].

The architecture is decentralized and fault-tolerant, allowing Kubernetes to maintain
high availability, even if parts of the cluster fail [@k8s-architecture].
