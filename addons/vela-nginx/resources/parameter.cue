parameter: {
	namespace:   *"vela-system" | string
	replicas:    *1 | int
	image:       *"nginx:1.18" | string
	port:        *80 | int
	cpu:         *"200m" | string
	memory:      *"256Mi" | string
	serviceType: *"ClusterIP" | "NodePort" | "LoadBalancer" | "ExternalName"
}
