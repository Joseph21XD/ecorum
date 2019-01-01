		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
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