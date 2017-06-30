function candidatar(componente) {
    alert("Candidatura realizada com sucesso!");
}


function validaCPF(strCPF) {
    strCPF = strCPF.value;
    var Soma;
    var Resto;
    Soma = 0;
    if (strCPF == "00000000000")
        alert("CPF invalido");

    for (i = 1; i <= 9; i++)
        Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))
        Resto = 0;
    if (Resto != parseInt(strCPF.substring(9, 10)))
        alert("CPF invalido");

    Soma = 0;
    for (i = 1; i <= 10; i++)
        Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))
        Resto = 0;
    if (Resto != parseInt(strCPF.substring(10, 11)))
        alert("CPF invalido");
    
}

$('#tab a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
})
