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
        <title>newAccount</title>
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
        </div>

        <br> <br> <br> <br>

        <ol>
            <h2>Créer un utilisateur</h2>
        </ol>
        <div class="list-group" style="width: 900px; margin-left: 20%; text-align: center;">
            <form action="ServletUsers" method="POST">
                <div class="form-group">
                    <input type="number" name="balance" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="balance">
                </div>
                <div class="form-group">
                    <input type="text" name="accountNumber" class="form-control" id="exampleInputPassword1" placeholder="AccountNumber">
                </div>
                <div class="form-group">
                    <input type="text" name="firstname" class="form-control" id="exampleInputPassword1" placeholder="firstname">
                </div>
                <div class="form-group">
                    <input type="text" name="lastname" class="form-control" id="exampleInputPassword1" placeholder="lastname">
                </div>


                <button type="submit" name="action" value="creerUnUtilisateur"   class="btn btn-primary">Créer le compte</button>
            </form>
        </div>

    </body>
</html>