/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tp.dao.CRUD;

/**
 *
 * @author Cyrius
 */
public class ControleurUtilisateur extends HttpServlet {

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
        String redirection = null;
        CRUD database = new CRUD("pariscope");

        if (request.getParameter("action").equals("checkUtilisateur")) {
            String login = request.getParameter("login");
            String mdp = request.getParameter("mdp");
            String utilisateur = database.checkUtilisateur("redacteurs", "login", "mdp", login, mdp);
            if (utilisateur.equals("admin")) {
                request.getSession().setAttribute("utilisateur", "admin");
              
                redirection = "/ControleurBackOff?action=_accueil";
            } else if (utilisateur.equals("redac")) {
                request.getSession().setAttribute("utilisateur", "redac");
             
                redirection = "/ControleurBackOff?action=_accueil";
            } else {
                redirection = "/index.jsp";
            }
            getServletContext().getRequestDispatcher(redirection).forward(request, response);
        }
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
