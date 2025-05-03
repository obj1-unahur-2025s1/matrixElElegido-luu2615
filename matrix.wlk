object neo {
  var energia = 100
  
  method esElegido() = true

  method saltar() {
    energia = energia * 0.5
  }

  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var descansado = true

  method esElegido() = false

    method saltar() {
      descansado = not descansado
      vitalidad = vitalidad - 1
    }
}

object trinity {
    method esElegido() = false
    method saltar() {
    }
    method vitalidad() = 0
}

object nave {
  var pasajeros = [neo,morfeo,trinity]
  
  method cantidadPasajeros() = pasajeros.size()

  method pasajeroDeMayorVitalidad() = pasajeros.max({pasajero => pasajero.vitalidad()})
  method pasajeroDeMenorVitalidad() = pasajeros.min({pasajero => pasajero.vitalidad()})

  method estaEquilibrada() = ( self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad() * 2)

  method estaElElegido() = pasajeros.any({pasajero => pasajero.esElegido()})

  method chocar() {
    pasajeros.forEach({pasajero => pasajero.saltar()})
    pasajeros.clear()
  }

  method acelerar() {
    pasajeros.forEach({pasajero => if(not pasajero.esElegido()){pasajero.saltar()}})
  }
}