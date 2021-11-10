import Parcelas.*

class Planta {
	
	var property anioObtencion
	var property altura
	
	method toleranciaSol()	
	method daSemillas(){
		return self.esFuerte()
	}
	method espacioOcupado()
	method parcelasIdeales(parcela)
	
	method esFuerte(){ return self.toleranciaSol()>10}
	
	method seAsociaBienEn(parcela){
		return parcela.seAsociaBien(self)
	}
}

class Menta inherits Planta {
	override method toleranciaSol() = 6
	override method daSemillas() {
		return super() or altura>0.4
	}
	override method espacioOcupado() = altura*3
	override method parcelasIdeales(parcela){
		return parcela.superficie() > 6
	}
}

class Soja inherits Planta {
	override method toleranciaSol(){
		if (altura < 0.5) return 6
		if (altura <= 1 and altura >= 0.5) return 7
		else return 9
	}
	override method daSemillas() {
		return super() or (anioObtencion > 2007 and altura > 1)
	}
	override method espacioOcupado() = altura/2
	override method parcelasIdeales(parcela){
		return parcela.horasSol() == self.toleranciaSol()
	}
}

class Quinoa inherits Planta {
	var property toleranciaSol
	override method daSemillas(){
		return super() or anioObtencion<2005
	}
	override method espacioOcupado() = 0.5
	
	override method parcelasIdeales(parcela){
		return parcela.coleccionPlantas().all({p => p.altura()<1.5})
	}
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	override method parcelasIdeales(parcela){
		return parcela.cantPlantasTolera() == 1
	}
}

class Hierbabuena inherits Menta{
	override method espacioOcupado() = super()*2
}