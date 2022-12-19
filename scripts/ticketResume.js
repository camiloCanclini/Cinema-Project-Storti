const form_ticket = document.getElementById('form')
const precioEntrada = 500.00;
var flag = false;
var finalPrecio = false;
form_ticket.addEventListener('change', function(){
    
    console.log('Algo cambió');
    let edad = form_ticket.elements['edad'].value;
    let cantidad = form_ticket.elements['cantidad'].value;
    let jubilado = form_ticket.elements['jubilado'].value;
    let funcion = form_ticket.elements['funcion'].value;

    const resumeCantidad = document.getElementById('resume_cantidad');
    const resumeFuncion = document.getElementById('resume_funcion');
    const resumeDescuento = document.getElementById('resume_descuento');
    const resumeFinal = document.getElementById('resume_final_price');



    console.log('edad:', edad);
    console.log('cantidad:', cantidad);
    console.log('jubilado:', jubilado);

    let precio = cantidad * precioEntrada

    resumeCantidad.innerHTML = cantidad;
    resumeFuncion.innerHTML = funcion;
    if ( edad >= 18 ){
        if (jubilado == "true"){
            finalPrecio = precio*0.5;
            resumeDescuento.innerHTML = "Jubilado (50% OFF)"
            console.log("hola");
        }else{
            resumeDescuento.innerHTML = "Sin descuento"
            finalPrecio = precio;
        }
        flag = true;
        resumeFinal.innerHTML = finalPrecio;
    }
});

form_ticket.addEventListener('submit', event =>  {
    event.preventDefault();//Evita que el formulario recargue la pagina
    if(flag == true){       
        var httpc = new XMLHttpRequest(); 
        var url = "../php/create_ticket.php";
        httpc.open("POST", url, true);
        httpc.setRequestHeader('Content-type', 'application/x-www-form-urlencoded'); 
        httpc.onreadystatechange = function() { 
            if(httpc.readyState == 4 && httpc.status == 200) { 
                console.log(httpc.responseText);
                if(httpc.responseText == "true"){
                    alert('Compra realizada exitosamente');
                    location.href = "./tickets_sale.html"
                }else{
                    alert('A ocurridó un problema');
                    location.href = "./tickets_sale.html"
                }
                
            }
        };
        let params = {funcion:form_ticket.elements['funcion'].value,precio: finalPrecio,tipo:form_ticket.elements['jubilado'].value,cantidad:form_ticket.elements['cantidad'].value,confirmar: true}
        console.log('params:', params);
        
        httpc.send(JSON.stringify(params));
    }else{
        alert('Usted tiene que ser mayor de edad');
    }
    
});