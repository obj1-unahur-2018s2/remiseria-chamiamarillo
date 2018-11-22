class Corsa {
	var property color
		
	method capacidad() { return 4 }
	method velocidadMaxima() { return 150 }
	method peso() { return 1300 }
}

class Standard {
	var property color = "azul"
	var peso = 1200
	
	method tieneTanque() { return true }	
	method capacidad() {
		if(self.tieneTanque()) {
			return 3
		}else{
			return 4
		}
	}
	method velocidadMaxima() {
		if(self.tieneTanque()) {
			return 120
		}else{
			return 110
		}
	}
	method peso() {
		if(self.tieneTanque()) {
			return peso + 150
		}else{
			return peso
		}
	}
}

object trafic {
	var property color = "blanco"
	var pesoT = 4000
	var interior = null
	var motor = null
	
	method confInterior(_objeto) { interior = _objeto }
	method confMotor(_objeto) { motor = _objeto }
	
	method capacidad() {
		return interior.capacidad()
	}
	method peso() {
		return (pesoT + interior.peso() + motor.peso())
	}
	
	method velocidadMaxima() {
		return motor.velocidad()
	}
}
// objetos para la configuracion de la traffic
object comodo {
		
	method capacidad() { return 5 }
	method peso() { return 700 }
}

object popular {
	
	method capacidad() { return 12 }
	method peso() { return 1000 }
}

object pulenta {
	
	method velocidad() { return 130 }
	method peso() { return 800 }
}

object bataton {
	
	method velocidad() { return 80 }
	method peso() { return 500}
}
//

class AutosDistintos {
	var property color
	var property velocidadMaxima
	var property capacidad
	var property peso
}
