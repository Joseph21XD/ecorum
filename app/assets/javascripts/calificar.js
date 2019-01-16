

function mostrarComp(id){
  window.location.href = "/administrador/comprobacion?id="+id;
}

function aceptar(comp, user, evento){
  window.location.href = "/administrador/aceptar?comp="+comp+"&user="+user+"&even="+evento;
}

function rechazar(comp, user){
  window.location.href = "/administrador/rechazar?comp="+comp+"&user="+user;
}
