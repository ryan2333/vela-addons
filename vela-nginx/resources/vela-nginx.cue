"vela-nginx": {
	annotations: {}
	attributes: workload: definition: {
		apiVersion: "apps/v1"
		kind:       "Deployment"
	}
	labels: {}
	type: "component"
}
template: {
	output: {
		type: "raw"
		properties: {
			apiVersion: "apps/v1"
			kind:       "Deployment"
			metadata: {
				name:      "nginx"
				namespace: parameter.namespace
			}
			spec: {
				replicas: parameter.replicas
				selector: matchLabels: app: "nginx"
				template: {
					metadata: labels: app: "nginx"
					spec: {
						containers: [{
							name:  "nginx"
							image: parameter.image
							ports: [{
								containerPort: parameter.port
							}]
						}]
					}
				}
			}
		}
	}
	outputs: {
		nginx: {
			apiVersion: "v1"
			kind:       "Service"
			metadata: {
				name: "vela-nginx"
				labels: app: "nginx"
			}
			spec: {
				type: parameter.serviceType
				selector: app: "nginx"
				ports: [{
					port:       parameter.port
					targetPort: parameter.port
				}]
			}
		}
	}
}
