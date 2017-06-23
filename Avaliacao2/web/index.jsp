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
       v[0].setTitulo("Técnico em informática");
       v[0].setCodigoCidade(cidade);
       v[0].setRequisitos("Curso técnico concluído em informática<br>Experiência de dois anos");
       v[0].setSalario(1000.00);
       
       v[1] = new Vagas(1);
       v[1].setTitulo("Farmaceutica");
       v[1].setCodigoCidade(cidade);
       v[1].setRequisitos("Curso superior concluído<br>Registro no CRF");
       v[1].setSalario(4500.00);
       
       v[2] = new Vagas(2);
       v[2].setTitulo("Arquiteto");
       v[2].setCodigoCidade(cidade);
       v[2].setRequisitos("Curso superior concluído");
       v[2].setSalario(4000.00);
       
       v[3] = new Vagas(3);
       v[3].setTitulo("Programador");
       v[3].setCodigoCidade(cidade);
       v[3].setRequisitos("Curso superior concluído<br>Experiência de dois anos");
       v[3].setSalario(2000.00);
       
       
       for(int cont = 0; cont < v.length; cont++)     {
           out.print(v[cont].getQuadro(false));
       }
       

      
      
      
            
    %>
                            

  
        
        
        
        <%@ include file="includes/footer.jsp" %>
        
       