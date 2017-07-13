

/**
 * @author: Vilson Cristiano Gärtner
 * @email: vilson@gartner.net.br
 */

import br.univates.progweb.models.Curriculo;
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
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import org.apache.catalina.session.StandardSession;
import sun.security.pkcs11.wrapper.Functions;



public class editarPerfil extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String estadoCivil = request.getParameter("estadoCivil");
        String dataNascimento = request.getParameter("dataNascimento");
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String foto = request.getParameter("foto");
        String id_curriculo = request.getParameter("id_curriculo");
        String observacoes = request.getParameter("observacoes");
        String pretensao_salarial = request.getParameter("pretencao_salarial");        
                
        
        String sql = "UPDATE public.curriculo\n" +
"   SET cidade_residencia="+cidade+", pretencao_salarial="+pretensao_salarial+", nome='"+nome+"', \n" +
"       estado_civil="+estadoCivil+", data_nascimento='"+dataNascimento+"', cpf='"+cpf+"', endereco='"+endereco+"', bairro='"+bairro+"', \n" +
"       telefone='"+telefone+"', celular='"+celular+"', email='"+email+"', senha='"+senha+"', observacoes='"+observacoes+"' WHERE idcurriculo = "+id_curriculo+";";
       
        
        
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                response.sendRedirect("editar_experiencias.jsp");
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar atualizaçao')</script>");
                request.getRequestDispatcher( "editar_perfil.jsp" ).forward(request, response);
                
            }
            
            
            x.fechar();
            
            
        } catch (SQLException ex) {
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir vaga";
    }

}
