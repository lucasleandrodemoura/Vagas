

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



public class incluiExperiencia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome_empresa = request.getParameter("nome_empresa");
        String codigo_experiencia = request.getParameter("codigo_experiencia");
        String data_de = request.getParameter("data_de");
        String data_ate = request.getParameter("data_ate");
        String ultimo_cargo = request.getParameter("ultimo_cargo");
        String atividades_desempenhadas = request.getParameter("atividades_desempenhadas");
        String id_curriculo = request.getParameter("id_curriculo");
        
        String sql = "";
        if(codigo_experiencia!="null"){
        sql = "INSERT INTO experiencia(\n" +
"             nome_empresa, atividades_desempenhadas, ultimo_cargo_ocupado, \n" +
"            data_de, data_ate, codigo_curriculo)\n" +
"    VALUES ('"+nome_empresa+"', '"+atividades_desempenhadas+"', '"+ultimo_cargo+"', \n" +
"           '"+data_de+"', '"+data_ate+"', "+id_curriculo+");";
        }
        else{
            
        }
        
        
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
                
            }
            
            response.sendRedirect("editar_experiencias.jsp");
            
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
