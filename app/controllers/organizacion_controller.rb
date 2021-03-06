class OrganizacionController < ApplicationController
	def perfil
		@user = Usuario.find(session[:user_id])
		@tipo = TipoUsuario.find(session[:user_type])
		@eventos = Evento.where(usuario_id: session[:user_id]).includes(:usuario, :favoritos)
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
		if Usuario.exists?(id: session[:user_id], contrasenna: pass)
			Evento.destroy(id)
			@result = "true"
			redirect_to :controller => 'general', :action => 'index'
		else
			@result = "false"
		end
	end
	def evento
		@tipo = TipoUsuario.find(session[:user_type])
		@usuarios = Usuario.all
		@categorias = TipoEvento.all
		@provincias = Provincium.all
		@evento = Evento.new
	end
	def updevento
		id = params[:id]
		session[:event_id] = id
		@evento = Evento.find(id)
		@tipo = TipoUsuario.find(session[:user_type])
		@categorias = TipoEvento.all
		@provincias = Provincium.all
	end
	def updeventoPost
		nombre = params[:fname]
		descrip = params[:fdesc]
		tipo = params[:ftipo]
		fecha = params[:ffecha]
		puntajes = params[:fpunt]
		ubicacion = params[:fubi]
		provincia = params[:fprov]
		latitud = params[:lat]
		longitud = params[:lng]
		if params[:evento].present?
			image = params[:evento][:image]
			Evento.update(session[:event_id], :nombre => nombre, :fechaHora => fecha, :ubicacion => ubicacion, :usuario_id => session[:user_id],
			 :descripcion => descrip, :latitud => latitud, :longuitud => longitud, :imagen => "", :puntaje => puntajes, :tipo_evento_id => tipo, 
			 :provincium_id => provincia, :image => image)
		else
			Evento.update(session[:event_id], :nombre => nombre, :fechaHora => fecha, :ubicacion => ubicacion, :usuario_id => session[:user_id],
			 :descripcion => descrip, :latitud => latitud, :longuitud => longitud, :imagen => "", :puntaje => puntajes, :tipo_evento_id => tipo, 
			 :provincium_id => provincia, :image => "")
		end
		
		redirect_to :controller => 'general', :action => 'main'
	end
	def eventoPost
		nombre = params[:fname]
		descrip = params[:fdesc]
		tipo = params[:ftipo]
		fecha = params[:ffecha]
		puntajes = params[:fpunt]
		ubicacion = params[:fubi]
		provincia = params[:fprov]
		latitud = params[:lat]
		longitud = params[:lng]
		image = params[:evento][:image]
		@evento = Evento.create(nombre: nombre, fechaHora: fecha, ubicacion: ubicacion, usuario_id: session[:user_id],
			 descripcion: descrip, latitud: latitud,longuitud: longitud,imagen: "",puntaje: puntajes,tipo_evento_id: tipo, provincium_id: provincia, image: image)
		redirect_to :controller => 'general', :action => 'main'

	end

end
