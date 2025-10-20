import aspersores.*
import cultivos.*
import wollok.game.*
import mercado.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property cultivosSembrados = []
	const property cultivosCosechados = []
	const aspersoresColocados = []
	var gananciaTotal = 0
	
	//var cantidadDeCultivosAVender = 0 no deberia ser una variable sino un metodo

	//se puede mejorar simplemente llamando a la lista de sembrados y pregunar si hay una semilla con esa posicion => recordar plantearlo
	method haySemillaEn(posicion) {
	  return game.getObjectsIn(posicion).size() == 2  
	  // game.hasVisual(posicion) Booleasno
	}

	/*method enPosicionHay(posicion) {
	  return game.getObjectsIn(posicion)
	}*/
	
//SEMBRAR SEMILLA

	method sembrar(semilla) {

	  self.validarSiHaySemillaAqui()
      
	  game.addVisual(semilla)
	  cultivosSembrados.add(semilla)

	  //console.println(position) // despues borrar
	  //console.println(cultivosSembrados)
	}

	method validarSiHaySemillaAqui() {
	  if(self.haySemillaEn(self.position())){
		self.error("Ya hay Semilla")
	  }
	}

//REGAR SEMILLA

	method regarA() {
	  const cultivo = cultivosSembrados.find({cultivo => cultivo.position() == position}) // en mis cultivos busco aquel que esta en la misma posicion que el granjero 
	  

	  cultivo.regar()

	}

//COSECHAR PLANTA

	method cosechar() { 
	  // solo las plantas adultas sino exepcion
	  self.validarSiSemillaEsAdulta()
	  
	  const cultivo = cultivosSembrados.find({cultivo => cultivo.position() == position})
	  
	  cultivosCosechados.add(cultivo)
	  cultivosSembrados.remove(cultivo)
	  game.removeVisual(cultivo)
      

	  // primero buscamos al cultivo = find obtener el cultivo de la position

	  //console.println(cultivosCosechados)

	}

	method validarSiSemillaEsAdulta() {
	  if(not self.semillaEsAdultaEn(position)){
			self.error("No tengo para cosechar!")
			//game.say(self, "No tengo para cosechar!")
			//preguntar el porque estos self error se pueden ver en el game sin ser SAy
	  }
	}
	method semillaEsAdultaEn(posicion) {
	  const cultivo = cultivosSembrados.find({cultivo => cultivo.position() == position}) 
	  return cultivo.esAdulto()

	}//copyWithout(elementToRemove)

// VENTA DE PLANTAS

	method vender() {

	//VENTA EN MERCADOS

	  self.validarQueEstaEnUnMercado()
	  
	  if(cultivosCosechados.isEmpty()){
		game.say(self, "No tengo nada para vender!")
		
	  } else {
			const cantidadDeCultivosVendidos = cultivosCosechados.size()
			const gananciaDeVentaActual = cultivosCosechados.sum({cultivo => cultivo.precio()})
			
			//ENCONTRAR EL MERCADO
			const mercadoActual = sistemaDeMercados.mercadosFundados().find({mercado => self.position() == mercado.position()})
			
			if(mercadoActual.saldo() >= gananciaDeVentaActual){
				
				gananciaTotal += gananciaDeVentaActual

				mercadoActual.mercaderiaParaVender().addAll(cultivosCosechados)
				mercadoActual.saldo(mercadoActual.saldo() - gananciaDeVentaActual)
				
				cultivosCosechados.clear()
				game.say(self, "Vendi " + gananciaDeVentaActual + " de " + cantidadDeCultivosVendidos + " cultivos!")
			    
				
			}
			
	    }//"Gane " + gananciaTotal 
	}
	method gananciaTotal() = gananciaTotal //getter solo para el test, tuve que agregarlo a ultimo momento por el test ya que no lo necesitaba en mi codigo original, preguntar si es buena practica 
	method validarQueEstaEnUnMercado() {

		if(not self.hayMercadoAqui()){

			self.error("No fuiste al Mercado! MAL!")
		}
	//const mercados = sistemaDeMercados.mercadosFundados().find({mercado => mercado.position() == position})
	// obtuve le mercado 

	}
	method hayMercadoAqui() {
	  return sistemaDeMercados.mercadosFundados().any({mercado => self.position() == mercado.position()})
	}
	method cantidadDeCultivosAVender() {
	  return cultivosCosechados.size() // antes lo tenia como cultivosSembrados.size() pq 
	}
	method verCuantoHayParaVender() {
		
	  game.say(self, "Gane " + gananciaTotal + " pesos en total y tengo" + self.cantidadDeCultivosAVender() + " cultivos para vender!" )

	}   

    //	COLOCAR LOS ASPERSORES
	method colocarAspersor(aspersor) {
	  self.validarSiHayAlgoAqui()

	  game.addVisual(aspersor)

	  aspersoresColocados.add(aspersor)
	  //console.println(aspersoresColocados)
	}
//console.println("entro al else validacion")
    method validarSiHayAlgoAqui() {
		//const cosas = cultivosSembrados ++ aspersoresColocados
		//const position
	  if(self.hayAlgoAqui(position)){
		  self.error("YA HAY ALGO AQUI!")
          //game.say(self, "YA HAY ALGO AQUI!")
	  }

	}
	method hayAlgoAqui(posicion) {
	  return game.getObjectsIn(posicion).size() == 2
	}

	//ARMAR EL METODO PARA QUE LOS ASPERSORES RIEGUEN
	method regarAspersores() {
	  aspersoresColocados.forEach({aspersor => aspersor.regarAreaLimitrofe()}) 
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
	method spacioParaDescribirGananciaYCantidadDeCultivos() {
		keyboard.space().onPressDo({personaje.verCuantoHayParaVender()})
	}
	method aDeColocarAspersores() {
		keyboard.a().onPressDo({personaje.colocarAspersor(new Aspersor(position = personaje.position()))})
	}
} 
/*
method hayAlgoAqui(posicion) {
    const objetos = game.getObjectsIn(posicion)
    return objetos.any({ o => o != self }) // hay algo distinto al personaje
}
*/