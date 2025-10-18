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

//para gestionar los mercados y que el personaje no deba hacerlo
object sistemaDeMercados {
    const mercadosFundados = []


  method fundarMercados() {
    3.times({ i => mercadosFundados.add(new Mercado(position = game.at((0 .. 9).anyOne(), (0 .. 9).anyOne()), cantidadDeMonedas = (0 .. 900).anyOne()))
            })
        //new Mercado(position == game.at(5,9, cantidadDeMonedas = 0.randomUpTo(4)))) })
  
  } //esto los crea

  //ahora hay que verlos
  method ubicarMercados() {
    //Version Mejorada
    mercadosFundados.forEach({mercado => 
                              game.addVisual(mercado)
                              //solo para ver
                              console.println("Mercado fundado en " + 
                              mercado.position() + " con " + 
                              mercado.cantidadDeMonedas() + " monedas.")
                              })

   /* 3.times({i => if(not mercadosFundados.isEmpty()){
                    const nuevoMercado = mercadosFundados.first()

                    mercadosFundados.remove(nuevoMercado)

                    game.addVisual(nuevoMercado)

                    mercadosFundados.add(nuevoMercado) //asi no perdemos su ubicacion, sino hay que hacerla mas facil y hacerlo manual
                  } 
    })*/
  }




}
/*console.println(mercadosFundados)
            console.println(mercadosFundados.first().position())
            console.println(mercadosFundados.first().cantidadDeMonedas())*/