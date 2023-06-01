$(function(){
    $("#fileFoto").on("change",mostrarImagen);
})

function mostrarImagen(evento){
    const archivos = evento.target.files
    const archivo = archivos[0]
    const url = URL.createObjectURL(archivo)  
    $("#imagenMostrar").attr("src",url)
  }

function cambiarMenuRol(){
    let value = document.getElementById("cbRolMenu").value
    if (value=="Administrador"){
        location.href = "/inicioAdministrador/"
    }
    if (value=="Asistente"){
        location.href = "/inicioAsistente/"
    }
    if (value=="Instructor"){
        location.href = "/inicioInstructor/"
    }
}
