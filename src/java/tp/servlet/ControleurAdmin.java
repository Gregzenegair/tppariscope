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
            String page = request.getParameter("page");
            CRUD modifUtilisateur = new CRUD("pariscope");
            switch (page) {
                case "_modifRedac":
                    ResultSet rsUtilisateurs = modifUtilisateur.selectAll("redacteurs");
                    request.setAttribute("tout_utilisateurs", rsUtilisateurs);
                    break;
                case "_modifUnRedac":
                    if (request.getParameter("id") != null) {
                        String[] lasUtilisateur = {"*"};
                        ResultSet rsRedacteur = modifUtilisateur.selectWhere("redacteurs", lasUtilisateur, CRUD.genCondition("id_redacteur", request.getParameter("id")));
                        request.setAttribute("un_utilisateur", rsRedacteur);
                    }

            }
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
            CRUD connexion = new CRUD("pariscope");
            switch (action) {
                case "insereRedac":
                    String login = request.getParameter("login");
                    String mdp = request.getParameter("mdp");
                    String[] checked = request.getParameterValues("admin");
                    int admin;
                    if (checked != null) {
                        admin = 1;
                    } else {
                        admin = 0;
                    }
                    //on insère dans la bdd 

                    connexion.insertInto("redacteurs",
                            CRUD.genInsert("3", "login", "mdp", "administrateur", login, mdp, Integer.toString(admin)));
                    connexion.deco();
                    request.setAttribute("insertOK", "Utilisateur enregistré !");
                    request.setAttribute("inclusion", "_insereRedac.jsp");
                    break;

                case "suppUtilisateur":

                    ResultSet rsUtilisateurs = connexion.selectAll("redacteurs");
                    request.setAttribute("tout_utilisateurs", rsUtilisateurs);
                    // on prépare un attribut qui affichera un nouveau bouton pour confirmer la suppression
                    String valideSuppression = "Etes vous sûr de vouloir supprimer <em>" + request.getParameter("name") + "</em> de la liste ? "
                            + "<form action=\"/tppariscope/ControleurAdmin\" method=\"post\">"
                            + "<input type=\"hidden\" name=\"action\" value=\"suppValider\" />"
                            + "<input type=\"hidden\" name=\"name\" value=\"" + request.getParameter("name") + "\" />"
                            + "<input type=\"submit\" value=\"Valider Suppression\"/></form>"
                            + "<form action=\"/tppariscope/ControleurAdmin\" method=\"post\">"
                            + "<input type=\"hidden\" name=\"page\" value=\"_modifRedac\" />"
                            + "<input type=\"submit\" value=\"Annuler\"/>"
                            + "</form>";
                    request.setAttribute("suppOK", valideSuppression);
                    request.setAttribute("inclusion", "_modifRedac.jsp");
                    break;
                case "suppValider":
                    // on fait la requete de suppression
                    String nomSuppression = request.getParameter("name");
                    connexion.deleteWhere("redacteurs", CRUD.genCondition("login", nomSuppression));
                    // on réaffiche le contenu
                    ResultSet rsModifRedac = connexion.selectAll("redacteurs");
                    request.setAttribute("tout_utilisateurs", rsModifRedac);
                    request.setAttribute("suppOK", "Suppression validée.");
                    ;
                    request.setAttribute("inclusion", "_modifRedac.jsp");
                    break;

                case "modifRedac":
                    String loginUp = request.getParameter("login");
                    String mdpUp = request.getParameter("mdp");
                    String[] checkedUp = request.getParameterValues("admin");
                    String id = request.getParameter("idmodif");
                    int adminUp;
                    if (checkedUp != null) {
                        adminUp = 1;
                    } else {
                        adminUp = 0;
                    }
                    //on update dans la bdd 
                    connexion.updateWhere("redacteurs",
                            CRUD.genCondition("login", loginUp, "mdp", mdpUp, "administrateur", Integer.toString(adminUp)),
                            CRUD.genCondition("id_redacteur", id));

                    request.setAttribute("updateOK", "Utilisateur modifié !");
                    ResultSet rsUtilisateur = connexion.selectAll("redacteurs");
                    request.setAttribute("tout_utilisateurs", rsUtilisateur);
                    request.setAttribute("inclusion", "_modifRedac.jsp");


                case "supprimerValider":
                    String idValSup = request.getParameter("id");
                    CRUD deleteArticle = new CRUD("pariscope");
                    deleteArticle.deleteWhere("concerts",
                            CRUD.genCondition("id_concert", idValSup));

                    ResultSet lrs = deleteArticle.selectAllCCAnnuler();
                    request.setAttribute("resultset", lrs);
                    request.setAttribute("inclusion", "_validerSupp.jsp");
                    break;

                case "supprimerAnnuler":
                    String idAnulSup = request.getParameter("id");
                    CRUD supprimerAnnuler = new CRUD("pariscope");
                    supprimerAnnuler.updateWhere("concerts",
                            CRUD.genCondition(
                            "demande_sup", "0"),
                            CRUD.genCondition("id_concert", idAnulSup));

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
