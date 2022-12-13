const containerPrint = document.getElementById('containerMoviesDB');
(function serverRequest(){
    const HTTPREQUEST = new XMLHttpRequest(); //Se crea objeto HTTPREQUEST
    url = "../../php/get_movies.php"
    HTTPREQUEST.open('GET',url, true); //Se configura la petición
    /*Comienzan las operaciones AJAX*/
    HTTPREQUEST.onreadystatechange = function(){
        /*Se verifica que la petición fue exitosa*/
        if(this.readyState == 4 && this.status == 200){
            var respuesta = JSON.parse(this.responseText);//Se obtiene la respuesta de la API y se transforma array
            console.log(respuesta);
            let movies = respuesta;
            console.log('movies:', movies)
            showResponse(movies, containerPrint);         
        }
    }
    HTTPREQUEST.send();
}
)();
function showResponse(movies, containerPrint){
	console.log(movies);
	containerPrint.innerHTML = "";
	/*Se recorre el ARRAY y se pintan los datos que contiene*/
	for(let i of movies){
		console.log('Pintando Objetos...');
		console.log(i);

        let movieContainer = document.createElement("DIV");

		let id = document.createElement("DIV");
		let titulo = document.createElement("DIV");
		let año = document.createElement("DIV");
		let duracion = document.createElement("DIV");
		let clasificacion = document.createElement("DIV");
		let genero = document.createElement("DIV");
		let poster = document.createElement("IMG");
		let editar = document.createElement("A");
        let eliminar = document.createElement("A");

        id.innerHTML = i[0];
        titulo.innerHTML = i[1];
        año.innerHTML = i[2];
        duracion.innerHTML = i[3];
        clasificacion.innerHTML = i[4];
        genero.innerHTML = i[5];
        poster.setAttribute("SRC", i[9]); 
        editar.setAttribute("HREF","editPelicula.html?id="+i[0]);
        eliminar.setAttribute("HREF","../../deletePelicula.php?id="+i[0]);

        movieContainer.appendChild(id);
        movieContainer.appendChild(titulo);
        movieContainer.appendChild(año);
        movieContainer.appendChild(duracion);
        movieContainer.appendChild(clasificacion);
        movieContainer.appendChild(genero);
        movieContainer.appendChild(poster);
        movieContainer.appendChild(editar);
        movieContainer.appendChild(eliminar);

		containerPrint.appendChild(movieContainer);
		// console.log(i);
	}
}