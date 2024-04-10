

const obtenerProducto = async () => {
    if (window.location.search.split("=")[1]) {
    }
    await fetch("../php/usuarios/getById.php?id_user=" + localStorage.getItem("iduser"))
        .then(response => response.json())
        .then(res => {
            const { data } = res
            console.log(data)
            const cuenta = document.getElementById("cuenta");
            cuenta.querySelectorAll("label")[0].innerHTML = "<b>Nombre: </b>" + data.user.name
            cuenta.querySelectorAll("label")[1].innerHTML = "<b>Correo: </b>" + data.user.email
            cuenta.querySelectorAll("label")[2].innerHTML = `
            <b class="fs-6">Direccion:</b>
            <br/>
            ${data.address.main_street} x ${data.address.street1} x ${data.address.street2} <br/>
            ${data.address.locality} x ${data.address.state} x Mexico <br/>
            `
            const compras = document.getElementById("compras");
            compras.querySelectorAll("label")[0].innerHTML = "<b>Productos en el carrito: </b>" + data.cart.cart
            compras.querySelectorAll("label")[1].innerHTML = "<b>Productos comprados: </b>" + data.sale.sale

        })
        .catch(error => console.log(error))
}
obtenerProducto()
