object inta {
	var property coleccionParcelas = []
	
	method promedio(){
		return coleccionParcelas.sum({ p=> p.coleccionPlantas().size() })/coleccionParcelas.size()
	}
	
	method masSustentable(){
		const parcelas = coleccionParcelas.map({p => p.coleccionPlantas().size() >= 4})
		return parcelas.max({p => p.cantidadAsociadas()})
	}	
}