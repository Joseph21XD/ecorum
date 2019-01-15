
json.comentarios @comentarios do |comentario|
  json.detalle comentario.detalle
  json.usuario comentario.usuario.nombre
  json.image comentario.usuario.image
end
