"vela-nginx": {
	annotations: {}
	attributes: workload: definition: {
		apiVersion: "apps/v1"
		kind:       "Deployment"
	}
	labels: {}
	type: "component"
}
output: {
	type: "k8s-objects"
	properties: {
		objects: [{
			apiVersion: "apps/v1"
			kind:       "Deployment"
			metadata: {
				name: "nginx-test-ignore"
				annotations: ignoreAnnotations: "xxx"
				labels: app:                    "nginx-test-ignore"
			}
			spec: {
				replicas: parameter.replicas
				selector: matchLabels: app: "nginx-test-ignore"
				template: {
					metadata: {
						annotations: ignoreAnnotations: "xxx"
						labels: {
							app:     "nginx-test-ignore"
							restart: "2"
						}
					}
					spec: containers: [{
						name:  "nginx"
						image: parameter.image
						resources: {
							limits: {
								cpu:    parameter.cpu
								memory: parameter.memory
							}
							requests: {
								cpu:    parameter.cpu
								memory: parameter.memory
							}
						}
					}]
				}
			}
		}]
	}
}
