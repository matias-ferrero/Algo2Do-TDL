require "./controller/Controller"
#require "./modelo/Alumno"

class Main

	def self.main()
		controlador = Controller.new()
		while !controlador.salir()
			controlador.menuPrincipal()
		end
	end
end

Main.main