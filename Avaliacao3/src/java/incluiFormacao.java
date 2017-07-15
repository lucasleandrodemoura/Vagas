

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



public class incluiFormacao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String curso = request.getParameter("curso");
        String outros = request.getParameter("outros");
        String id_curriculo = request.getParameter("id_curriculo");
        String concluido = request.getParameter("concluido");
        String inicio = request.getParameter("inicio");
        String fim = request.getParameter("fim");
        String instituicao = request.getParameter("instituicao");
        boolean concl  = false;
        if(concluido.equals("1")){
            concl = true;
        }
        
        String sql = "";
        
        sql = "INSERT INTO formacao(\n" +
"            curso, outros, concluido, inicio, fim, codigo_instituicao, \n" +
"            codigo_curriculo)\n" +
"    VALUES ('"+curso+"', '"+outros+"', "+concl+", '"+inicio+"', '"+fim+"', "+instituicao+", "+id_curriculo+");\n";
        
        
        //response.getWriter().println(sql);
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
                
            }
            
            response.sendRedirect("editar_formacao.jsp");
            
            x.fechar();
            
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir";
    }

}
