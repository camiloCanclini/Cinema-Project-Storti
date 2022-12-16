console.log('Script Funcionando');

(function sendRequest(){

    url = window.location.search;
    console.log('url:', url)
    const paramsUrl = new URLSearchParams(url);
    let idParam = paramsUrl.get("id");
    console.log(paramsUrl.get("id"));

	const httpRequest = new XMLHttpRequest();//Se crea objeto para peticiones-consultas
	httpRequest.open('GET', '../../php/get_movie_info.php?id='+idParam, true);//Se hace la consulta al archivo php
	httpRequest.onreadystatechange= function(){
        if(this.readyState == 4 && this.status == 200){//Si la consulta se realiza con exito se hace el bloque IF
            let response = JSON.parse(this.responseText);//Se convierte JSON de respuesta a un arreglo JS
			console.log(response);
            let form = document.getElementById('form');
			let titulo = document.getElementById('titulo');
			let año = document.getElementById('año');
            let duracion = document.getElementById('duracion');
            let clasificacion = document.getElementById('clasificacion');
            let genero = document.getElementById('genero');
            let poster = document.getElementById('poster');
            console.log('form.action:', form.action);

            for (const i of response) {
                form.action += '?id='+i[0];
                titulo.value = i[1];
                año.value = i[2];
                duracion.value = i[3];
                clasificacion.value = i[4]
                genero.value = i[5]
                poster.value = i[9]
            }
		}
	}
	httpRequest.send();
})();
