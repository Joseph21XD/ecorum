class InstitucionController < ApplicationController
	def perfil
		@user = Usuario.find(session[:user_id])
		@tipo = TipoUsuario.find(session[:user_type])
		@eventos = Comprobacion.where(usuario_id: session[:user_type])
	end
	def updnombre
		nombre = params[:name]
		Usuario.update(session[:user_id], :nombre => nombre)
		@result = "true"
	end
	def updpassword
		oldpass = params[:oldpass]
		newpass = params[:newpass]
		newpass2 = params[:newpass2]
		if Usuario.exists?(id: session[:user_id], contrasenna: oldpass)
			Usuario.update(session[:user_id], :contrasenna => newpass)
			puts "ENTRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
			@result = "true"
		else
			@result = "false"
			puts "NO ENTRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
		end
	end
	def delete
		pass = params[:pass]
		if Usuario.exists?(id: session[:user_id], contrasenna: pass)
			Usuario.destroy(session[:user_id])
			@result = "true"
			redirect_to :controller => 'general', :action => 'index'
		else
			@result = "false"
		end
	end



	def comprobacion
	end
end
