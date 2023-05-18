let materiales=[]
let entradaMateriales=[] 
let unidadesMedida=[]
$(function(){
    //se utiliza para las peticiones ajax con jquery
    $.ajaxSetup({
        headers: {
        'X-CSRFToken':getCookie('csrftoken')
        }
    })

    $("#btnAgregarMaterialDetalle").click(function(){ 
        agregarMaterialADetalle();
    })

    $( "#entradaMaterial").click(function(){ v
        istaEntradaMaterial();
    })

    $("#btnRegistrarDetalle").click(function(){
        registroDetalleEntrada();
    })
})

/**
* Realiza la petición ajax para registrar
* la entrada de materiales */
function registroDetalleEntrada(){
    var datos = {
        "codigoFactura": $("#txtFactura").val(), 
        "entregadoPor": $("#txtEntregadoPor").val(),
        "proveedor": $("#cbProveedor").val(), 
        "recibidoPor": $("#cbRecibidoPor").val(),
        "observaciones":$("#txtObservaciones").val(), 
        "fechaHora": $("#txtFecha").val(),
        "detalle": JSON.stringify(entradaMateriales),
    };
    $.ajax({
        url: "/registrarEntradaMaterial/",
        data: datos,
        type: 'post',
        dataType: 'json',
        cache:false,
        success: function(resultado){
            console.log(resultado);
            if(resultado.estado){
                frmDatosGenerales.reset(); 
                entradaMateriales.length=0; 
                mostrarDatosTabla();
            }
            Swal.fire("Registro de Materiales", resultado.mensaje, "success");
        }
    })
}

/**
* Agrega cada material al arreglo de entradaMateriales, 
primero valida que no se haya agregdo previamente
*/
function agregarMaterialADetalle(){
    //averiguar si ya se ha agregado el material
    const m = entradaMateriales.find(material=>material.idMaterial == $("#cbMaterial").val());
    if(m==null){
        const material = {
            "idMaterial": $("#cbMaterial").val(),
            "cantidad": $("#txtCantidad").val(),
            "precio":$("#txtPrecio").val(), "idUnidadMedida": $("#cbUnidadMedida").val(),
            "estado": $("#cbEstado").val(),
            "observaciones":$("#txtObservaciones").val(),
        }
        entradaMateriales.push(material);
        frmEntradaMaterial.reset();
        mostrarDatosTabla();
    }else{
        Swal.fire("Entrada Materiales",
        "El material seleccionado ya se ha agregado en el Detalle. Verifique","info");
    }
}

/**
Agrega los materiales del arreglo entradaMateriales
en la tabla html
*/
function mostrarDatosTabla(){
    datos
    entradaMateriales.forEach(entrada => {
    //obtiene la posición del material en el arreglo materiales de acuerdo al idMaterial 
    //del arreglo entradaMateriales, para poder obtener codigo y nombre del material
    posM = materiales.findIndex(material=>material.idMaterial==entrada.idMaterial); 
    //obtiene la posición de la unidad de medida en el arreglo UnidadesMedida de acuerdo 
    //al idUnidadMedida en arreglo entradaMateriales para poder obtener el nombre
    posu = unidadesMedida.findIndex(unidad=>unidad.id == entrada.idUnidadMedida);
    datos += "<tr>";
    datos += "<td class='text-center'>" + materiales [posM].codigo + "</td>"; 
    datos += "<td>" + materiales [posM].nombre + "</td>";
    datos += "<td class='text-center'>" + entrada.cantidad + "</td>"; 
    datos += "<td class='text-end'>" + "$ "+ entrada. precio +".00" + "</td>";
    datos += "<td>" + unidadesMedida [posU].nombre + "</td>";
    datos += "<td class='text-center'>" + entrada.estado + "</td>";
    datos += "</tr>";
    });
    //agregar a la tabla con id datos TablaMateriales
    datosTablaMateriales.innerHTML = datos;
}