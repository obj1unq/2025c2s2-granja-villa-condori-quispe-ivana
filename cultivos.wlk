import wollok.game.*
import personaje.*
class Maiz {
	var estado = bebe 
	var property position = game.at(1, 1)

	method cambiarEstado(_estado) {
	  estado = _estado
	}
	method regar() {
	  estado.crecer(self)
	}
	method image() {
		return "corn_" + estado.nombreEstado() + ".png"
	}
}
object bebe {
  method nombreEstado() {
	return "baby"
  }
  method crecer(maiz) {
	maiz.cambiarEstado(adult)
	game.say(maiz, "CRECIO")
  }
}

object adult {
  method nombreEstado() {
	return "adult"
  }
  method decrecer(maiz) {
	maiz.cambiarEstado(bebe)
	game.say(maiz, "CRECIO")
  }
}
class Trigo {
  var nivel = 1 //NIVEL
  var property position = game.at(2, 4)

  method aumentarNivel(_estado) {
	  estado = _estado
	}
//diferenciaR LO DE REGAR CON EL NIVEL
	method regar() {
	  //return if(estado == 0) 1 else if(estado == 1) 2 else if(estado == 2) 3 else 4
	}//game.height() - 1

  method image() {
	return "wheat_" + self.regar() + ".png"
  }
} //modificar

class Tomaco {
  var property position = game.at(0, 0)

	method regar() {
	  if(position.y() == game.height()){
		position = game.at(position.x(), 0)
	  } else {
		position = game.at(position.x(), position.y() + 1)
	  }
	  console.println(position)
	}

  method image() {
	return "tomaco.png"
  }
}

