		var idEventoDel;

		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		window.onload = function () {
			document.getElementById("newpass").onchange = validatePassword2;
			document.getElementById("newpass2").onchange = validatePassword2;
		}

		function anular(){
			document.updform.newname.disabled = !document.updform.newname.disabled
			document.updform.oldpass.disabled = !document.updform.oldpass.disabled
			document.updform.newpass.disabled = !document.updform.newpass.disabled
			document.updform.newpass2.disabled = !document.updform.newpass2.disabled

		} 

		$(document).ready(function(){
		    $("#optradion").on( "click", function() {	 
		        $('#pass-panel').hide();
		        $('#name-panel').show();
		         });
	    });

	    $(document).ready(function(){
		    $("#optradiop").on( "click", function() {	 
		        $('#pass-panel').show();
		        $('#name-panel').hide();
		         });
	    });


		function validarUpdate(){
			if(document.getElementById("newname").disabled == false){
				var name = document.getElementById("newname").value;
				var parameters = { 'name': name};
				var datos;
	     		$.ajax({
	  				url: 'updnombre.json',
	  				dataType: 'json',
	  				async: false,
	  				data: parameters,
	  				success: function(data) {
		    			if(data.result=="true"){
							datos= true;
						}
						else{
							datos= false;
							$("#myplog").html("Error en la modificación");
						}
	  				}
				});

				return datos;
			}else{
				var oldpass = document.getElementById("oldpass").value;
				var newpass = document.getElementById("newpass").value;
				var newpass2 = document.getElementById("newpass2").value;
				var parameters = { 'oldpass': oldpass, 'newpass': newpass, 'newpass2': newpass2 };
				var datos;
	     		$.ajax({
	  				url: 'updpassword.json',
	  				dataType: 'json',
	  				async: false,
	  				data: parameters,
	  				success: function(data) {
		    			if(data.result=="true"){
							datos= true;
						}
						else{
							datos= false;
							$("#myplog").html("Error en la modificación\nActual contraseña incorrecta!");
						}
	  				}
				});

				return datos;
			}
			
		}

		function validarDelete(){
			var pass = document.getElementById("delpass").value;
			var parameters = { 'pass': pass };
			var datos;
     		$.ajax({
  				url: 'delete.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
    			if(data.result=="true"){
					datos= true;
				}
				else{
					datos= false;
					$("#myplog2").html("Error al eliminar cuenta\nContraseña incorrecta!");
				}
  				}
			});

			return datos;
		}

		function getId(elem){
			idEventoDel = elem.id;
		}

		function validarDeleteEv(){
			var pass = document.getElementById("delpassev").value;
			var parameters = { 'pass': pass , 'evento': idEventoDel };
			var datos;
     		$.ajax({
  				url: 'deleteev.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
    			if(data.result=="true"){
					datos= true;
				}
				else{
					datos= false;
					$("#myplog3").html("Error al eliminar el evento\nContraseña incorrecta!");
				}
  				}
			});

			return datos;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}

		function validatePassword2() {
			var pass2 = document.getElementById("newpass").value;
			var pass1 = document.getElementById("newpass2").value;
			if (pass1 != pass2)
				document.getElementById("newpass2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("newpass2").setCustomValidity('');
			//empty string means no validation error
		}

		function validarLogin(){
			var name = document.getElementById("logname").value;
			var pass = document.getElementById("logpass").value;
			var parameters = { 'name': name, 'pass': pass};
			var datos;
     		$.ajax({
  				url: 'login.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
    			if(data.result=="true"){
					datos= true;
				}
				else{
					datos= false;
					$("#myplog").html("Error de autenticación");
				}
  				}
			});

			return datos;
		}

		function registrar(){
			var name = document.getElementById("namereg").value;
			var email = document.getElementById("emailreg").value;
			var pass = document.getElementById("password1").value;
			var parameters = { 'name': name, 'pass': pass, 'email': email};
			var datos;
     		$.ajax({
  				url: 'register.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
    			if(data.result=="true"){
					datos= true;
				}
				else{
					datos= false;
					$("#mypreg").html("Error, correo existente");
				}
  				}
			});

			return datos;
		}

		function favorito(id){
			var x = document.getElementById("star-"+id);
			var y = document.getElementById("fav-"+id);
			var tipo="";
			if(x.className == "far fa-star"){
				x.className= "fas fa-star";
				tipo= "add";
			}
			else{
				x.className= "far fa-star";
				tipo= "remove";
			}
			var parameters = {'id': id, 'tipo': tipo};
			$.ajax({
  				url: 'favorito.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
  					y.innerHTML= data.result
  				}
			});

		}

		function comentar(id){
			var x = document.getElementById("Message");
			var comments = document.getElementById("listacomentarios");
			var parameters = {'id': id, 'comentario': x.value};
			var datos;
			$.ajax({
  				url: 'comentario.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
  					datos = data;
  				}
			});
			var count = $("#listacomentarios").children().length;
			for (var i = count; i<datos.comentarios.length; i++) {
				comments.innerHTML+="<div class=\"what-top1\"><div class=\"what-left\"><img style=\"width: 75px; border-radius: 50%;\" src=\"assets/logo.png\"></div><div class=\"what-right\"><h4>"+datos.comentarios[i].usuario+"</h4><p>"+datos.comentarios[i].detalle+"</p></div><div class=\"clearfix\"></div></div>";
			}
		}

		function borrarUsuario(id){
			var nodo= document.getElementById("user-"+id).parentNode.parentNode;
			var lista= document.getElementById("listausuarios");
			lista.removeChild(nodo);
			var parameters = { "id": id};
			$.ajax({
  				url: '/borrarusuario.json',
  				dataType: 'json',
  				async: true,
  				data: parameters,
  				success: function(data) {
  				}
			});
		}

		function buscar(){
			var texto = document.getElementById("buscador").value;
			var parameters = { "texto": texto};
			var datos;
			$.ajax({
  				url: '/buscarusuario.json',
  				dataType: 'json',
  				async: false,
  				data: parameters,
  				success: function(data) {
  					datos = data;
  				}
			});
			var node= document.getElementById("listausuarios");
			while (node.hasChildNodes()) {
    			node.removeChild(node.lastChild);
			}
			for (var i = 0; i< datos.usuarios.length; i++) {
				node.innerHTML+="<div class='what-top1'><div style='width: 10%;' class='what-left'><img style='width: 75px; border-radius: 50%;' src='/assets/logo.png'>"+
		"</div><div style='width: 40%;' class='what-right'><a id='user-"+datos.usuarios[i].id+"' onclick='borrarUsuario("+datos.usuarios[i].id+")'>"+
		"<i style='background-color: #ff4f81' class='fas fa-trash-alt' aria-hidden='true'></i></a></div><div style='width: 50%;' class='what-right'>"+
		"<h4>"+datos.usuarios[i].nombre+"</h4><p>"+datos.usuarios[i].correo+"</p></div><div class='clearfix'></div></div>";
			}	
		}