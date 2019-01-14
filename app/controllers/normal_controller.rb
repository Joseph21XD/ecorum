class NormalController < ApplicationController
	layout "application"

	def index
		@eventos = Evento.order('created_at')
	end

	def perfil
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
