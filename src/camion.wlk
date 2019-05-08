import cosas.*

object camion {
	var property cosas = []
	var property pesoTara = 1000
	var property pesoMaximo = 2500
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal() {
		return pesoTara + self.pesoCarga()
	}
	
	method pesoCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}
	
	method objetosPeligrosos(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({cadaCosa => cadaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.any({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad})
	}
	
/*------------------------------------AGREGADOS AL CAMIÓN------------------------------------------------*/

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({ cosa => (cosa.peso() > min) && (cosa.peso() < max) })
	}
	
	
	
}
