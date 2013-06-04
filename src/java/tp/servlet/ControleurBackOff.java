/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.Session;
import tp.dao.CRUD;

/**
 *
 * @author Cyrius
 */
public class ControleurBackOff extends HttpServlet {

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
        //le switch principal en cas d'actions
        String lsNomPageInclusion = new String();

        if (request.getParameter("action") != null) {

            lsNomPageInclusion = request.getParameter("action") + ".jsp";
            request.setAttribute("inclusion", lsNomPageInclusion);
        }

        if (request.getParameter("action").equals("_accueil")) {
            CRUD crud = new CRUD("pariscope");
            ResultSet lrs = crud.selectAll("concerts");
            request.setAttribute("resultset", lrs);
        }
        if (request.getParameter("action").equals("_inserer") && request.getParameter("id") != null) {
            request.setAttribute("id", request.getParameter("id"));
        }
        if (request.getParameter("action").equals("_insererValidation")) {
            CRUD crud = new CRUD("pariscope");
            crud.insertInto("concerts",
                    CRUD.genInsert("7",
                    "id_categorie", "titre", "date", "lieu", "prix", "description", "lien_reservation",
                    request.getParameter("categorie").toString(),
                    request.getParameter("titre").toString(),
                    request.getParameter("date").toString(),
                    request.getParameter("lieu").toString(),
                    request.getParameter("prix").toString(),
                    request.getParameter("description").toString(),
                    request.getParameter("lien").toString()));
            lsNomPageInclusion = "_inserer.jsp";
        }
        
        if (request.getParameter("action").equals("_modifierValidation")) {
            CRUD crud = new CRUD("pariscope");
            crud.updateWhere("concerts",
                    CRUD.genCondition(
                    "id_categorie",request.getParameter("categorie").toString(),
                    "titre",request.getParameter("titre").toString(),
                    "date",request.getParameter("date").toString(),
                    "lieu",request.getParameter("lieu").toString(),
                    "prix",request.getParameter("prix").toString(),
                    "description",request.getParameter("description").toString(),
                    "lien_reservation",request.getParameter("lien").toString()),
                    CRUD.genCondition("id",request.getParameter("id"))
                    );
                    
            lsNomPageInclusion = "_accueil.jsp";
        }

        getServletContext().getRequestDispatcher("/jsp_back/BackOff.jsp").forward(request, response);// là il renverra : http://WebAppJSP/jsp/_modeleBIS.jsp?contenu=Fragment(nom de l'action).jsp

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
