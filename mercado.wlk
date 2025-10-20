import aspersores.*
import cultivos.*
import wollok.game.*
import personaje.*

class Mercado {

    var property position 
    method image() {
    return "market.png"
    } 
    var property saldo
    const property mercaderiaParaVender = []
}

//para gestionar los mercados y que el personaje no deba hacerlo
object sistemaDeMercados {
    const property mercadosFundados = []


  method fundarMercados() {
    3.times({ i => mercadosFundados.add(new Mercado(position = game.at((0 .. 9).anyOne(), (0 .. 9).anyOne()), saldo = (0 .. 900).anyOne()))
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
                              mercado.saldo() + " monedas.")
                              })

   /* 3.times({i => if(not mercadosFundados.isEmpty()){
                    const nuevoMercado = mercadosFundados.first()

                    mercadosFundados.remove(nuevoMercado)

                    game.addVisual(nuevoMercado)

                    mercadosFundados.add(nuevoMercado) //asi no perdemos su ubicacion, sino hay que hacerla mas facil y hacerlo manual
                  } 
    })*/
  }
  //metodo para comprobar si los mercados recuerdan lo que deben
  method losMercadosAnuncianQueVenden() {
    mercadosFundados.forEach({mercado => game.say(mercado,"Ahora vendemos: " + mercado.mercaderiaParaVender() + "Saldo" + mercado.saldo())
                             })
  }




}
/*console.println(mercadosFundados)
            console.println(mercadosFundados.first().position())
            console.println(mercadosFundados.first().cantidadDeMonedas())*/