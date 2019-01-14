
var fechaActual = new Date();
var mes = fechaActual.getMonth();
var anno = fechaActual.getFullYear();
var meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre', 'Diciembre'];
var pasadoActivo = 0;
var eventos;
var dias = {};

function createCalendar(){

  jQuery.ajaxSetup({async:false});
  $.get('/fecha_evento', {mes: (mes+1).toString(),anno:anno.toString()},
        function(returnedData){
             eventos = returnedData;
    });

  document.getElementById("mes_actual").innerHTML = meses[mes];
  document.getElementById("anno_actual").innerHTML = anno;
  var primer = new Date(anno, mes, 1, 0, 0, 0, 0);
  pasadoActivo = 0;
  var dia = primer.getDay()-1;
  if(dia==-1){dia=6}
  var diasUL = document.getElementById("daysList");
  var li;
  diasUL.innerHTML = "";
  for (i = 0; i < dia; i++) {
    li = document.createElement("li");
    li.appendChild(document.createTextNode(""));
    diasUL.appendChild(li);
  }
  var diaTemp = 1;
  dias = {};
  for(var i = 0; i < eventos.length; i++) {
      var obj = eventos[i];
      var dateE = createDate(obj.fechaHora);
      var diax = dateE.getDate();
      dias[diax] = "x";

  }
  if(primer.getDate().toString() in dias){
      putDay(diasUL, li,diaTemp, 2, primer);
  }else{
if(fechaActual.getDate() == primer.getDate() && fechaActual.getMonth() == primer.getMonth() && fechaActual.getYear() == primer.getYear()){
    putDay(diasUL, li,diaTemp, 1, primer);
  }
  else{
    putDay(diasUL, li,diaTemp, 0, primer);
  }}
  primer.setDate(primer.getDate() + 1);
  diaTemp++;
  while(primer.getDate() != 1){
    if(primer.getDate().toString() in dias){
        putDay(diasUL, li,diaTemp, 2, primer);
    }else{
    if(fechaActual.getDate() == primer.getDate() && fechaActual.getMonth() == primer.getMonth() && fechaActual.getYear() == primer.getYear()){
      putDay(diasUL, li,diaTemp, 1, primer);
    }
    else{
      putDay(diasUL, li,diaTemp, 0, primer);
    }}
    diaTemp++;
    primer.setDate(primer.getDate() + 1)
  }

}


function mesAnterior(){

  if(mes == 0){anno--;mes=11}
  else{mes--;}

  createCalendar();

}

function mesSiguiente(){

  if(mes == 11){anno++;mes=0}
  else{mes++;}

  createCalendar();

}

function verEventos(dia){
  var li = document.getElementById(dia);
  if(pasadoActivo != 0){
    var  past = document.getElementById(pasadoActivo.toString());
    past.innerHTML = "";
    if(pasadoActivo.toString() in dias){
      var span = document.createElement("span");
      span.setAttribute("class","event");
      span.appendChild(document.createTextNode(pasadoActivo.toString()));
      past.appendChild(span);
      past.setAttribute("onclick","verEventos("+ pasadoActivo.toString() + ")");
      past.setAttribute("id",pasadoActivo.toString());
    }else{
    if(fechaActual.getDate() == pasadoActivo && fechaActual.getMonth() == mes && fechaActual.getFullYear() == anno){

      var span = document.createElement("span");
      span.setAttribute("class","today");
      span.appendChild(document.createTextNode(pasadoActivo.toString()));
      past.appendChild(span);
      past.setAttribute("onclick","verEventos("+ pasadoActivo.toString() + ")");
      past.setAttribute("id",pasadoActivo.toString());
    }
    else{
      past.appendChild(document.createTextNode(pasadoActivo));
      past.setAttribute("onclick","verEventos("+ pasadoActivo.toString() + ")");
      past.setAttribute("id",pasadoActivo.toString());
    }

  }}
  li.innerHTML = "";
  var span = document.createElement("span");
  span.setAttribute("class","active");
  span.appendChild(document.createTextNode(dia.toString()));
  li.setAttribute("onclick","verEventos("+ dia.toString() + ")");
  li.appendChild(span);
  pasadoActivo = dia;

  var title = document.getElementById("tituloCalendar");
  title.innerHTML = "Eventos - " + dia.toString() + "/" + (mes+1).toString() + "/" + anno.toString();

  var li;
  var div;
  var h2
  var p;
  var a;
  var listEv = document.getElementById("listEventos");
  listEv.innerHTML = "";
  for(var i = 0; i < eventos.length; i++) {
    var obj = eventos[i];
    var dateE = createDate(obj.fechaHora);

    if(dateE.getFullYear() == anno && dateE.getMonth() == mes && dateE.getDate() == dia){
      li = document.createElement("li");
      div = document.createElement("div");
      h2 = document.createElement("h2");
      a = document.createElement("a");
      a.setAttribute("href", "evento?id="+ obj.id);
      a.setAttribute("style", "font-size: 20px");
      h2.appendChild(document.createTextNode(obj.nombre));
      a.appendChild(document.createTextNode("Más info..."));
      p = document.createElement("p");
      p.appendChild(document.createTextNode(" Descripción: " + obj.descripcion + " - Ubicación: " + obj.ubicacion));

      li.appendChild(h2);
      li.appendChild(p);
      li.appendChild(a);
      listEv.appendChild(li);


    }



}



}

function createDate(str1){
// str1 format should be dd/mm/yyyy. Separator can be anything e.g. / or -. It wont effect
var yr1   = parseInt(str1.substring(0,4));
var mon1  = parseInt(str1.substring(5,7));
var dt1   = parseInt(str1.substring(8,10));
var date1 = new Date(yr1, mon1-1, dt1);
return date1;
}

function putDay(diasUL, li,diaTemp, tipo, primer){
  li = document.createElement("li");
  var span = document.createElement("span");
  if(tipo == 1){span.setAttribute("class","today");}
  if(tipo == 2){span.setAttribute("class","event");}
  span.appendChild(document.createTextNode(diaTemp.toString()));
  li.appendChild(span);
  li.setAttribute("onclick","verEventos("+ diaTemp.toString() + ")");
  li.setAttribute("class","handCurso");
  li.setAttribute("id",diaTemp.toString());
  diasUL.appendChild(li);
}

window.onload = function() {
  createCalendar();
}
