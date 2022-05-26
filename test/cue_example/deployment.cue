parameter: {
	name:  string
	image: string
}

template: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	spec: {
		selector: matchLabels: {
			"app.oam.dev/component": parameter.name
		}
		template: {
			metadata: labels: {
				"app.oam.dev/component": parameter.name
			}
			spec: {
				container: [{
					name:  parameter.name
					image: parameter.image
				}]
			}
		}
	}
}
parameter: {
	name:  "nginx"
	image: "nginx:1.16"
}
