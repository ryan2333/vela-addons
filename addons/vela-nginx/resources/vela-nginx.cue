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
			replicas: 1
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
					image: "nginx:1.18"
					resources: {
						limits: {
							cpu:    "200m"
							memory: "300Mi"
						}
						requests: {
							cpu:    "100m"
							memory: "200Mi"
						}
					}
				}]
			}
		}
	}
}
