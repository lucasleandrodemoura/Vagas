<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="br.univates.progweb.models.Vagas"%>
<%@page import="java.util.ArrayList"%>

<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>

<% 
if(session.getValue("logado_admin")==null){
    response.sendRedirect("admin.jsp");
}
%>
   <div class="conteudo">
                <div class="row">
                    
                    
                    
                    
                    <%
                        Conexao conecta = new Conexao();
                        
                        ResultSet x = conecta.selecionar("SELECT idvagas,titulo,codigo_cidade,requisitos,salario FROM vagas WHERE aberto_ate >= now() and candidato_selecionado is null");
                        while(x.next()){
                            Vagas vaga = new Vagas();
                            vaga.setIdvagas(Integer.parseInt(x.getString("idvagas")));
                            vaga.setTitulo(x.getString("titulo"));
                            vaga.setRequisitos(x.getString("requisitos"));
                            vaga.setSalario(Double.parseDouble(x.getString("salario")));

                            out.print(vaga.getQuadro(4));
                        }
                        conecta.fechar();
            
                    %>

                    
                    
                    
                    
                    <div class="col-sm-12 col-md-4">
                        <div class="thumbnail" id="vaga">
                            <a href="admin_cadastrar_vaga.jsp"><h1><i class="glyphicon glyphicon glyphicon-plus-sign"></i> Adicionar vaga</h1></a>
                        </div>
                    </div>

                </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       