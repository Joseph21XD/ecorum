class GeneralController < ApplicationController
	
	def index
		puts "hola"
	end

	def login
		correo = params[:name]
		pass = params[:pass]
		if Usuario.exists?(correo: correo, contrasenna: pass)
			@user= Usuario.find_by(correo: correo, contrasenna: pass)
			session[:user_id]= @user.id
			session[:user_type]= @user.tipo_usuario_id
			@result = "true"
		else
			@result = "false"
		end
	end

	def register
		nombre = params[:name]
		correo = params[:email]
		pass = params[:pass]
		if Usuario.exists?(correo: correo)
			@result = "false"
			puts "FALSE"
		else
			puts "ENTRA"
			tipo = TipoUsuario.find_by(nombre: "normal");
			puts tipo.nombre
			@user = Usuario.create(nombre: nombre, correo: correo, contrasenna: pass, imagen: "", tipo_usuario_id: tipo.id, puntaje: 0)
			session[:user_id]= @user.id
			session[:user_type]= tipo.id
			puts "TRUE"
			@result = "true"
		end
	end

	def main
		@tipo = TipoUsuario.find(session[:user_type])
		@user = Usuario.find(session[:user_id])
		@eventos = Evento.all.includes(:usuario, :favoritos)
		@provincias = Provincium.all
		@categorias = TipoEvento.all
	end

	def filtro
		@tipo = TipoUsuario.find(session[:user_type])
		@user = Usuario.find(session[:user_id])
		@provincias = Provincium.all
		@categorias = TipoEvento.all
		
		case params[:tipo]
		when "provincia"
			@eventos = Evento.where(provincium_id: params[:id]).includes(:usuario, :favoritos)
		when "fecha"
			@eventos = Evento.all.includes(:usuario, :favoritos).order("fechaHora ASC")
		when "categoria"
			@eventos = Evento.where(tipo_evento_id: params[:id]).includes(:usuario, :favoritos)
		when "puntaje"
			@eventos = Evento.all.includes(:usuario, :favoritos).order("Puntaje DESC")
		else 
			@eventos = Evento.all.includes(:usuario, :favoritos)
		end

		render "main"
	end

	def perfil
		@tipo = TipoUsuario.find(session[:user_type])
		redirect_to :controller => @tipo.nombre , :action => 'perfil'
	end

	def mapa
	end

	def calendario
	end

end


