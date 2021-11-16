function openModalEletrodomestico() {
    document.querySelector(".eletrodomestico").classList.remove("hide")
    document.querySelector("body").classList.add("noScroll")
}

function closeModal() {
    document.querySelector(".modal").classList.add("hide")
    document.querySelector("body").classList.remove("noScroll")
}

function openModalMarceneiro() {
    document.querySelector(".marceneiro").classList.remove("hide")
    document.querySelector("body").classList.add("noScroll")
}

function closeModalMarceneiro() {
    document.querySelector(".marceneiro").classList.add("hide")
    document.querySelector("body").classList.remove("noScroll")
}
