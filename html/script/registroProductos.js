
const form = document.querySelectorAll('form')[1];
const inputFile = document.querySelector('#inputFile');
const imagen = document.querySelector('#imagen');

inputFile.addEventListener('change', (e) => {
    const file = e.target.files[0];
    const reader = new FileReader();
    reader.onload = function (e) {
        imagen.src = e.target.result;
    };
    reader.readAsDataURL(file);
});

const obtenerProducto = async () => {
    if (window.location.href.includes("?")) {
        await fetch(
            '../php/productos/getById.php?id_product=' + window.location.href.split("=")[1]
        )
            .then(response => response.json())
            .then(d => {
                const data = d.data[0]
                document.getElementById('imagen').src = data.imagen
                form.querySelector('[name="selectCategory"]').innerHTML += `<option value="${data.id_category}>${data.category}</option>`;
                form.querySelector('[name="selectBrand"]').innerHTML += `<option value="${data.id_brand}>${data.brand}</option>`;
                form.querySelector('[name="InputName"]').value = data.name;
                form.querySelector('[name="InputDescription"]').value = data.description;
                form.querySelector('[name="InputSpecification"]').value = data.specifications;
                form.querySelector('[name="InputDimencions"]').value = data.dimensions;
                form.querySelector('[name="InputQuantity"]').value = data.stock;
                form.querySelector('[name="InputPrice"]').value = data.price;
            })
            .catch(error => console.error(error));
    }
}
obtenerProducto()

form.addEventListener('submit', (e) => {
    e.preventDefault();
    const selectCategory = form.querySelector('[name="selectCategory"]');
    const selectBrand = form.querySelector('[name="selectBrand"]');
    const InputName = form.querySelector('[name="InputName"]');
    const InputDescription = form.querySelector('[name="InputDescription"]');
    const InputSpecification = form.querySelector('[name="InputSpecification"]');
    const InputDimencions = form.querySelector('[name="InputDimencions"]');
    const InputQuantity = form.querySelector('[name="InputQuantity"]');
    const InputPrice = form.querySelector('[name="InputPrice"]');

    const formData = new FormData();
    formData.append('id', window.location.href.split("=")[1] ?? "");
    formData.append('id_category', selectCategory.value);
    formData.append('id_brand', selectBrand.value);
    formData.append('name', InputName.value);
    formData.append('imagen', inputFile.files[0]);
    formData.append('description', InputDescription.value);
    formData.append('specifications', InputSpecification.value);
    formData.append('dimensions', InputDimencions.value);
    formData.append('stock', InputQuantity.value);
    formData.append('price', InputPrice.value);
    formData.append('discount', '0.0');

    fetch(
        window.location.href.includes("?") ?
            '../php/productos/update.php'
            :
            '../php/productos/add.php'
        , {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if (data.success) {
                alert(

                    window.location.href.includes("?") ?
                        "Producto editado correctamente"
                        :
                        "Producto agregado correctamente"

                );
            }
        })
        .catch(error => console.error(error));
});
