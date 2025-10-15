import cultivos.*
import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivosSembrados = []
	const cultivosCosechados = []
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
	  console.println(cultivosSembrados)
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

	method cosechar() { // arreglar cosas que no funcionan
	  // solo las plantas adultas sino exepcion
	  self.validarSiSemillaEsAdulta()
	  
	  const cultivo = cultivosSembrados.find({cultivo => cultivo.position() == position})
	  
	  cultivosCosechados.add(cultivo)
	  cultivosSembrados.remove(cultivo)
	  game.removeVisual(cultivo)
      

	  // preimero buscamos al cultivo = find obtener el cultivo de la position
	  //any = 
	  //console.println(cultivo)
	  //ver en la consola
	  console.println(cultivosCosechados)
	  console.println(cultivosSembrados)
	}

	method validarSiSemillaEsAdulta() {
	  if(not self.semillaEsAdultaEn(position)){
			self.error("No tengo para cosechar!")
			//game.say(visual, message)
			//preguntar el porque estos self error se pueden ver en el game sin ser SAy
	  }
	}
	method semillaEsAdultaEn(posicion) {
	  const cultivo = cultivosSembrados.find({cultivo => cultivo.position() == position}) //con last me traigo el cultivo
	  return cultivo.esAdulto()
	  console.println(cultivo)
	}//copyWithout(elementToRemove)
	method vender() {
	  const gananciaTotal = cultivosCosechados.sum({cultivo => cultivo.precio()})
      const cantidadDeCultivos = cultivosCosechados.size()
	  keyboard.backspace().onPressDo({self.verCuantoHayParaVender(gananciaTotal, cantidadDeCultivos)})

	  //ver 
	  console.println(gananciaTotal)
	}
	method verCuantoHayParaVender(ganancia, cantCultivos) {
	  
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
  method vDeVender() {
	keyboard.v().onPressDo({personaje.vender()})
  }
} 