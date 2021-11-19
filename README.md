## K8s TLS environment

This is a simple playground for working with encryption and k8s

### Apps

There are two applications, a frontend that accepts traffic from a public endpoint, and a backend app that the frontend talks to.

### Network

An ingress route is setup to accept taffic at `/`, and expects TLS to be enabled. TLS will be terminated at the ingress level, then re-encrypted before being passed onto service.

All service to service traffic will be encrypted, and only allow traffic coming from within the network.

### Github

To push images up to the github registry, you will need to generate an auth token, and then use that to login via docker

    docker login -u [USERNAME] -p [AUTH_TOKEN] ghcr.io
