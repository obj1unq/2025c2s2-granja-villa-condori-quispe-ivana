import cultivos.*
import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivosSembrados = []
	const cosasCosechadas = []
	var ganancias = 0

	method haySemillaEn(posicion) {
	  //return cultivosSembrados.any({...})
	}
	method enPosicionHay(posicion) {
	  
	}
	method sembrar(semilla) {
	  self.validarSiHaySemillaAqui()
      
	  game.addVisual(semilla)
	  cultivosSembrados.add(semilla)
	}

	method validarSiHaySemillaAqui() {
	  const posicion = 
	  if(self.position())
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
} 