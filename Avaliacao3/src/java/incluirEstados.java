

/**
 * @author: Vilson Cristiano Gärtner
 * @email: vilson@gartner.net.br
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.univates.progweb.util.Conexao;
import org.apache.catalina.session.StandardSession;
import sun.security.pkcs11.wrapper.Functions;



public class incluirEstados extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome = request.getParameter("nome");
        String sigla = request.getParameter("sigla");
            int codigo_estado = Integer.parseInt(request.getParameter("codigo_estado"));
        String sql = "";
        if(codigo_estado>0){
             
                sql = "UPDATE estado SET \n" +
                    "            nome_estado = '"+nome+"', \n" +
                    "            sigla = '"+sigla+"' WHERE codigo_estado = "+codigo_estado;
        }else{
        
       
                sql = "INSERT INTO estado(\n" +
                "            nome_estado, \n" +
                "            sigla)\n" +
                "    VALUES (\n" +
                "    '"+nome+"', \n" +
                "    '"+sigla+"');";
        }
        
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
            }
            
            request.getRequestDispatcher( "admin_estados.jsp" ).forward(request, response);
            x.fechar();
            
            
        } catch (SQLException ex) {
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir vaga";
    }

}
