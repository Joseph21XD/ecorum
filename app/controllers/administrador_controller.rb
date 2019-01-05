class AdministradorController < ApplicationController
	def perfil
	end
	def usuario
		#no tiene html ya que es una respuesta json a javascript mediante ajax a jquery
	end
	def usuarios
		@tipo = TipoUsuario.find(session[:user_type])
		@usuarios = Usuario.all.order("nombre ASC")
	end
	def comprobacion
	end
end

