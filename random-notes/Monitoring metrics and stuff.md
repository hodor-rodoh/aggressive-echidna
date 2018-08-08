# Monitoring/Datadoge stuff

how does this work? kubernetes and the containers ship logs and stuff
(ingress, nginx, kube-state?, bunch of shit)

How to process this literal stuff?
Datadoge and filter metrics into dashboards and make it meaningful

KPIs for folks
#### NIGNX? <br/>
what is this? http server and reverse proxy = can be used for load balancing <br/>
what is good to measure?

How does NIGINX handle requests

1. new connection --> Accepts++ --> Handled++ --> Active

2. Additional Requests --> Waiting --> reading requests++ --> writing

accepts + handled and requests are always going to be growing. <br/>
active, waiting, reading, and writing change with volume.

name | description | metric type
--- | --- | ---
accepts | # of connected attempted by NGINX | resource ULT
Handled | # of successful connections | resource ULT
active | currently active connections | resource ULT
dropped | # of dropped connections (accepts - handled),  normally should be 0 | errors
requests | # of client requests | throughput

#### HWAT?

__nginx requests__ = probably 1st detection? since it can measure in seconds and
all it's for all requests.

__server errors__ = 4xx (client side) & 5xx errors (server errors)

4xx = errors when it seems to have been caused from the client side. example 404
the resource cannot be found right now.

5xx = errors from the server side. The server knows it had an error
but is unable to process the request example 503 - service unavailable 

#### Kubernetes Monitoring
kubernetes orchestrastes stuff (communication, app deployment, management, etc).

pods are the smallest thing that can be deployed that can be managed by
kubernetes.
A pod can have 1 or more containers. Containers are always scheduled
together but can run different apps. Containers in the same pod share the same
IP range, port space, context, and namespace.
