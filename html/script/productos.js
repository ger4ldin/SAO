
const componenteDelProducto = ({ id, name, category, stock, description, price, imagen }) => {
    return `
    <tr>
       <td>${id}</td>
       <td>${name}</td>
       <td>${category}</td>
       <td>${stock}</td>
       <td>${description}</td>
       <td>${price}</td>
       <td>
          <img src="../php/productos/${imagen}" style="width:100%; height:100px;object-fit:contain" alt="Imagen"
       />
         
       </td>
       <td>
          <a href="./registroProductos.html?id=${id}">
             <button class="btn btn-primary">Editar</button>
          </a>
          <button class="btn btn-danger"
             onClick="eliminar('${id}','${name}')"
          >Eliminar</button>
       </td>
    </tr>
    `
}
const eliminar = async (id, name) => {
    if (confirm("¿Esta seguro? de eliminar: " + name))
        await fetch("../php/productos/delete.php?id_product=" + id)
            .then(res => res.json())
            .then(data => {
                console.log(data)
                alert(data.data)
                if (data.success) window.location.reload()
            })
            .catch(err => console.log(err))
}
const obtenerProductos = async () => {
    await fetch("../php/productos/getAllProducts.php")
        .then(res => res.json())
        .then(data => {
            console.log(data)
            data.data.map(r => {
                document.getElementById("productos").innerHTML += componenteDelProducto(r)
            });
        })
        .catch(err => console.log(err))

}
obtenerProductos()

