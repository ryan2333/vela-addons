parameter: {
	namespace:   *"vela-system" | string
	replicas:    *1 | int
	image:       string
	port:        *80 | int
	cpu:         *200 | int
	memory:      *256 | int
	serviceType: *"ClusterIP" | "NodePort" | "LoadBalancer" | "ExternalName"
}
