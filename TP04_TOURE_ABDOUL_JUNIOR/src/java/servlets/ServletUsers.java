/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import CompteBancaire.gestionnaires.GestionnaireCompteBancaire;
import CompteBancaire.modeles.CompteBancaire;
import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "ServletUsers", urlPatterns = {"/ServletUsers"})
public class ServletUsers extends HttpServlet {

    @EJB
    private GestionnaireCompteBancaire gestionnaireCompteBancaire;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Pratique pour décider de l'action à faire
        String action = request.getParameter("action");
        String forwardTo = "";
        String message = "";

        if (action != null) {
            switch (action) {
                case "listerLesUtilisateurs": {
                    Collection<CompteBancaire> liste = gestionnaireCompteBancaire.getAllCompteBancaire();
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "listAccount.jsp?action=listerLesUtilisateurs";
                    message = "Liste des comptes bancaires";
                    break;
                }
                case "creerCompteBancaireDeTest": {
                    gestionnaireCompteBancaire.creerCompteBancaireDeTest();
                    Collection<CompteBancaire> liste = gestionnaireCompteBancaire.getAllCompteBancaire();
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "listAccount.jsp?action=listerLesUtilisateurs";
                    message = "Liste des comptes bancaires apres 4 ajouts de test";
                    break;
                }
                case "creerUnUtilisateur": {
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String balance = request.getParameter("balance");
                    String accountNumber = request.getParameter("accountNumber");
                    gestionnaireCompteBancaire.creeCompteBancaire(Double.parseDouble(balance), accountNumber, firstname, lastname);
                    Collection<CompteBancaire> liste = gestionnaireCompteBancaire.getAllCompteBancaire();
                    request.setAttribute("listeDesUsers", liste);
                    forwardTo = "listAccount.jsp?action=listerLesUtilisateurs";
                    message = "un utilisateur est créé";
                    break;
                }
                default:
                    forwardTo = "listAccount.jsp?action=listerLesUtilisateurs";
                    message = "La fonctionnalité pour le paramètre " + action + " est à implémenter !";
                    break;
            }
        }

        RequestDispatcher dp = request.getRequestDispatcher(forwardTo + "&message=" + message);
        dp.forward(request, response);
        // Après un forward, plus rien ne peut être exécuté après !
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
