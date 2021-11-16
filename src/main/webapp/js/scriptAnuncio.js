
let categoria = document.querySelector('#categoria');
let categoria1 = ["Eletrodoméstico"];
let categoria2 = ["Instalação", "Reforma", "Porta de madeira", "Móveis sobmedida"];
let categoria3 = ["Instalação", "Reparo"];
let categoria4 = ["Azulegista / Piso", "Rebocar parede", "Construir escadas", "Fazer contrapiso"];
let categoria5 = ["Pintura clássica", "Gráfite", "Textura", "Papel de parede"];
let categoria6 = ["Encanador"];

categoria.addEventListener('change', () => {
    switch (categoria.value) {
        case "eletroeletronica":
            criaSelect(categoria1);
            break;
        case "marcenaria":
            criaSelect(categoria2);
            break;
        case "eletronica":
            criaSelect(categoria3);
            break;
        case "pedreiro":
            criaSelect(categoria4);
            break;
        case "pintor":
            criaSelect(categoria5);
            break;
        case "encanador":
            criaSelect(categoria6);
            break;
        

    }
});

function limpaSelect(selectbox) {
    var i;
    for (i = selectbox.options.length - 1; i >= 0; i--) {
        selectbox.remove(i);
    }
}

function criaOption(elemento) {
    let selectSubcategoria = document.querySelector('#subcategoria');
    let criaElementoOption = document.createElement('option');
    let insereSelect = selectSubcategoria.appendChild(criaElementoOption);
    criaElementoOption.textContent = elemento;
}

function comparaSecoes(primeiraSecao, segundaSecao) {
    if (primeiraSecao == segundaSecao) {
        primeiraSecao.forEach((elemento) => {
            criaOption(elemento);
        });
    }
}

function criaSelect(categoria) {
    limpaSelect(document.querySelector('#subcategoria'));

    comparaSecoes(categoria, categoria1);
    comparaSecoes(categoria, categoria2);
    comparaSecoes(categoria, categoria3);
    comparaSecoes(categoria, categoria4);
    comparaSecoes(categoria, categoria5);
    comparaSecoes(categoria, categoria6);
}