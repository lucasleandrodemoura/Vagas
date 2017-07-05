<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.univates.progweb.util.Conexao"%>

<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ include file="includes/header.jsp" %>
<%@ page import = "br.univates.progweb.models.Vagas" %>
               
                
    <%
      Conexao conecta = new Conexao();
      ResultSet x = conecta.selecionar("SELECT idvagas,titulo,codigo_cidade,requisitos,salario FROM vagas WHERE aberto_ate <= now() and candidato_selecionado is null");
      while(x.next()){
          Vagas vaga = new Vagas();
          vaga.setIdvagas(Integer.parseInt(x.getString("idvagas")));
          vaga.setTitulo(x.getString("titulo"));
          vaga.setRequisitos(x.getString("requisitos"));
          vaga.setSalario(Double.parseDouble(x.getString("salario")));
          
          out.print(vaga.getQuadro(false));
      }
      conecta.fechar();
            
    %>
                            
 
        
<%@ include file="includes/footer.jsp" %>
        
       