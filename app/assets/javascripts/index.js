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