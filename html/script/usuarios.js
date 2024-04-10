
const componenteUsuarios = ({ id, name, lastnameF, lastnameM, email }) => {
    return `
            <tbody>
                <tr class="">
                    <td>${id}</td>
                    <td>${name}</td>
                    <td>${lastnameF} ${lastnameM}</td>
                    <td>${email}</td>
                    <td><button class="btn btn-primary">Editar</button>
                        <button class="btn btn-danger">Eliminar</button>
                    </td>
                </tr>
                
            </tbody>
            `
}
const traerUsuarios = async () => {
    const data = new FormData()
    console.log(sessionStorage.getItem("iduser"))
    data.append("id_user", localStorage.getItem("iduser"))
    await fetch("../php/usuarios/getAll.php", {
        method: 'POST',
        body: data
    })
        .then(response => response.json())
        .then(response => {
            console.log(response.data)
            response.data.map(r => {
                document.getElementById("users").innerHTML += componenteUsuarios(r)
            });
            console.log(response.data)
        })
        .catch(e => console.log(e))
}
traerUsuarios();
