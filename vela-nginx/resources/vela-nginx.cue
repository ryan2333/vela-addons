output: {
	metadata: {
		name: "nginx-test-ignore"
		annotations: ignoreAnnotations: "xxx"
		labels: app:                    "nginx-test-ignore"
	}
	spec: {
		replicas: 1
		selector: matchLabels: app: "nginx-test-ignore"
		strategy: {}
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
	apiVersion: "apps/v1"
	kind:       "Deployment"
}
outputs: {}
parameter: {}
