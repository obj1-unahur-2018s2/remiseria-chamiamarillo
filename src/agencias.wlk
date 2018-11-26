import vehiculos.*
import viajes.*

class Remisera {
	var lista = []
	var viajesRealizados = #{}
	var property valorPorKilometro 
	var property valorViajeMinimo
	
	method agregarAFlota(_vehiculo) {
		lista.add(_vehiculo)
	}
	
	method quitarDeFlota(_vehiculo) {
		lista.remove(_vehiculo)
	}
	
	method pesoTotalFlota() {
		return lista.sum({ v => v.peso()})
	}
	
	/*
	 * esRecomendable(), es verdadero si la remisería tiene al menos 
	 * 3 vehículos, y además, todos los vehículos registrados en la 
	 * remisería pueden ir al menos a 100 km/h.
	 */
	method esRecomendable() {
		return ((lista.size() >= 3) and (lista.any({ v => v.velocidadMaxima() >= 100 })))
	}
	
	method capacidadTotalYendoA(_velocidad) {
		return lista.filter({ v => v.velocidadMaxima() >= _velocidad }).sum({ p => p.capacidad() })
	}
	
	method colorDelAutoMasRapido() {
		return lista.max({ a => a.velocidadMaxima() }).color()
	}
	// metodo agregado para prueba de test
	method puedeHacerUnViaje(_auto,_viaje) {
		return (_viaje.puedeHacerViaje(_auto))
	}
	///////////////////////////////////////////
	method hacerUnViaje(_viaje) {
		return lista.filter({ a => _viaje.puedeHacerViaje(a) })
	}
	
	method registrarViaje(_viaje,_auto) {
		viajesRealizados.add(_viaje)
		_viaje.autoQueLoHizo(_auto)
	}
	
	method viajesRealizado(_auto) {
		return viajesRealizados.map({ v => v.autoQueLoHizo() == _auto }).size()
	}
	
	method lugaresLibres(_viaje) {
		return (_viaje.autoQueLoHizo().capacidad() -  _viaje.cantidadDePasajero())
	}
	
	method pagarAUnAuto(_viaje) {
		var viajekil
		viajekil = _viaje.kilometros() * valorPorKilometro
		if(viajekil > valorViajeMinimo ){
			return _viaje.kilometros() * valorPorKilometro 
		}else{
			return valorViajeMinimo
		}
	}
	
	
	
}
