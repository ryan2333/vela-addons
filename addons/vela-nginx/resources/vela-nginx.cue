output: {
	type: "raw"
	properties: {
		apiVersion: "apps/v1"
		kind:       "Deployment"
		metadata: {
			name: "nginx_test_ignore"
			annotations: ignoreAnnotations: "xxx"
			labels: app:                    "nginx_test_ignore"
		}
		spec: {
			replicas: parameter.replicas
			selector: matchLabels: app: "nginx_test_ignore"
			template: {
				metadata: {
					annotations: ignoreAnnotations: "xxx"
					labels: {
						app:     "nginx_test_ignore"
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
	}
}
