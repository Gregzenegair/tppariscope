/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Classe CRUD qui gère plusieurs requêtes SQL préparés
 *
 * @author Chris
 */
public class CRUD {
    /*
     * Fields
     */

    private Connection connexion = null;
    private Statement instruction = null;
    /*
     * Constructeur vide qui se connectera seulement à la base de donnée
     */

    public CRUD() {
        try {
            // la classe du pilote avec Class.forName
            Class.forName("org.gjt.mm.mysql.Driver");
            //la connexion avec DriverManager.getConnection
            this.connexion = DriverManager.getConnection("jdbc:mysql://192.168.1.133:3306/", "root", "");
            /*
             * on ouvre le curseur et on le définie dans l'objet et on le fermera avec deco()
             * objet statement qui va permettre les instruction/commande
             * ne se créée qu'à partir de la méthode createStatement de Connection
             */
            this.instruction = this.connexion.createStatement();
            //pour le teste on affiche dans la console si l'opération à réussie
            System.out.println("Vous êtes connecté .");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// Constructeur 0 param

    /*
     * Constructeur qui prendra en paramêtre le nom de la base au minimum
     */
    public CRUD(String sNomBase) {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            this.connexion = DriverManager.getConnection("jdbc:mysql://192.168.1.133:3306/" + sNomBase, "root", "");
            this.instruction = this.connexion.createStatement();
            //pour le teste on affiche dans la console si l'opération à réussie
            System.out.println("Vous êtes connecté sur la base de donnée: " + sNomBase + ".");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// Constructeur 1 param

    //------------------------------------------------------------------------------------------------------------------

    /*
     * SELECT *
     */
    public ResultSet selectAll(String sNomTable) {
        ResultSet lrsCurseur = null;
        try {
            lrsCurseur = this.instruction.executeQuery("SELECT * FROM " + sNomTable);
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT *

    public ResultSet selectAllASC(String sNomTable, String sColonneTrie) {
        ResultSet lrsCurseur = null;
        try {
            lrsCurseur = this.instruction.executeQuery("SELECT ca.id_categorie, ca.categorie, co.titre, co.date_concert, co.id_lieu, co.prix, co.id_concert, co.demande_sup, li.nom FROM concerts co JOIN categories ca JOIN lieux li WHERE co.id_categorie = ca.id_categorie and co.id_lieu = li.id_lieu and date_concert > now() ORDER BY " + sColonneTrie + " ASC");
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT *

    public ResultSet selectAllDESC(String sNomTable, String sColonneTrie) {
        ResultSet lrsCurseur = null;
        try {
            lrsCurseur = this.instruction.executeQuery("SELECT ca.id_categorie, ca.categorie, co.titre, co.date_concert, co.id_lieu, co.prix, co.id_concert, co.demande_sup, li.nom FROM concerts co JOIN categories ca JOIN lieux li WHERE co.id_categorie = ca.id_categorie and co.id_lieu = li.id_lieu and date_concert > now() ORDER BY " + sColonneTrie + " DESC");
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT *

    public ResultSet selectAllCC() {
        ResultSet lrsCurseur = null;
        try {
            // SELECT villes.nom_ville, clients.nom FROM villes JOIN clients ON villes.cp = clients.cp;
            lrsCurseur = this.instruction.executeQuery("SELECT ca.id_categorie, ca.categorie, co.titre, co.date_concert, co.id_lieu, co.prix, co.id_concert, co.demande_sup, li.nom FROM concerts co JOIN categories ca JOIN lieux li WHERE co.id_categorie = ca.id_categorie and co.id_lieu = li.id_lieu and date_concert > now()");
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT *

    public ResultSet selectAllCCAnnuler() {
        ResultSet lrsCurseur = null;
        try {
            // SELECT villes.nom_ville, clients.nom FROM villes JOIN clients ON villes.cp = clients.cp;
            lrsCurseur = this.instruction.executeQuery("SELECT ca.id_categorie, ca.categorie, co.titre, co.date_concert, co.id_lieu, co.prix, co.id_concert, co.demande_sup FROM concerts co JOIN categories ca WHERE co.id_categorie = ca.id_categorie and co.demande_sup<>0");
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT *

    public ResultSet selectRechercher(String recherche) {
        ResultSet lrsCurseur = null;
        try {
            // SELECT villes.nom_ville, clients.nom FROM villes JOIN clients ON villes.cp = clients.cp;
            String requete="SELECT ca.id_categorie , ca.categorie , co.titre , co.date_concert , co.id_lieu , co.prix , ca.categorie , co.demande_sup"
                    + " FROM concerts co JOIN categories ca JOIN lieux li"
                    + " WHERE co.id_categorie = ca.id_categorie"
                    + " AND li.id_lieu = co.id_lieu"
                    + " AND(co.titre like '%"+recherche+"%'"
                    + " OR  li.adresse like'%"+recherche+"%'"
                    + " OR ca.categorie like '%"+recherche+"%'"
                    + " OR co.description like '%"+recherche+"%'"
                    + ")";
            lrsCurseur = this.instruction.executeQuery(requete);
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT *

    /*
     * SELECT colonne FROM table récupère les colonnes séléctionné
     */
    public ResultSet selectFrom(String sNomTable, String[] sNomCol) {
        ResultSet lrsCurseur = null;
        StringBuilder sbRequete = new StringBuilder("SELECT ");
        for (int i = 0; i < sNomCol.length; i++) {
            sbRequete.append(sNomCol[i]);
            if (i == sNomCol.length - 1) {
                break;
            }
            sbRequete.append(" , ");
        }// For
        sbRequete.append(" FROM ");
        sbRequete.append(sNomTable);
        try {
            lrsCurseur = this.instruction.executeQuery(sbRequete.toString());
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT colonne FROM table

    /*
     * SELECT colonne FROM table WHERE récupère les colonnes séléctionné
     */
    public ResultSet selectWhere(String sNomTable, String[] sNomCol, ArrayList<String[]> sCondition) {
        ResultSet lrsCurseur = null;
        StringBuilder sbRequete = new StringBuilder("SELECT ");
        for (int i = 0; i < sNomCol.length; i++) {
            sbRequete.append(sNomCol[i]);
            if (i == sNomCol.length - 1) {
                break;
            }
            sbRequete.append(" , ");
        }// For
        sbRequete.append(" FROM ");
        sbRequete.append(sNomTable);
        sbRequete.append(" WHERE ");
        //insertion des conditions
        for (int i = 0; i < sCondition.size(); i++) {
            // on récupere le tableau clé valeur
            String[] tsCondition = sCondition.get(i);
            //on boucle le contenu du tableau et on l'append au stringbuilder
            sbRequete.append(tsCondition[0]);
            sbRequete.append(" = ");
            sbRequete.append(tsCondition[1]);
            if (i == sCondition.size() - 1) {
                break;
            }
            sbRequete.append(" AND ");
        }// For
        // test affichage requete
        System.out.println(sbRequete.toString());
        try {
            lrsCurseur = this.instruction.executeQuery(sbRequete.toString());
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT colonne FROM table WHERE condition AND condition.....

    public ResultSet selectWhereOr(String sNomTable, String[] sNomCol, ArrayList<String[]> sCondition) {
        ResultSet lrsCurseur = null;
        StringBuilder sbRequete = new StringBuilder("SELECT ");
        for (int i = 0; i < sNomCol.length; i++) {
            sbRequete.append(sNomCol[i]);
            if (i == sNomCol.length - 1) {
                break;
            }
            sbRequete.append(" , ");
        }// For
        sbRequete.append(" FROM ");
        sbRequete.append(sNomTable);
        sbRequete.append(" WHERE ");
        //insertion des conditions
        for (int i = 0; i < sCondition.size(); i++) {
            // on récupere le tableau clé valeur
            String[] tsCondition = sCondition.get(i);
            //on boucle le contenu du tableau et on l'append au stringbuilder
            sbRequete.append(tsCondition[0]);
            sbRequete.append(" = ");
            sbRequete.append(tsCondition[1]);
            if (i == sCondition.size() - 1) {
                break;
            }
            sbRequete.append(" OR ");
        }// For
        // test affichage requete
        System.out.println(sbRequete.toString());
        try {
            lrsCurseur = this.instruction.executeQuery(sbRequete.toString());
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lrsCurseur;
    }/// SELECT colonne FROM table WHERE condition AND condition.....

    /*
     * USE
     */
    public void useDataBase(String sNomBase) {
        try {
            this.instruction.executeQuery("USE " + sNomBase);
            //message de validité
            System.out.println("Vous êtes connecté à la base de donnée  " + sNomBase);
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// USE

    /*
     * UPDATE nom table SET col 1 = valeur, etc.... WHERE condition;
     * fonctionnera avec deux arraylist générés
     */
    public void updateWhere(String sNomTable, ArrayList<String[]> sValeur, ArrayList<String[]> sCondition) {
        StringBuilder sbRequete = new StringBuilder("UPDATE ");
        sbRequete.append(sNomTable);
        sbRequete.append(" SET ");
        //insertion des valeurs
        for (int i = 0; i < sValeur.size(); i++) {
            // on récupere le tableau clé valeur
            String[] tsCondition = sValeur.get(i);
            //on boucle le contenu du tableau et on l'append au stringbuilder
            sbRequete.append(tsCondition[0]);
            sbRequete.append(" = ");
            sbRequete.append(tsCondition[1]);
            if (i == sValeur.size() - 1) {
                break;
            }
            sbRequete.append(" , ");
        }// For
        sbRequete.append(" WHERE ");
        //insertion des conditions
        for (int i = 0; i < sCondition.size(); i++) {
            // on récupere le tableau clé valeur
            String[] tsCondition = sCondition.get(i);
            //on boucle le contenu du tableau et on l'append au stringbuilder
            sbRequete.append(tsCondition[0]);
            sbRequete.append(" = ");
            sbRequete.append(tsCondition[1]);
            if (i == sCondition.size() - 1) {
                break;
            }
            sbRequete.append(" AND ");
        }// For
        // test affichage requete
        System.out.println(sbRequete.toString());
        try {
            this.instruction.executeUpdate(sbRequete.toString());
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// UPDATE 

    /*
     * DELETE FROM table WHERE condition
     * fonctionne avec le generateur de condition genCondition
     */
    public void deleteWhere(String sNomTable, ArrayList<String[]> sCondition) {
        StringBuilder sbRequete = new StringBuilder("DELETE FROM ");
        sbRequete.append(sNomTable);
        sbRequete.append(" WHERE ");
        //insertion des conditions
        for (int i = 0; i < sCondition.size(); i++) {
            // on récupere le tableau clé valeur
            String[] tsCondition = sCondition.get(i);
            //on boucle le contenu du tableau et on l'append au stringbuilder
            sbRequete.append(tsCondition[0]);
            sbRequete.append(" = ");
            sbRequete.append(tsCondition[1]);
            if (i == sCondition.size() - 1) {
                break;
            }
            sbRequete.append(" AND ");
        }// For
        // test affichage requete
        System.out.println(sbRequete.toString());
        try {
            this.instruction.executeUpdate(sbRequete.toString());
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// DELETE FROM table WHERE condition AND condition.....

    /*
     * INSERT pareil que select from where avec arraylist<String[nombre arguments en fonction de la modif]>
     * la methode renvoie erreur si l'arraylist n est pas pair, création d'un générateur d'arguments
     */
    public void insertInto(String sNomTable, ArrayList<String[]> alInsert) {
        try {
            StringBuilder sbRequeteInsert = new StringBuilder("INSERT INTO ");
            sbRequeteInsert.append(sNomTable);
            sbRequeteInsert.append(" (");
            String[] asCol = alInsert.get(0);
            for (int col = 0; col <= asCol.length; col++) {
                sbRequeteInsert.append(asCol[col]);
                if (col == asCol.length - 1) {
                    sbRequeteInsert.append(" ) VALUES ");
                    break;
                } else {
                    sbRequeteInsert.append(" , ");
                }
            }//for
            int iNombreLigne = alInsert.size() - 1;
            for (int ligne = 0; ligne <= iNombreLigne; ligne++) {
                sbRequeteInsert.append(" ( ");
                for (int col = 0; col <= asCol.length; col++) {
                    sbRequeteInsert.append(" ? ");
                    if (col == asCol.length - 1) {
                        break;
                    } else {
                        sbRequeteInsert.append(" , ");
                    }
                }//for col
                sbRequeteInsert.append(" ) ");
                if (ligne == iNombreLigne - 1) {
                    break;
                } else {
                    sbRequeteInsert.append(" , ");
                }
            }//for lignes
            System.out.println(sbRequeteInsert.toString());
            //--------------------------------------------------- requête préparé terminée
            PreparedStatement psPrepareInsert = this.connexion.prepareStatement(sbRequeteInsert.toString());
            // on va boucler un set string ( i , 
            for (int ligne = 1, compteur = 1; ligne < alInsert.size(); ligne++) {
                String[] asInsert = alInsert.get(ligne);
                for (int elem = 0; elem < asInsert.length; elem++) {
                    psPrepareInsert.setString(compteur, asInsert[elem]);
                    compteur++;
                }//for
            }//for
            psPrepareInsert.executeUpdate();
        } ///insertTable
        catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }///insertInto

    /*
     * CREATE DATABASE
     */
    public void createDataBase(String sNomBase) {
        try {
            this.instruction.executeUpdate("CREATE DATABASE IF NOT EXISTS " + sNomBase);
            this.instruction.executeQuery("USE " + sNomBase);
            //message de validité
            System.out.println("La base de donnée " + sNomBase + " à bien été créée.");
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// CREATE DATABASE

    //------------------------------------------------------------------------------------------------------------------
     /*
     * Check Utilisateur, prend en param le nom de la table a rechercher, et les deux valeurs à vérifier
     * parametre: nom de la table, intitulés a vérifier dans la bdd, les deux éléments à vérifier
     * select login, mdp from redacteurs where login='chris' and mdp='azerty';

     */
    public String checkUtilisateur(String sNomTable,
            String sIntitul1, String sIntitul2, String sLogin, String sPassword) {
        String utilisateur = "";
        String[] lasColonnes = {"*"};
        try {
            ResultSet lrsCurseur = this.selectWhere(sNomTable, lasColonnes, CRUD.genCondition(sIntitul1, sLogin, sIntitul2, sPassword));
            if (lrsCurseur.next()) {
                int rang = lrsCurseur.getInt(4);
                if (rang == 0) {
                    utilisateur = "redac";
                } else {
                    utilisateur = "admin";
                }
            } else {
                utilisateur = null;
            }
        } /// checkUtilisateur
        catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return utilisateur;
    }/// checkUtilisateur

    /*
     * genCondition méthode outils qui permet d'envoyer plus facilement un arraylist
     * pour la méthode selectWhere
     */
    public static ArrayList<String[]> genCondition(String... sElements) {
        // il faut que les éléments soient en nombre pair
        ArrayList<String[]> alCondition = new ArrayList<>();
        if (sElements.length % 2 == 0) {
            for (int i = 0; i < sElements.length; i++) {
                String[] condition = new String[2];
                if (sElements[i] == "") {
                    sElements[i] = null;
                }
                condition[0] = sElements[i];
                i++;
                //formate la valeur en ajoutant ' ' autour de la valeur, sinon erreur requete
                String valeur = "'" + sElements[i] + "'";
                condition[1] = valeur;
                alCondition.add(condition);
            }
        } else {
            System.out.println("Il faut inserer des élément par nombre pair !");
        }
        return alCondition;
    }///genCondition

    /*
     * genInsertion méthode outils qui permet d'envoyer plus facilement un arraylist
     * pour la méthode insert plusieurs valeurs à la fois l'array string condition sera remplacé par
     * valeur, et il sera dynamique en fonction du nombre d'arguments
     */
    public static ArrayList<String[]> genInsert(String... sElements) {
        int iNombreCol = Integer.parseInt(sElements[0]);
        int iNombreLigne = (sElements.length - 1) / iNombreCol;
        ArrayList<String[]> alInsert = new ArrayList<>();
        if ((sElements.length - 1) % iNombreCol == 0) {
            for (int ligne = 0, element = 1; ligne < iNombreLigne; ligne++) {
                String[] insert = new String[iNombreCol];
                for (int col = 0; col < iNombreCol; col++) {
                    if (sElements[element] == "") {
                        sElements[element] = null;
                    }
                    insert[col] = sElements[element];
                    element++;
                }//for col
                alInsert.add(insert);
            }//for ligne
        } else {
            System.out.println("Il faut insérer le premier élément avec un int d'un chiffre indiquant le nombre");
            System.out.println("de colonnes à traiter. Puis inserer les valeurs en fonction de cet ordre.");
        }//if
        return alInsert;
    }///genInsertion

    /*
     * Déconnexion du curseur
     */
    public void deco() {
        try {
            this.instruction.close();
            this.connexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(CRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }/// Deco
}/// CRUD Class
