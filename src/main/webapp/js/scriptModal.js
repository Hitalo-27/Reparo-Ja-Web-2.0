function openModal() {
    document.querySelector(".modal").classList.remove("hide")
    document.querySelector("body").classList.add("noScroll")
}

function closeModal() {
    document.querySelector(".modal").classList.add("hide")
    document.querySelector("body").classList.remove("noScroll")
}

