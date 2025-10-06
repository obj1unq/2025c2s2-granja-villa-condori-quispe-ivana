import wollok.game.*
import personaje.*
class Maiz {
	var estado = bebe 
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(1, 1)
	}
	method image() {
		return "corn_" + estado.nombreEstado() + ".png"
	}
	method estado() {
	  if()
	}
}
object bebe {
  method nombreEstado() {
	return "baby"
  }
}
class Trigo {
  method position() {
	return game.at(2, 4)
  }
  method image() {
	return "wheat_.png"
  }
}

class Tomaco {
  method position() {
	return game.at(5, 4)
  }
  method image() {
	return "tomaco.png"
  }
}

object bebe {
  
}