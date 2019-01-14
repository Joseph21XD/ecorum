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

  #institucion
  get '/institucion/comprobacion', to: 'institucion#comprobacion'

  #organizacion
  get '/organizacion/evento', to: 'organizacion#evento'

  #administrador
  get '/administrador/usuario', to: 'administrador#usuario'
  get '/administrador/usuarios', to: 'administrador#usuarios'
  get '/administrador/comprobacion', to: 'administrador#comprobacion'

  get '/normal', to: 'normal#index'
  get '/normal/new', to: 'normal#new'
  post '/normal', to: 'normal#create'

end
