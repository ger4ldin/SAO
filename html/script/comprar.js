
const componenteDelProducto = (data) => {
    const productos = document.getElementById("productos")
    const total = document.getElementById("total")
    total.innerHTML = "";
    productos.innerHTML = "";
    var sumador = 0;
    data.map(d => {
        sumador += d.quantity * d.price;
        productos.innerHTML += `
                <div class="container shadow-sm rounded-3 row p-2 mx-auto">
                    <div class="col-4">
                        <img
                            src="../php/productos/${d.imagen}"
                            alt="${d.name}">
                        </div>
                    <div class="col-8 pl-2">
                        <h5>${d.name}</h5>
                        <p>${d.description}</p>
                        <span>${d.quantity} x ${d.price} = <b>$${d.quantity * d.price} MX
                            </b></span>
                    </div>
                </div>
                `
    })
    total.innerHTML = `$${sumador} MX`
}

const traerProductosDelCarrito = async () => {
    const body = new FormData();
    body.append("id_user", localStorage.getItem("iduser"));
    await fetch("../php/carrito/get.php", {
        method: "POST",
        body: body,
    })
        .then(response => response.json())
        .then(res => {
            console.log(res)
            if (res.success) {
                componenteDelProducto(res.data)
            } else {
                alert("erorr")
                console.log(res)
                console.log(data)
            }
        })
        .catch(error => console.log(error));
}

const pagar = document.getElementById("pagar");

const enviar = async () => {
    const {
        inputBuyCountry,
        inputBuyState,
        inputBuylocality,
        inputBuyMainStreet,
        inputBuyStreet1,
        inputBuyStreet2,
        inputBuyReferences,

        inputBuyPM,
        inputBuyTitular,
        inputBuyNumberCard,
        inputBuyExpiration,
        inputBuyCVV,
    } = pagar
    const data = new FormData()
    data.append("id_user", localStorage.getItem("iduser"))
    data.append("inputBuyCountry", inputBuyCountry.value)
    data.append("inputBuyState", inputBuyState.value)
    data.append("inputBuylocality", inputBuylocality.value)
    data.append("inputBuyMainStreet", inputBuyMainStreet.value)
    data.append("inputBuyStreet1", inputBuyStreet1.value)
    data.append("inputBuyStreet2", inputBuyStreet2.value)
    data.append("inputBuyReferences", inputBuyReferences.value)
    data.append("inputBuyPM", "1")
    data.append("inputBuyTitular", inputBuyTitular.value)
    data.append("inputBuyNumberCard", inputBuyNumberCard.value)
    data.append("inputBuyExpiration", inputBuyExpiration.value)
    data.append("inputBuyCVV", inputBuyCVV.value)

    await fetch("../php/comprar/add.php", {
        method: "POST",
        body: data,
    })
        .then(response => response.json())
        .then(json => {
            if (json.success) {
                alert(json.data)
                window.location.href = "./pedidos.html"
                return
            }
        })
        .catch(err => console.log(err))
}

pagar.addEventListener("submit", e => {
    e.preventDefault();
    enviar()
})

traerProductosDelCarrito();

