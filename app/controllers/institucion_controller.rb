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

	def evidencia
		@tipo = TipoUsuario.find(session[:user_type])
		@comprobacion = Comprobacion.where(id: session[:comprob]).includes(:evento, :evidencia).take
		@evidencia = Evidencium.new
	end

	def newevidence
		if params[:evidencium].present?
  			@evidencia = Evidencium.create(comprobacion_id: session[:comprob], image: params[:evidencium][:image])
  		end
		redirect_to :controller => 'institucion', :action => 'evidencia'
	end


	def comprobacion
		@tipo = TipoUsuario.find(session[:user_type])
		@eventos_past = Evento.where("fechaHora <= now()")
	end

	def addevidence
		@user = Usuario.find(session[:user_id])
		@tipo = TipoUsuario.find(session[:user_type])
		evento = params[:fevento]
		experiencia = params[:comment]
		@eventoX = Evento.find(evento)
		@comprobacion = Comprobacion.create(usuario_id: @user.id, evento_id: evento, comentario: experiencia, comentarioAdmin: "")
		session[:comprob] = @comprobacion.id
		redirect_to :controller => 'institucion', :action => 'evidencia'
	end
end
