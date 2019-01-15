Rails.application.routes.draw do
  #general
  root to: 'general#index'
  get '/login', to: 'general#login'
  get '/register', to: 'general#register'
  get '/main', to: 'general#main'
  get '/filtro', to: 'general#filtro'
  get '/perfil', to: 'general#perfil'
  get '/mapa', to: 'general#mapa'
  get '/calendario', to: 'general#calendario'
  get '/fecha_evento', to: 'general#fecha_evento'
  get '/eventos', to: 'general#eventos'
  get '/evento', to: 'general#evento'
  get '/favorito', to: 'general#favorito'
  get '/comentario', to: 'general#comentario'
  get '/borrarusuario', to: 'general#borrarusuario'
  get '/buscarusuario', to: 'general#buscarusuario'

  #perfiles
  get '/normal/perfil', to: 'normal#perfil'
  get '/administrador/perfil', to: 'administrador#perfil'
  get '/institucion/perfil', to: 'institucion#perfil'
  get '/organizacion/perfil', to: 'organizacion#perfil'

  #normal
  get '/normal/updnombre', to: 'normal#updnombre'
  get '/normal/updpassword', to: 'normal#updpassword' 
  get '/normal/delete', to: 'normal#delete' 

  #institucion
  get '/institucion/comprobacion', to: 'institucion#comprobacion'
  get '/institucion/updnombre', to: 'institucion#updnombre'
  get '/institucion/updpassword', to: 'institucion#updpassword' 
  get '/institucion/delete', to: 'institucion#delete' 

  #organizacion
  get '/organizacion/evento', to: 'organizacion#evento'
  get '/organizacion/updnombre', to: 'organizacion#updnombre'
  get '/organizacion/updpassword', to: 'organizacion#updpassword' 
  get '/organizacion/delete', to: 'organizacion#delete' 
  get '/organizacion/deleteev', to: 'organizacion#deleteev' 

  #administrador
  get '/administrador/usuario', to: 'administrador#usuario'
  get '/administrador/usuarios', to: 'administrador#usuarios'
  get '/administrador/comprobacion', to: 'administrador#comprobacion'
  get '/administrador/updnombre', to: 'administrador#updnombre'
  get '/administrador/updpassword', to: 'administrador#updpassword' 
  get '/administrador/delete', to: 'administrador#delete' 
  get '/administrador/deleteev', to: 'administrador#deleteev'     

  get '/normal', to: 'normal#index'
  get '/normal/new', to: 'normal#new'
  post '/normal', to: 'normal#create'

end
