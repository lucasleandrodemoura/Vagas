function candidatar(codigo,candidato) {
    if(confirm("Voce deseja se canditar a esta vaga?")){
        location.href = "candidatarVaga?codigo_vaga="+codigo+"&candidato="+candidato;
    }
}

function excluir(codigo,retorno,tabela,key){
    if(confirm("Voce deseja excluir este registro?")){
        location.href = "excluir?codigo="+codigo+"&retorno="+retorno+"&tabela="+tabela+"&key="+key;
    }
}

/**
 * Redireciona para a tela principal
 * @returns {undefined}
 */
function ConcluirCurriculo(){
    
    location.href = "editar_curriculo.jsp";
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
