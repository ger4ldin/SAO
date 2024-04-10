
document.addEventListener("submit", async e => {
    console.log(e.target)
    console.log(e.target.dataset.id)
    e.preventDefault();
    let data = new FormData()
    data.append("id_user", localStorage.getItem("iduser"))
    data.append("id_product", e.target.dataset.id)
    await fetch("../php/carrito/add.php", {
        method: 'POST',
        body: data
    })
        .then(res => res.json())
        .then(json => {
            alert(json.data)
            console.log(json)
        })
        .catch(err => console.log(err))
})
const obtenerProducto = async () => {
    if (!window.location.search.split("=")[1]) {
        window.location.href = "./principalAdmin.html"
    }
    await fetch("../php/productos/getById.php?id_product=" + window.location.search.split("=")[1])
        .then(response => response.json())
        .then(res => {
            const data = res.data[0]
            const producto = document.getElementById("producto")
            producto.querySelector("img").src = "../php/productos/" + data.imagen
            producto.querySelector("h3 b").innerHTML = data.id
            producto.querySelector("h4").innerHTML = data.name
            producto.querySelectorAll("small")[0].innerHTML = data.description
            producto.querySelectorAll("small")[1].innerHTML = data.specifications
            producto.querySelectorAll("small")[2].innerHTML = "Precio: $" + data.price
            producto.querySelectorAll("small")[3].innerHTML = "Estock: " + data.stock
            producto.querySelectorAll("button")[0].innerHTML = data.category
            producto.querySelectorAll("button")[1].innerHTML = data.brand
            producto.querySelector("form").dataset.id = data.id
            console.log(data)
        })
        .catch(error => console.log(error))
}
obtenerProducto()
