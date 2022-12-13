/*   APIKEY = cf09fe5c    */
//const url = 'http://www.omdbapi.com/?apikey=cf09fe5c&s=batman';//Se fija la URL de la API con la que haremos la consulta
const form = document.getElementById('form');
const container = document.getElementById('containerForm');
const containerMovies = document.getElementById('containerMovies');
form.addEventListener('submit', event => {
	event.preventDefault();//Evita que el formulario recargue la pagina
	displayContainer(containerMovies);
	console.log(containerMovies.style.display);
	containerMovies.style.display = "flex";
	const input = form[0].value;
    console.log(input);
	var text = input;
	var url = 'http://www.omdbapi.com/?apikey=cf09fe5c&s='+text;
	console.log('url:', url)
	const HTTPREQUEST = new XMLHttpRequest(); //Se crea objeto HTTPREQUEST
	HTTPREQUEST.open('GET',url, true); //Se configura la petición
    /*Comienzan las operaciones AJAX*/
	HTTPREQUEST.onreadystatechange = function(){
        /*Se verifica que la petición fue exitosa*/
		if(this.readyState == 4 && this.status == 200){
			var respuesta = JSON.parse(this.responseText);//Se obtiene la respuesta de la API y se transforma array
            console.log(respuesta);
            let movies = respuesta["Search"];
			showResponse(movies, containerMovies);
		}
	}
	HTTPREQUEST.send();
});
function displayContainer (containerMovies){
	//containerMovies.style.display.toggle("flex", "none");
	
}
function showResponse(movies, containerMovies){
	containerMovies.removeAttribute("hidden");
	console.log('Imprimiendo respuesta...');
	console.log(movies);
	let container = document.getElementById('containerMovies');
	container.innerHTML = "";
	/*Se recorre el ARRAY y se pintan los datos que contiene*/
	for(let i of movies){
		console.log('Pintando Objetos...');
		let link = document.createElement("A");
		let containerMovie = document.createElement("DIV");
		let movieImg = document.createElement("IMG");
		let movieInfo = document.createElement("DIV");
		let titulo = document.createElement("P");
		let id = document.createElement("P");

		link.setAttribute("href","../../php/upload_movie.php?imdbID="+i["imdbID"]);
		containerMovie.setAttribute("class","movieContainer");
		movieImg.setAttribute("src",i["Poster"]);
		movieInfo.setAttribute("class","movie-info");
		titulo.innerHTML = i["Title"];
		id.innerHTML = i["imdbID"];

		movieInfo.appendChild(titulo);
		movieInfo.appendChild(id);
		containerMovie.appendChild(movieImg);
		containerMovie.appendChild(movieInfo);
		link.appendChild(containerMovie);

		container.appendChild(link);
		// console.log(i);
	}
}