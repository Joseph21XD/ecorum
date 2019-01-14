class NormalController < ApplicationController
	layout "application"

	def index
		@eventos = Evento.order('created_at')
	end

	def perfil
		@user = Usuario.find(session[:user_id])
		@tipo = TipoUsuario.find(session[:user_type])
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

	def new
  		@evento = Evento.new
 	end

 	#Create action ensures that submitted photo gets created if it meets the requirements
 	def create
  		puts "PARAMETROS________________________"
  		puts evento_params
  		@evento = Evento.find(1)
  		@evento.update_attribute(:image, params[:evento][:image])
  		if @evento.save
   			redirect_to :index
  		else
   			render :new
  		end
 	end

	 private

	def evento_params
  		params.require(:evento).permit(:image)
	end


end
