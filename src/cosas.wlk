object knightRider {
	method bulto() { return 1 }	
	method esCargado() {
		//No hace nada	
	}
	
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true

	method bulto() { return 2 }
	method esCargado() {
		transformadoEnAuto = true
	}	
	
	method esAuto() { return transformadoEnAuto }
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 1

	method bulto() { 
		return if (cantidadDeLadrillos <= 100) {
				1
			} else if (cantidadDeLadrillos <= 300) {
				2
			} else {
				3
			}			
	}	
	method esCargado() {
		cantidadDeLadrillos += 12
	}
	
	method nivelPeligrosidad() { return 2}
	method peso() { return cantidadDeLadrillos * 2 }
}

object arenaAGranel {
	var property peso = 1

	method bulto() { return 1 }	
	method esCargado() {
		peso += 20
	}
	
	method nivelPeligrosidad() { return 1 }
}

object bateriaAntiaerea {
	var property tieneMisiles = true

	method bulto() { return if (tieneMisiles) 2 else 1 }	
	method esCargado() {
		tieneMisiles = true
	}
	
	method peso() { return if (tieneMisiles) 300 else 200 }
	method nivelPeligrosidad() { return if (tieneMisiles) 100 else 0 }
}

object contenedorPortuario {
	var property cosas = []

	method bulto() { return 1 + cosas.sum({cosa => cosa.bulto() }) }	
	method esCargado() {
		cosas.foreach({cosa => cosa.esCargado()})
	}
	
	method peso() { return 100 + cosas.sum({ cosa => cosa.peso() }) }
	method nivelPeligrosisdad() { return cosas.max({ cosa => cosa.nivelPeligrosidad() }) }
} 

object residuosRadioactivos {
	var property peso = 1

	method bulto() { return 1 }	
	method esCargado() {
		peso += 15
	}
	
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad {
	var property contenido = bumblebee

	method bulto() { return 2 }	
	method esCargado() {
		//No hace nada
	}
	
	method peso() { return contenido.peso() }
	method nivelPeligrosidad() { return contenido.nivelPeligrosidad() / 2}
}

