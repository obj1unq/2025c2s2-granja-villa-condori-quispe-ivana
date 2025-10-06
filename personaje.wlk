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
	method sembrar() {
	  self.validarSiHaySemillaAqui()

	game	
	  
	  
	}

	method validarSiHaySemillaAqui() {
	  
	}

}
object configurarElMundo {
  method mDeSembrarMaiz(){
	keyboard.m().onPressDo({personaje.sembrar()})
  }
  method tDeSembrarTrigo() {
	keyboard.t().onPressDo({personaje.sembrar()})
  }
  method oDeSembrarTomaco() {
	keyboard.o().onPressDo({personaje.sembrar()})
  }
} 