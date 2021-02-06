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
        <title>listAccount</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body style="text-align: center;">

        <div class="alert alert-success" role="alert">
            <h1>Gestionnaire des comptes bancaires</h1>
        </div>




        <div class="list-group" style="width: 900px; margin-left: 20%;">
            <a href="#" class="list-group-item list-group-item-action active">
                <h3>Menu de gestion des comptes bancaires</h1>
            </a>
            <a href="ServletUsers?action=listerLesUtilisateurs" class="list-group-item list-group-item-action">Afficher/raffraichir la liste de tous les comptes bancaires</a>
            <a href="ServletUsers?action=creerCompteBancaireDeTest" class="list-group-item list-group-item-action">Créer 4 utilisateurs de test</a>
            <a href="newAccount.jsp" class="list-group-item list-group-item-action">voir la page de creation d'un compte bancaire</a>
        </div>
        <!-- Fin du menu -->

        <table border="10" style="text-align: center; margin-left: 20%; margin-top: 10%; width: 900px">
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

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>