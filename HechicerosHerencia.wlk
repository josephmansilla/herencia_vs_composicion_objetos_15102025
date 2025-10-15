class Hechicero {
    var property energiaActual
    
    method energiaMaxima() // firma del método

    method puedeUsarHechizo(hechizo) = self.energiaActual() >= hechizo.energiaRequerida()

    method curar(energia) {
        energiaActual = (energia + energiaActual).min(self.energiaMaxima())
    }
}

class Aprendiz inherits Hechicero {
    var property tutor // de tipo hechicero -> es imposible cambiar el rango
    override method energiaMaxima() = 50
    override method puedeUsarHechizo(hechizo) = 
        super(hechizo) && hechizo.energiaRequerida() < 40
}

class Archimago inherits Hechicero {
    var property nivel
    override method energiaMaxima() = 100 + nivel * 2
    override method puedeUsarHechizo(hechizo) =
        !hechizo.esProhibido() && super(hechizo)
}

class HechizoSupremo inherits Hechicero {
    override method energiaMaxima() = 500
    override method puedeUsarHechizo(hechizo) = true
}
class Hechizo {
    method energiaRequerida() {
        
    }
}