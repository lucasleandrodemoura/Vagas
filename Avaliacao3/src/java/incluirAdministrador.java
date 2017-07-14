

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



public class incluirAdministrador extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String nome = request.getParameter("nome");
        String ativo = request.getParameter("ativo");
        int codigo_usuario = Integer.parseInt(request.getParameter("codigo_usuario"));
        String sql = "";
        if(codigo_usuario>0){
            sql = "update administradores set email = '"+email+"',senha = '"+senha+"',nome = '"+nome+"' where codigo_usuario = "+codigo_usuario;
        }else{
            sql = "INSERT INTO administradores(email,senha,nome) VALUES ('"+email+"','"+senha+"','"+nome+"');";
        }
        System.out.println(sql);
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
            }
            
            request.getRequestDispatcher( "admin_usuarios.jsp" ).forward(request, response);
            x.fechar();
            
            
        } catch (SQLException ex) {
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir";
    }

}
