document.forms[0].addEventListener("submit", e =>{
    e.preventDefault();
    window.location.href="./buscar.html?search="+e.target[0].value
})