Rails.application.routes.draw do
  #general
  root to: 'general#index'
  post '/', to: 'general#indexpost'
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
  get '/modificar', to: 'general#modificar'
  patch '/changeimage', to: 'general#changeimage'

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
  get '/institucion/evidencia', to: 'institucion#evidencia'
  post '/institucion/comprobacion', to: 'institucion#addevidence'
  post '/institucion/evidencia', to: 'institucion#newevidence'

  #organizacion
  get '/organizacion/evento', to: 'organizacion#evento'
  post '/organizacion/evento', to: 'organizacion#eventoPost'
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
  get '/administrador/aceptar', to: 'administrador#aceptar'
  get '/administrador/rechazar', to: 'administrador#rechazar'


end
