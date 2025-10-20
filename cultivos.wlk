import wollok.game.*
import personaje.*
class Maiz {
	var estado = bebe 
	var property position = game.at(1, 1)
	const property precio = 150 //monedas x maiz

	//var esAdulto = false

	method esAdulto(){
		return estado.esAdulto()
	}
//quiero hacer un metodo que diga es adulto, sin usar variable, entonces para ello se lo delego a cada estado
	method cambiarEstado(_estado) {
	  estado = _estado
	}
	method regar() {
	  estado.crecer(self)
	}
	method image() {
		return "corn_" + estado.nombreEstado() + ".png"
	}
	method esMaiz() {
	  return true
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
	method esAdulto() { 
    	return false 
    }
}

object adult {
	method nombreEstado() {
		return "adult"
	}
	method crecer(maiz) {
		game.say(self,"Ya Crecio")
	}
	method esAdulto() { 
    	return true 
    }
}
class Trigo {
  var nivel = nivelCero
  var property position = game.at(2, 4)

	method precio() {
	  return nivel.precio() 
	}
	method cambiarNivel(_nivel) {
		nivel = _nivel
	}
	method nivel() = nivel //lo agregue pq sino no lo podia ver en el test, preguntar si es una buena practica 
	method regar() {
	  nivel.evolucionar(self) //agregar un printl en rgar 
	}
	//pregunar bien si puedo mejorarlo


	method image() {
		return "wheat_" + nivel.nivel() + ".png"
	}
	method esAdulto(){
		return nivel.esAdulto()
	}
} 
//para el trigo, vamos a volverlo como el maiz, luego buscar una solucion mas feliz
//donde no sea necesario crear objetos ya que solo son numeros y puedo tratarlos de niveles
/*
	method regar() {
	  return if(estado == 0) 1 else if(estado == 1) 2 else if(estado == 2) 3 else 4
	}//game.height() - 1

*/
object nivelUno {
	method nivel() {
	  return "1"
	}
	method evolucionar(trigo) {
		trigo.cambiarNivel(nivelDos)
		game.say(trigo, "CRECIO")
	}
	method esAdulto() { 
    	return false 
    }
	method precio() {
	  return 0
	}
}
object nivelDos {
  method nivel() {
	  return "2"
	}
	method evolucionar(trigo) {
		trigo.cambiarNivel(nivelTres)
		game.say(trigo, "CRECIO")
	}
	method esAdulto() { 
    	return true 
    }
	method precio() {
	  return 100
	}
}
object nivelTres {
    method nivel() {
	  return "3"
	}
	method evolucionar(trigo) {
		trigo.cambiarNivel(nivelCero)
		game.say(trigo, "Retrocedio!")
	}
	method esAdulto() { 
    	return true 
    }
	method precio() {
	  return 200
	}
}

object nivelCero {
    method nivel() {
	  return "0"
	}
	method evolucionar(trigo) {
		trigo.cambiarNivel(nivelUno)
		game.say(trigo, "Crecio!")
	}
	method esAdulto() { 
    	return false 
    }
	method precio() {
	  return 0 //esto no es deuda? -100 |(etapa - 1) * 100
	}
}
class Tomaco {
  var property position = game.at(0, 0)
    
	method precio() {
	  return 80
	}

	method regar() { //como solo funciona en una vez deberia hacerlo recursivamente hasta encontrar vacio
	   //primero obtenemos la nueva posicion donde se va a regar
	   const nuevaPosition = if(position.y() == 9){
									game.at(position.x(), 0)
								} else {
									game.at(position.x(), position.y() + 1)
								} // obtengo la nueva posicion dependiendo del testeo 
		
	    if(game.getObjectsIn(nuevaPosition).any({obj => obj != self})){

			position = self.sumarUnoMas(nuevaPosition)
			//console.println("Entro al if" + nuevaPosition)
			self.error("Ya hay alguien ahi, entonces me voy uno mas")
			
		} else {
			position = nuevaPosition
			//console.println("Entro al else" + nuevaPosition)
		  }//vemos que en la nueva posicion no haya nada 
		

      /*
	  if(position.y() == 9){
		position = game.at(position.x(), 0)
	  } else {
		position = game.at(position.x(), position.y() + 1)
	  } //esto sube sin importar si ya hay una semilla por eso modificar 
	  */
	  
	}
	method sumarUnoMas(posicion) {
		return if(position.y() == 9){
			 game.at(posicion.x(), 1)

			} else {
				game.at(posicion.x(), posicion.y() + 1)
			}
	  
	}

	method image() {
		return "tomaco.png"
	}
	method esAdulto() { 
    	return true 
    }

	/*//Para evitar que si sube en uno no haya otra planta en ella
	method validarSiNoHayNadaAqui() {
	  if(game.getObjectsIn(position).any({obj => obj != personaje})){
			self.error("Ya hay algo aqui")
	  }
	}*/
}
/*https://xtext.wollok.org/documentacion/wollokdoc/
https://www.wollok.org/documentation/language/#wollok.game*/
