const containerPrint = document.getElementById('funcionesContainer');
console.log('containerPrint:', containerPrint);
(function serverRequest(){
    const HTTPREQUEST = new XMLHttpRequest(); //Se crea objeto HTTPREQUEST
    url = "../php/get_functions.php"
    HTTPREQUEST.open('GET',url, true); //Se configura la petición
    /*Comienzan las operaciones AJAX*/
    HTTPREQUEST.onreadystatechange = function(){
        /*Se verifica que la petición fue exitosa*/
        if(this.readyState == 4 && this.status == 200){
            var respuesta = JSON.parse(this.responseText);//Se obtiene la respuesta de la API y se transforma array
            console.log(respuesta);
            let funciones = respuesta;
            //console.log('funciones:', funciones)
            showResponse(funciones, containerPrint);         
        }
    }
    HTTPREQUEST.send();
}
)();
function showResponse(funciones, containerPrint){
    containerPrint.innerHTML = "";
	console.log(funciones);
	/*Se recorre el ARRAY y se pintan los datos que contiene*/
	for(let i of funciones){
		//console.log('Pintando Objetos...');
		//console.log(i);

        let optionContainer = document.createElement("OPTION");

        optionContainer.setAttribute("name","funcion")
        optionContainer.setAttribute("value",i[0])

        optionContainer.innerHTML = i['titulo']+" - "+i['horario']+" - "+i['direccion']+" - "+i['duracion']

		containerPrint.appendChild(optionContainer);
		// console.log(i);
	}
}