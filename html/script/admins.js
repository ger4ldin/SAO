
const componenteAdmins = ({ id, name, lastnameF, lastnameM, email }) => {
    return `

                <tr class="">
                <td>${id}</td>
                <td>${name}</td>
                <td>${lastnameF} ${lastnameM}</td>
                <td>${email}</td>
                <td><a href="./admins.html?id=${id}" style="text-decoration: none;">
                    <button class="btn btn-primary">Editar</button></a>
                    <button class="btn btn-danger" onClick="eliminar('${id}','${name}')">Eliminar</button></td>
                </tr>
            `
}
const eliminar = async (id, name) => {
    if (confirm("¿Esta seguro? de eliminar: " + name))
        await fetch("../php/productos/deleteAdmin.php?id_product=" + id)
            .then(res => res.json())
            .then(data => {
                console.log(data)
                alert(data.data)
                if (data.success) window.location.reload()
            })
            .catch(err => console.log(err))
}

const traerAdmins = async () => {
    const data = new FormData()
    console.log(sessionStorage.getItem("iduser"))
    data.append("id_user", localStorage.getItem("iduser"))
    await fetch("../php/usuarios/getAdmins.php", {
        method: 'POST',
        body: data
    })
        .then(response => response.json())
        .then(response => {
            console.log(response.data)
            response.data.map(r => {
                document.getElementById("admins").innerHTML += componenteAdmins(r)
            });
            console.log(response.data)
        })
        .catch(e => console.log(e))
}


traerAdmins();
