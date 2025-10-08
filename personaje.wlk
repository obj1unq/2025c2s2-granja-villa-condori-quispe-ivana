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
		//const visual = game.hasVisual(semilla)
	  //self.validarSiHaySemillaAqui()
      
	  game.addVisual(semilla)
	  cultivosSembrados.add(semilla)

	  console.println(position)
	}

	method validarSiHaySemillaAqui() {
	  if(self.haySemillaEn(self.position())){
		self.error("Ya hay Semilla")
	  }
	}

	method regarA() {
	  const cultivo = game.getObjectsIn(self.position()).last()
	  //self.validarSiHaySemillaAqui()

	  cultivo.regar()
      console.println(cultivo)
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
} 