
const componenteVentas = (d) => {
    return `
                            <tr>
                                <td>${d.id}</td>
                                <td>${d.name_user}</td>
                                <td>${d.email}</td>
                                <td><d.img src=${d.imagen} alt="" /</td>
                                <td>${d.name_product}</td>
                                <td>${d.category}</td>
                                <td>${d.payment_method}</td>
                                <td>${d.payment_status}</td>
                                <td>${d.quantity}</td>
                                <td>${d.price}</td>
                                <td>${d.quantity * d.price}</td>  
                                <td><a href="./detalles.html?id=${d.id}" style="text-decoration: none;">
                                    <span><button class="btn btn-info text-light">Detalles</button></span>
                                    </a>
                                </td>
                                </tr>
            `
}
const traerVentas = async () => {
    const data = new FormData()
    console.log(sessionStorage.getItem("iduser"))
    data.append("id_user", localStorage.getItem("iduser"))
    await fetch("../php/ventas/getAllSales.php", {
        method: 'POST',
        body: data
    })
        .then(response => response.json())
        .then(response => {
            total = 0
            console.log(response.data)
            response.data.map(r => {
                document.getElementById("ventas").innerHTML += componenteVentas(r)
            });
            console.log(response.data)
        })
        .catch(e => console.log(e))
}
traerVentas()
