import wollok.game.*
import personaje.*
class Maiz {
	//var estado = bebe 
	var property position = game.at(1, 1)
	/*method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(1, 1)
	}*/
	method image() {
		return "corn_baby.png"//"corn_" + estado.nombreEstado() + ".png"
	}/*
	method estado() {
	  if(sembrar){

	  }
	}*/
}
object bebe {
  method nombreEstado() {
	return "baby"
  }
}
class Trigo {
  var property position = game.at(2, 4)
  method image() {
	return "wheat_.png"
  }
}

class Tomaco {
  var property position = game.at(2, 4)
  method image() {
	return "tomaco.png"
  }
}

