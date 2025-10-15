import cultivos.*
import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivosSembrados = []
	const cosasCosechadas = []
	var ganancias = 0

	method haySemillaEn(posicion) {
	  return game.getObjectsIn(posicion).size() == 2
	  // game.hasVisual(posicion) Booleasno
	}
	method enPosicionHay(posicion) {
	  return game.getObjectsIn(posicion)
	}
	
	method sembrar(semilla) {

	  self.validarSiHaySemillaAqui()
      
	  game.addVisual(semilla)
	  cultivosSembrados.add(semilla)

	  console.println(position) // despues borrar
	  //console.println(image().semilla)
	}

	method validarSiHaySemillaAqui() {
	  if(self.haySemillaEn(self.position())){
		self.error("Ya hay Semilla")
	  }
	}

	method regarA() {
	  const cultivo = game.getObjectsIn(self.position()).last() //porque utilizo el 
	  

	  cultivo.regar()
      console.println(cultivo)
	}

	method cosechar() {
	  // solo las plantas adultas sino exepcion
	  self.validarSiSemillaEsAdulta()
	  conso
	}

	method validarSiSemillaEsAdulta() {
	  if(not self.semillaEsAdultaEn(position)){
			self.error("No tengo para cosechar!")
			//preguntar el porque estos self error se pueden ver en el game sin ser SAy
	  }
	}
	method semillaEsAdultaEn(posicion) {
	  const cultivo = game.getObjectsIn(posicion).last() //con last me traigo el cultivo
	  return cultivo.esAdulto()
	}

}
object configurarElMundo {
  method mDeSembrarMaiz(){
	//const maiz = new Maiz()
	keyboard.m().onPressDo({personaje.sembrar(new Maiz(position = personaje.position()))})
  }
  method tDeSembrarTrigo() {
	keyboard.t().onPressDo({personaje.sembrar(new Trigo(position = personaje.position()))})
  }
  method oDeSembrarTomaco() {
	keyboard.o().onPressDo({personaje.sembrar(new Tomaco(position = personaje.position()))})
  }
  method rDeRegar() {
	keyboard.r().onPressDo({personaje.regarA()})
  }
  method cDeCosechar() {
	keyboard.c().onPressDo({personaje.cosechar()})
  }
} 