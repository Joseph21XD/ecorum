class AdministradorController < ApplicationController
	def perfil
		@user = Usuario.find(session[:user_id])
		@tipo = TipoUsuario.find(session[:user_type])
		@eventos = Evento.all.includes(:usuario, :favoritos)
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
	def deleteev
		pass = params[:pass]
		id = params[:evento]
		puts id
		if Usuario.exists?(id: session[:user_id], contrasenna: pass)
			Evento.destroy(id)
			@result = "true"
			redirect_to :controller => 'general', :action => 'index'
		else
			@result = "false"
		end
	end
	def usuario
		#no tiene html ya que es una respuesta json a javascript mediante ajax a jquery
	end
	def usuarios
		@tipo = TipoUsuario.find(session[:user_type])
		@usuarios = Usuario.where.not(id: session[:user_id]).order("nombre ASC")
	end
	def comprobacion
			@tipo = TipoUsuario.find(session[:user_type])
			@eventos_past = Evento.where("fechaHora <= now()")
			@evento = params[:id]
			if(@evento == nil || @evento == '')
				@evento = "0"
			else
				@eventoX = Evento.find(@evento)
			end
			@comprobaciones = Comprobacion.where("evento_id = " + @evento + " AND comentarioAdmin = '' ")
	end
	def aceptar

		comprobacion = params[:comp]
		usuario = params[:user]
		evento = params[:even]
		@eventos = Evento.find(evento)
		Usuario.connection.execute("Update usuarios SET puntaje= puntaje + " + @eventos.puntaje.to_s + " WHERE id=" + usuario)
		Comprobacion.connection.execute("Update comprobacions SET comentarioAdmin= 'Ok' WHERE id=" + comprobacion )
		redirect_to :controller => 'administrador', :action => 'comprobacion'
	end

	def rechazar
		comprobacion = params[:comp]
		Comprobacion.connection.execute("Update comprobacions SET comentarioAdmin= 'No' WHERE id=" + comprobacion )
		redirect_to :controller => 'administrador', :action => 'comprobacion'
	end
end
