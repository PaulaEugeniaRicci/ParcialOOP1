import Plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasSol
	
	const listPlantas = []
	method coleccionPlantas() {return listPlantas}
	method agregarPlantas(planta){
		if (listPlantas.size() == self.cantPlantasTolera() or horasSol>= planta.toleranciaSol()+2){
			self.error("error")
		}
		else {listPlantas.add(planta)}
	}
	
	
	method superficie(){ return ancho*largo }
	
	method cantPlantasTolera(){
		return if (ancho>largo) {self.superficie()/5} else {self.superficie()/3 + largo}
	}
	
	method tieneComplicaciones(){ return listPlantas.any({p=> p.toleranciaSol()<horasSol}) }
	
	method seAsociaBien(planta)
	method cantidadAsociadas(){
		return listPlantas.count({p=> p.seAsociaBienEn(self)})
	}
	
}
class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(planta){
		return !self.tieneComplicaciones() and planta.parcelasIdeales(self)
	}
}
class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(planta){
		return self.cantPlantasTolera()<=2 and planta.esFuerte()
	}
}

