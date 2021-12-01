function openModal(id) {
    document.querySelector(".modal").classList.remove("hide")
    document.querySelector("body").classList.add("noScroll")
    document.getElementById("id_prestador").value = `${id}`
}

function closeModal() {
    document.querySelector(".modal").classList.add("hide")
    document.querySelector("body").classList.remove("noScroll")
}

