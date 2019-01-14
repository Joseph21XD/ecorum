
json.comentarios @comentarios do |comentario|
  json.detalle comentario.detalle
  json.usuario comentario.usuario.nombre
  json.imagen comentario.usuario.imagen
end
