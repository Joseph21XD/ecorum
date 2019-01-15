class GeneralController < ApplicationController

	def index
		puts "hola"
	end

	def login
		correo = params[:name]
		pass = params[:pass]
		if Usuario.exists?(correo: correo, contrasenna: pass)
			@user= Usuario.find_by(correo: correo, contrasenna: pass)
			puts "VALORES"
			puts @user.id
			puts @user.tipo_usuario_id
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

			tipo = TipoUsuario.find_by(nombre: params[:usertype]);
			@user = Usuario.create(nombre: nombre, correo: correo, contrasenna: pass, imagen: "", tipo_usuario_id: tipo.id, puntaje: 0)
			if params[:tipo] == "registroNormal"
				session[:user_id]= @user.id
				session[:user_type]= tipo.id
			end
			puts "TRUE"
			@result = "true"
		end
	end

	def main
		@tipo = TipoUsuario.find(session[:user_type])
		@user = Usuario.find(session[:user_id])
		@eventos = Evento.all.includes(:usuario, :favoritos)

		eventosfav = Favorito.where(usuario_id: @user.id)
		@favs=[]
		eventosfav.each do |fav|
			@favs.push(fav.evento_id)
		end

		@provincias = Provincium.all
		@categorias = TipoEvento.all
	end

	def indexpost
		redirect_to :controller => 'general' , :action => 'main'
	end

	def filtro
		@tipo = TipoUsuario.find(session[:user_type])
		@user = Usuario.find(session[:user_id])
		@provincias = Provincium.all
		@categorias = TipoEvento.all


		eventosfav = Favorito.where(usuario_id: @user.id)
		@favs=[]
		eventosfav.each do |fav|
			@favs.push(fav.evento_id)
		end

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
		@tipo = TipoUsuario.find(session[:user_type])
	end

	def calendario
		@tipo = TipoUsuario.find(session[:user_type])
	end

	def eventos
		@eventos = Evento.all
	end

	def evento
		@tipo = TipoUsuario.find(session[:user_type])
		@evento = Evento.where(id: params[:id]).includes(:usuario, :favoritos).take
		@comentarios = Comentario.where(evento_id: params[:id]).includes(:usuario)
		eventosfav = Favorito.where(usuario_id: session[:user_id] , evento_id: @evento.id)
		if eventosfav.length !=0
			@result = true
		else
			@result = false
		end
	end

	def ranking
		@tipo = TipoUsuario.find(session[:user_type])
		eltipo= TipoUsuario.find_by(nombre: "institucion")
		@usuarios = Usuario.where(tipo_usuario_id: eltipo.id).order("puntaje DESC")
	end

	def favorito
		if(params[:tipo] == "add")
			fav = Favorito.create(evento_id: params[:id], usuario_id: session[:user_id])
		else
			Favorito.find_by(evento_id: params[:id], usuario_id: session[:user_id]).destroy
		end
		@favoritos = Favorito.where(evento_id: params[:id])
	end

	def comentario
		comentario = Comentario.create(detalle: params[:comentario], evento_id: params[:id], usuario_id: session[:user_id])
		@comentarios = Comentario.where(evento_id: params[:id]).includes(:usuario)
	end

	def borrarusuario
		Usuario.find(params[:id]).destroy
	end

	def buscarusuario
		@search = params[:texto]+"%"
		@users = Usuario.where(["nombre LIKE ? AND id != ?", @search, session[:user_id]]).or(Usuario.where("correo LIKE ? AND id != ?", @search, session[:user_id]))
	end

	def fecha_evento
		@mes = params[:mes]
		@anno = params[:anno]
		@dias = Evento.where('extract(month from fechaHora) = ? AND extract(year  from fechaHora) = ?', @mes , @anno)
		var = @dias.as_json
		render :json => var
	end

	def changeimage

		@usuario = Usuario.find(session[:user_id])
  		@usuario.update_attribute(:image, params[:usuario][:image])
  		@tipo = TipoUsuario.find(session[:user_type])
		redirect_to :controller => @tipo.nombre , :action => 'perfil'

	end


end

