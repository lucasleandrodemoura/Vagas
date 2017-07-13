<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>



<%@page import="br.univates.progweb.models.Vagas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   <% 
if(session.getValue("logado")==null){
    response.sendRedirect("index.jsp");
}else {
    String id_curriculo = session.getAttribute("id_curriculo").toString();
%>

                    
                
    <%
        //Lista todas as vagas
       
      Conexao conecta = new Conexao();
      ResultSet x = conecta.selecionar("SELECT idvagas,titulo,codigo_cidade,requisitos,salario, (select count(*) from candidatura where candidatura.codigo_vaga = vagas.idvagas and candidatura.codigo_candidato = "+id_curriculo+") as candidatado FROM vagas WHERE aberto_ate >= now() and candidato_selecionado is null");
      
      while(x.next()){
          Vagas vaga = new Vagas();
          vaga.setIdvagas(Integer.parseInt(x.getString("idvagas")));
          vaga.setTitulo(x.getString("titulo"));
          vaga.setRequisitos(x.getString("requisitos"));
          vaga.setSalario(Double.parseDouble(x.getString("salario")));
          
          %>
          
          <div class="col-sm-12 col-md-3">
                        <div class="thumbnail" id="vaga_<%=vaga.getIdvagas()%>">
                            <div class="caption">
                               <h3><%=vaga.getTitulo()%></h3>
                               
                                <p><%=vaga.getRequisitos()%><br>Salário: R$ <%=vaga.getSalario()%></p>
                                <% if(x.getInt("candidatado")==0) { %>
                                    <a href="javascript:candidatar(<%=vaga.getIdvagas()%>,<%=id_curriculo%>);" class="btn btn-warning small" role="button" id="Link_Candidatar_<%=vaga.getIdvagas()%>">Candidatar</a>
                                <% } %>
                            </div>
                        </div>
                    </div>     
          
          <%
      }
      conecta.fechar();
            
      
            }
    %>
                            

  
        
        
        
        <%@ include file="includes/footer.jsp" %>
        
       