import personaje.*
import cultivos.*


class Aspersor {
    var property position
    method image() {
      return "aspersor.png"
    }  

    method regarAreaLimitrofe() {
        personaje.cultivosSembrados()

        self.vereificarSiHayAlgunCultivoLimitrofe()
        
        self.regarDeFormaOrtogonal()
        self.regarEnDiagonal()

    }
    method vereificarSiHayAlgunCultivoLimitrofe() {
      if(not personaje.cultivosSembrados().any({cultivo => 
                                                    (((self.position().x() + 1) == cultivo.position().x() && self.position().y() == cultivo.position().y()) // right Oeste
                                                ||  (self.position().x() - 1).max(0) == cultivo.position().x() && self.position().y() == cultivo.position().y()  // left Este
                                                ||   self.position().x() == cultivo.position().x() && (self.position().y() - 1).max(0) == cultivo.position().y() // down Sur
                                                ||   self.position().x() == cultivo.position().x() && (self.position().y() + 1) == cultivo.position().y() //up Norte
                                                    )
                                            })){
        self.error("No Hay ninguna planta para regar en el area limitrofe a 1")
    }

    }
    method regarDeFormaOrtogonal() {
      //right, left, up y down

      const listaDeCultivosLimitrofes = personaje.cultivosSembrados().filter({cultivo => 
                                                    ((self.position().x() + 1) == cultivo.position().x() && self.position().y() == cultivo.position().y()) // right Oeste
                                                ||  (self.position().x() - 1).max(0) == cultivo.position().x() && self.position().y() == cultivo.position().y()  // left Este
                                                ||   self.position().x() == cultivo.position().x() && (self.position().y() - 1).max(0) == cultivo.position().y() // down Sur
                                                ||   self.position().x() == cultivo.position().x() && (self.position().y() + 1) == cultivo.position().y()})// //cultivo => self.distance(cultivo.position()) == 1 
                                                                            //var positionX = //cultivo.position().x() - self.position().x()
                                                                            //var positionY= cultivo.position().y() - self.position().y() | con esto ya obtuve los cultivos lidantes
      
    listaDeCultivosLimitrofes.forEach({cultivo => self.regar(cultivo)})
/*
//como ya verificamos que en las areas lindantes 
hay al menos un cultivo podemos restar las posiciones para saber si esta al lado
Ej => dadas (a,b) (x,y) => a - x = 1 (3-2) 
*/
                                                                            
      console.println(listaDeCultivosLimitrofes)
    }
    method regar(unCultivo) {
      unCultivo.regar()
    }
    method regarEnDiagonal() {
      console.println("llaom")
    }
    /*
        METODOLOGIA:
    Teniendo la posicion del aspersor, recorrer sus areas limitrofes
    ejemplo
        dada la posicion actual del aspersor ve si se "puede mover" hacia una direccion (right
        left, up, down) si se puede mover => va hacia ese lado y pregunta si hay una planta
        si hay => riega sino no hace nada
        | o tambien
        puedo hagarrar la lista de cultivos sembrados y preguntar si hay alguno que se encuentre en +1 
        en alguna de las direcciones (right, left, up, down)
        si es si => va a regar a aquellas que limitan en 1 con el aspersor ya se en diagonal u ortogonal
        sino no hacemos nada
    */

}
