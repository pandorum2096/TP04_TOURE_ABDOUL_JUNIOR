<%--
    Document   : index
    Created on : 16 sept. 2009, 16:54:32
    Author     : michel buffa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionnaire des comptes bancaires</title>
    </head>
    <body>
        <h1>Gestionnaire des comptes bancaires</h1>


        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
        <c:if test="${!empty param['message']}">
            <h2>Reçu message : ${param.message}</h2>
        </c:if>


        <h2>Menu de Gestion des comptes bancaires</h2>
        <ul>
             <li><a href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a></li>
            
            <li><a href="ServletUsers?action=creerCompteBancaireDeTest">Créer 4 utilisateurs de test</a></li>
            
            <li><a href="listAccount.jsp">voir la page de listage d'un compte bancaire</a></li>
        </ul>
           
        <ol>
            <li>Créer un utilisateur</li>
            <form action="ServletUsers" method="get">
                
                Balance : <input type="text" name="balance"/><br>
                AccountNumber : <input type="text" name="accountNumber"/><br>
                Nom : <input type="text" name="firstname"/><br>
                Prénom : <input type="text" name="lastname"/><br>
                
                
                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                <input type="hidden" name="action" value="creerUnUtilisateur"/>
                <input type="submit" value="Créer l'utilisateur" name="submit"/>
            </form>
        </ol>

        <!-- Fin du menu -->

        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
       
            <h2>Lister tous les comptes bancaires</h2>

            <table border="10">
                <!-- La ligne de titre du tableau des comptes -->
                <tr>
                    <td><b>balance</b></td>
                    <td><b>accountNumber</b></td>
                    <td><b>Nom</b></td>
                    <td><b>Prénom</b></td>
                </tr>

                <!-- Ici on affiche les lignes, une par utilisateur -->
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                <c:set var="total" value="0"/>

                <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                    <tr>
                        <td>${u.balance}</td>
                        <td>${u.accountNumber}</td>
                        <td>${u.firstname}</td>
                        <td>${u.lastname}</td>
                        <!-- On compte le nombre de users -->
                        <c:set var="total" value="${total+1}"/>
                    </tr>
                </c:forEach>

                <!-- Affichage du solde total dans la dernière ligne du tableau -->
                <tr><td><b>TOTAL</b></td><td></td><td><b></b></td><td>${total}</td></tr>
            </table>
    </body>
</html>