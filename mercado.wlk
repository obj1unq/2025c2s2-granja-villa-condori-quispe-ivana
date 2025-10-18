import aspersores.*
import cultivos.*
import wollok.game.*
import personaje.*

class Mercado {

    var property position 
    method image() {
    return "market.png"
    } 
    var property cantidadDeMonedas
    const mercaderiaParaVender = []
}

//para gestionar los mercados y el personaje no deba hacerlo
object sistemaDeMercados {
  
}