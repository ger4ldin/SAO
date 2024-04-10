
const componenteDelProducto = ({ id, name, id_product, description, price, imagen, quantity }) => {
    return `
         <div class="productCartSao shadow-sm mb-4 py-2 px-3 rounded-3 row" style="300px;">
            <div class="col-4 productCartSaoImg"
               style="background-image: url("../php/productos/${imagen}");background-size: contain;background-repeat: no-repeat;">
            </div>
            <div class="col-5">
               <h5>${name}</h5>
               <p>${description}</p>
            </div>
            <div class="col-3 row" style="height: 50%;">
               <span class="col-12 ">Costo: <b>$ ${price}</b></span>
               <span class="col-12 mb-3">Total: <b> $ ${price * quantity}</b></span>
                  <span class="input-group-text col-4" style="cursor: pointer;"
                     onClick="cantidad(0,${id_product})"
                  >-</span>
                  <span class="input-group-text col-4 bg-white">${quantity}</span>
                  <span class="input-group-text col-4" style="cursor: pointer;"
                     onClick="cantidad(1,${id_product})"
                  >+</span>
                  <button 
                     class="btn btn-danger mt-3"
                     onClick="eliminarProducto('${id}','${id_product}','${name}')"
                  >Eliminar</button>
            </div>
         </div>
         `
}
const cantidad = async (type, id_product) => {
    let data = new FormData()
    data.append("id_user", localStorage.getItem("iduser"))
    data.append("id_product", id_product)
    data.append("add", type)
    await fetch("../php/carrito/quantity.php", {
        method: "POST",
        body: data,
    })
        .then(res => res.json())
        .then(json => {
            alert(json.data)
            if (json.success) {
                window.location.reload()
            }
        })
        .catch(err => console.log(err))
}
const eliminarProducto = async (id, id_product, name) => {
    const data = new FormData();
    data.append("id_user", localStorage.getItem("iduser"));
    data.append("id_product", id_product)
    if (confirm("¿Esta seguro? de eliminar: " + name))
        await fetch("../php/carrito/remove.php", {
            method: "POST",
            body: data
        })
            .then(res => res.json())
            .then(data => {
                if (data.success) window.location.reload()
            })
            .catch(err => console.log(err))
}

const traerCarrito = async () => {
    const data = new FormData()
    data.append("id_user", localStorage.getItem("iduser"))
    await fetch("../php/carrito/get.php", {
        method: 'POST',
        body: data
    })
        .then(response => response.json())
        .then(response => {
            total = 0
            response.data.map(r => {
                document.getElementById("productosDelCarrito").innerHTML += componenteDelProducto(r)
                total += r.price * r.quantity
            });
            document.getElementById("total").innerHTML = `$ ${total} MXN`
        })
        .catch(e => console.log(e))
}
traerCarrito()
