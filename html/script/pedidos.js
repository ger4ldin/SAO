
const componentePedidos = ({ id, imagen, name_product, category, payment_status, payment_method, quantity, price, description }) => {
    return `
    
        <tr class="" style="font-size: 15px;">
            <td><span>${id}</span></td>
            <td class=""><img
                    src="../php/productos/${imagen}"
                    alt="" style="width: 100%; height: 70px;"></td>
            <td class=""><span>${name_product}</span></td>
            <td class=""><span>${category}</span></td>
            <td class=""><span>${payment_method}</span></td>
            <td class=""><span><b class="colorStatus1">${payment_status}</b></span></td>
            <td class=""><span>${quantity}</span></td>
            <td class=""><span>$ ${price} MNX</span></td>
            <td class=""><span>${quantity * price}</span></td>
            <td><a href="./detalles.html?id=${id}" style="text-decoration: none">
                <span><button class="btn btn-info text-light">Detalles</button></span>
                </a>
            </td>
        </tr>
    `
}
const traerPedidos = async () => {
    const data = new FormData()
    console.log(sessionStorage.getItem("iduser"))
    data.append("id_user", localStorage.getItem("iduser"))
    await fetch("../php/ventas/getSaleByIdUser.php", {
        method: 'POST',
        body: data
    })
        .then(response => response.json())
        .then(response => {

            console.log(response.data)
            response.data.map(r => {
                document.getElementById("pedidos").innerHTML += componentePedidos(r)

            });
            console.log(response.data)
        })
        .catch(e => console.log(e))
}
traerPedidos();
