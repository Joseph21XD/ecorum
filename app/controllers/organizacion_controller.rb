class OrganizacionController < ApplicationController
	def perfil
	end
	def evento
		@tipo = TipoUsuario.find(session[:user_type])
		@usuarios = Usuario.all
	end
end
