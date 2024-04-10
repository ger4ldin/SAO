
const componenteDelProducto = ({ id, name, price, imagen }) => {
    return `
               <div class="shadow-sm p-4 col-6 col-lg-3 col-md-4">
                  <img src="../php/productos/${imagen}" alt="marca" class="img-fluid" style="object-fit: contain;height: 200px;margin: 0 auto;display: block;"
                     onClick="window.location.href='./verProducto.html?id=${id}'" style="cursor: pointer;"
                  >
                  <p class="mb-0">${name}</p>
                  <span style="color: #fe6347;">$ ${price} MXN</span><br>
                  <form data-id=${id}>
                     <button class="btn btn-primary" name="btnAccion" value="Agregar" type="submit">Agregar al carrito</button>
                  </form>
               </div>
         `
}
document.addEventListener("submit", async e => {
    e.preventDefault();
    let data = new FormData()
    data.append("id_user", sessionStorage.getItem("iduser"))
    data.append("id_product", e.target.dataset.id)
    await fetch("../php/carrito/add.php", {
        method: 'POST',
        body: data
    })
        .then(res => res.json())
        .then(json => {
            alert(json.data)
            if (!json.success) {
                window.location.href = "./registro.html"
            }
            console.log(json)
        })
        .catch(err => console.log(err))
})
const traerporcategoria = async () => {
    await fetch("../php/productos/getProductsByCategory.php?category=0",)
        .then(response => response.json())
        .then(response => {
            console.log(response)
            response.data.map(r => {
                document.getElementById("productos").innerHTML += componenteDelProducto(r)
            });
            console.log(response.data)
        })
        .catch(e => console.log(e))
}
traerporcategoria()
