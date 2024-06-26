require "./Materia"

class Alumno
	@nombre : String
	@carreraActual : String

	def initialize(@nombre, @materias : Hash(String, Array(Materia)), carreraActual : String)
		@carreraActual = carreraActual
	end

	def obtenerNombre() : String
		return @nombre
	end

	def obtenerCarreraActual() : String
		return @carreraActual
	end

	def obtenerCarreras() : Array(String)
		return @materias.keys		
	end

	def obtenerMaterias() : Array(Materia)
		return @materias[@carreraActual]
	end

	def modificarCarreraActual(carreraActual : String)
		@carreraActual = carreraActual
	end

	def historiaAcademica() : Array(Materia)
		return @materias[@carreraActual].select(&.materiaCursada())
	end

	def misInscripciones() : Array(Materia)
		return @materias[@carreraActual].select(&.obtenerInscripcion())
	end

	def inscripcion(opcion) : Bool
		listaMaterias = obtenerMaterias()
		return listaMaterias[opcion].inscripcion()
	end

	def anularInscripcion(opcion : Int32) : Bool
		listaMaterias : Array(Materia) = misInscripciones()
		return listaMaterias[opcion].anularInscripcion()
	end

	def rendirMateria(opcion, nota)
		listaMaterias = misInscripciones()
		listaMaterias[opcion].rendir(nota)
	end

	def agregarCarrera(carreras) : Bool
		listaCarreras = obtenerCarreras()
		
		listaCarreras.each do |i|
			if i == carreras.keys[0]
				return false
			end
		end

		@materias.merge!(carreras)
		return true 
	end
end
