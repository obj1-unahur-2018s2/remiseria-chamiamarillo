import vehiculos.*
import agencias.*


class Viaje {
	var property coloresIncompatibles = #{}
	var property kilometros
	var property tiempoMaximo
	var property cantidadDePasajero
	var autoQueLoHizo
	
	method autoQueLoHizo(_auto) { autoQueLoHizo = _auto }
	method autoQueLoHizo() { return autoQueLoHizo }
	
	method agregarColoresIncompatibles(_color) {
		coloresIncompatibles.add(_color)
	}
	
	method puedeHacerViaje(_auto) {
		var velocidadPromedio = kilometros / tiempoMaximo
		const colorAuto = _auto.color()
		
		return ((_auto.velocidadMaxima() > velocidadPromedio +10) and
			(_auto.capacidad() >= cantidadDePasajero) and
			not (coloresIncompatibles.contains(colorAuto))
		)
	}
	
}
