

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



public class incluirCurso extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome = request.getParameter("descricao");
        String nivel = request.getParameter("nivel");
            int codigo_curso = Integer.parseInt(request.getParameter("codigo_curso"));
        String sql = "";
        if(codigo_curso>0){
         sql = "UPDATE cursos SET " +
"            nome_curso = '"+nome+"', \n" +
"            nivel = "+nivel+" WHERE codigo_curso = "+codigo_curso;
        }else{
        sql = "INSERT INTO cursos(\n" +
"            nome_curso, \n" +
"            nivel)\n" +
"    VALUES (\n" +
"    '"+nome+"', \n" +
"    "+ nivel+");";
        }
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
            }
            
            request.getRequestDispatcher( "admin_cursos.jsp" ).forward(request, response);
            x.fechar();
            
            
        } catch (SQLException ex) {
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir vaga";
    }

}
