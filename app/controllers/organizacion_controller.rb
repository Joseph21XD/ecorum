class OrganizacionController < ApplicationController
	def perfil
	end
	def evento
		@tipo = TipoUsuario.find(session[:user_type])
		@usuarios = Usuario.all
		@categorias = TipoEvento.all
		@provincias = Provincium.all
		nombre = params[:fname]
		descrip = params[:fdesc]
		tipo = params[:ftipo]
		fecha = params[:ffecha]
		puntajes = params[:fpunt]
		ubicacion = params[:fubi]
		provincia = params[:fprov]
		latitud = params[:lat]
		longitud = params[:lng]
		@evento = Evento.create(nombre: nombre, fechaHora: fecha, ubicacion: ubicacion, usuario_id: session[:user_id],
			 descripcion: descrip, latitud: latitud,longuitud: longitud,imagen: "",puntaje: puntajes,tipo_evento_id: tipo, provincium_id: provincia)

		end

end
