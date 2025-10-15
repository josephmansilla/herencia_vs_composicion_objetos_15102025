
class Hechicero {
    var property energiaActual = self.energiaMaxima()
    var property rango
    var criterio

    method energiaMaxima() {
        return rango.energiaMaxima()
    }

    method curar(cantidadEnergia) {
        energiaActual = (cantidadEnergia + energiaActual).max(self.energiaMaxima())
    }

    method puedeUsarHechizo(hechizo) {
        rango.puedeUsarHechizo(hechizo, self)
    }
    method lanzarHechizo(hechizo) {
        // pasan cosas
        rango.lanzoHechizo(hechizo, self)
    }
    method permiteCambiarDeRango(hechicero) {
        
    }

}

class Rango { 
    method energiaMaxima()
    method puedeUsarHechizo(hechizo, hechicero) = hechicero.energiaActual() >= hechizo.energiaRequerida()
    method lanzoHechizo(hechizo, hechicero)
}

class Aprendiz inherits Rango{
    const property tutor

    override method energiaMaxima() {
        return 50
    }
    override method puedeUsarHechizo(hechizo, hechicero) =
        hechizo.energiaRequerida() < 40 && hechicero.energiaActual() >= hechizo.energiaRequerida()


    override method lanzoHechizo(hechizo, hechicero) {
        if(tutor.permiteCambiarDeRango(self)) {
            hechicero.rango(new Archimago(nivel = 1))
        }
    }
}
class Archimago inherits Rango {
    var property nivel
    override method energiaMaxima() {
        return 100 + 2 * nivel 
    }
    override method puedeUsarHechizo(hechizo, hechicero) =
        !hechizo.esProhibido() && super(hechizo, hechicero)

    override method lanzoHechizo(hechizo, hechicero) {
        if(hechizo.energiaRequerida() > hechicero.energiaMaxima() * 0.5) {
            if(nivel == 20) {
                hechicero.rango(supremo)
            }
        }
    }
}

object supremo inherits Rango {
    override method energiaMaxima() = 500
    override method puedeUsarHechizo(hechizo, hechicero) = true
    override method lanzoHechizo(hechizo, hechicero) {}
}

class Hechizo {
    method energiaRequerida() {
        return 10
    }
    method esProhibido() {
        return false
    }
}