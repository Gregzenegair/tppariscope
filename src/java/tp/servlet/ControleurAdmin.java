/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tp.dao.CRUD;

/**
 *
 * @author Cyrius
 */
public class ControleurAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lsNomPageInclusion = new String();


        if (request.getParameter("page") != null) {

            lsNomPageInclusion = request.getParameter("page") + ".jsp";
            request.setAttribute("inclusion", lsNomPageInclusion);

        }
        if (request.getParameter("page") != null) {
            if (request.getParameter("page").equals("_validerSupp")) {
                CRUD crud = new CRUD("pariscope");
                ResultSet lrs = crud.selectAllCCAnnuler();
                request.setAttribute("resultset", lrs);
            }
        }



        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            switch (action) {
                case "insereRedac":
                    String login = request.getParameter("login");
                    String mdp = request.getParameter("mdp");
                    String[] checked = request.getParameterValues("admin");
                    int admin = 0;
                    if (checked[0].equals("admin")) {
                        admin = 1;
                    }
                    //on insère dans la bdd 
                    CRUD insereUtilisateur = new CRUD("pariscope");
                    insereUtilisateur.insertInto("redacteurs",
                            CRUD.genInsert("3", "login", "mdp", "administrateur", login, mdp, Integer.toString(admin)));


                    request.setAttribute("inclusion", "_insereRedac.jsp");
                    break;
                case "supprimerValider":
                    String id = request.getParameter("id");
                    CRUD deleteArticle = new CRUD("pariscope");
                    deleteArticle.deleteWhere("concerts",
                            CRUD.genCondition("id_concert", id));
                    
                    ResultSet lrs = deleteArticle.selectAllCCAnnuler();
                    request.setAttribute("resultset", lrs);
                    request.setAttribute("inclusion", "_validerSupp.jsp");
                    break;
                    
             case "supprimerAnnuler":
                    id = request.getParameter("id");
                    CRUD supprimerAnnuler = new CRUD("pariscope");
                    supprimerAnnuler.updateWhere("concerts",
                    CRUD.genCondition(
                    "demande_sup", "0"),
                    CRUD.genCondition("id_concert", id));
                    
                    lrs = supprimerAnnuler.selectAllCCAnnuler();
                    request.setAttribute("resultset", lrs);
                    request.setAttribute("inclusion", "_validerSupp.jsp");
                    break;
                default:
                    request.setAttribute("inclusion", "_accueil.jsp");
                    break;

            }

        }


        getServletContext().getRequestDispatcher("/WEB-INF/jsp_back/BackOff.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
