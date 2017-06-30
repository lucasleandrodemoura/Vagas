<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>



<%@page import="br.univates.progweb.Estado"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
    <%@ page import ="br.univates.progweb.Vagas" %>
    <%@ page import ="br.univates.progweb.Cidades" %>

                    
                
    <%
        //Lista todas as vagas
       
       Vagas v[] = new Vagas[4];
       Cidades cidade = new Cidades();
       Estado estado = new Estado();
       estado.setCodigoEstado(1);
       estado.setNomeEstado("Rio Grande do Sul");
       estado.setSigla("RS");
       
       cidade.setCodigoCidade(1);
       cidade.setCodigoEstado(estado);
       cidade.setNomeCidade("Lajeado");
       
       v[0] = new Vagas(0);
       v[0].setTitulo("T�cnico em inform�tica");
       v[0].setCodigoCidade(cidade);
       v[0].setDescricao("Estamos procurando um profissional que ir� atuar na �rea de suporte a clientes");
       v[0].setRequisitos("Curso t�cnico conclu�do em inform�tica<br>Experi�ncia de dois anos");
       v[0].setSalario(1000.00);
       
       v[1] = new Vagas(1);
       v[1].setTitulo("Farmaceutica");
       v[1].setDescricao("Ser� respons�vel por toda a documenta��o da farm�cia e orienta��o aos clientes e funcion�rios");
       v[1].setCodigoCidade(cidade);
       v[1].setRequisitos("Curso superior conclu�do<br>Registro no CRF");
       v[1].setSalario(4500.00);
       
       v[2] = new Vagas(2);
       v[2].setTitulo("Arquiteto");
       v[2].setDescricao("Respons�vel t�cnica para condom�nios resid�nciais atuando junto a equipe de obras.");
       v[2].setCodigoCidade(cidade);
       v[2].setRequisitos("Curso superior conclu�do");
       v[2].setSalario(4000.00);
       
       v[3] = new Vagas(3);
       v[3].setTitulo("Programador");
       v[3].setDescricao("Desenvolvimento em java de solu��es para a rede de farm�cias");
       v[3].setCodigoCidade(cidade);
       v[3].setRequisitos("Curso superior conclu�do<br>Experi�ncia de dois anos");
       v[3].setSalario(2000.00);
       
       
       int codigo = Integer.parseInt(request.getParameter("codigo"));
       
            
    %>
                            

  
        <div class="block-grid">
                
                <div class="conteudo">
                    <p class="titulo_detalhe_vaga" id="titulo_detalhe_vaga">
                        <h2><% out.print(v[codigo].getTitulo()); %></h2> 
                    </p>
                    
                    <p class="small">Cod: <% out.print(v[codigo].getIdvagas()); %></p>
                    
                    <p class="detalhes_detalhe_vaga" id="detalhes_detalhe_vaga">
                        <% out.print(v[codigo].getDescricao()); %>.<br>
                        <b>Requisitos:</b><br>
                        <% out.print(v[codigo].getRequisitos()); %><br>
                        <b>Cidade da vaga: </b> <% out.print(v[codigo].getCodigoCidade().getNomeCidade()); %>/<% out.print(v[codigo].getCodigoCidade().getCodigoEstado().getSigla()); %> <br>
                        <b>Sal�rio: </b> R$ <% out.print(v[codigo].getSalario()); %><br>
                                                
                    </p>
                    
                    <p id="voltar"><a href="index.jsp" class="btn btn-default small">Voltar</a></p>
                    
                </div>
                
                  

            </div>
        
        
        <%@ include file="includes/footer.jsp" %>
        
       