
const componenteDetalles = ({ imagen, name, description, payment_method, payment_status, created_at }) => {
    return `
        <div class="col-4">
            <img src="../php/productos/${imagen}" alt="">
        </div>
        <div class="col-8">
            <h5>${name}</h5>
            <h6>${description}</h6>
            <h6>Metodo de pago: <b>${payment_method}</b> </h6>
            <h6>Estatus: <b>${payment_status}</b> </h6>
            <div class="mt-2">
                <p>Fecha de compra: <b>${created_at}</b> </p>
            </div>
        </div>
    `
}
const componentProccess = (data, process) => {
    console.log(data)
    document.getElementById("proccess").innerHTML = ""
    data.map(d => {
        document.getElementById("proccess").innerHTML += `
            <div 
                class=" col-2" 
                style="opacity: ${(!((d.id) <= parseInt(process))) ? "0.5" : "1"};"
            >
                <div class="row">
                    <div class="col-12 text-center">
                        <span style="font-size: 50px; color: ${(!((d.id) <= parseInt(process))) ? "#aaa" : "#ffa600"};">
                            ${d.icon_process}
                        </span></div>
                    <div class="col-12"
                        style="
                            height: 15px; 
                            background: ${(!((d.id) <= parseInt(process))) ? "#aaa" : "#ffa600"}; 
                            borderTopLeftRadius: (${d.id} == 0) ? "20px" : "",
                            borderBottomLeftRadius: (${d.id} == 0) ? "20px" : "",
       
                            borderTopRightRadius: (${d.id} == 5) ? "20px" : "",
                            borderBottomRightRadius: (${d.id} == 5) ? "20px" : "",    
                        ">
                    </div>
                    <div class="col-12 text-center">
                        <p style="font-size: 14px; opacity: 0.6;">${d.name_process}</p>
                    </div>
                    <div class="col-12">
                        <p style="font-size: 12px;"></p>
                    </div>
                </div>
            </div>
        `
    })
}

const actualizarEstado = async () => {
    await fetch("../php/comprar/updateProcess.php" + "?id_pedido=" + window.location.href.split("=")[1]
    ).then((response) => response.json())
        .then((response) => {
            console.log(response)
        })
        .catch((error) => console.error(error))
}

const traerDetalles = async () => {
    await fetch("../php/ventas/details.php?id_pedido=" + window.location.href.split("=")[1])
        .then(response => response.json())
        .then(response => {
            console.log(response)
            let idProcess = 1
            response.data.map((r) => {
                document.getElementById("detalles").innerHTML += componenteDetalles(r.sale)
                idProcess = r.sale.id_process;
            });

            response.data.map((r) => {
                componentProccess(r.process, idProcess)
            });
        })
        .catch(e => console.log(e))
}
actualizarEstado()
traerDetalles();

