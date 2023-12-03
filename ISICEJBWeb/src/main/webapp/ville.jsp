<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Gestion des villes</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
     <style>
        body {
            background-color: #FFF5E0;
            color: #141E46;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-top: 20px;
        }

        .d-flex {
            background-color: #FF6969;
            padding: 10px;
            color: #FFF5E0;
            border-radius: 5px;
        }

        .custom-btn {
            background-color: #FF6969;
            border: none;
            color: #FFF5E0;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }

        .thead-light th {
            background-color: #FF6969;
            color: #FFF5E0;
        }

        .modal-header,
        .modal-footer {
            background-color: #FF6969;
            color: #FFF5E0;
        }

        .btn-danger,
        .btn-secondary {
            background-color: #FF6969;
            color: #141E46;
            border: none;
        }

        .btn-primary {
            background-color: #C70039;
            border: none;
        }

        .btn-primary:hover {
            background-color: #FF6969;
        }

        .custom-modal-label {
            color: #FF6969;
        }

        h1 {
            font-family: 'Impact', sans-serif;
            font-size: 36px;
        }

        .logo {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .table {
            background-color: #FFF5E0; 
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="display-4">
    <img src="https://www.ucd.ac.ma/wp-content/uploads/2017/09/ensaj1.png" alt="Logo" class="logo"> Gestion villes
</h1>
            <a href="index.jsp" class="btn btn-light" style="color: #0766AD;">
                <i class="fas fa-home"></i> Accueil
            </a>
            <a href="hotel.jsp" class="btn btn-light" style="color: #0766AD;">
                <i class="fas fa-hotel"></i> Gestion hotels
            </a>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#VilleModalCenter">
                Ajouter une ville
            </button>
        </div>

        <div class="modal fade" id="VilleModalCenter" tabindex="-1" role="dialog" aria-labelledby="VilleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="VilleModalCenterTitle">Ajouter une ville</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="nom">Nom de la ville</label>
                            <input type="text" name="nom" class="form-control" required><br><br>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom de la ville</th>
                    <th>Supprimer</th>
                    <th>Modifier</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${villes}" var="ville">
                    <tr>
                        <td>${ville.id}</td>
                        <td>${ville.nom}</td>
                        <td class="d-flex align-items-center">
                            <form action="VilleController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${ville.id}">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                            </form>
                            
                        </td>
                        <td>
                        <form>
                        <button type="button" class="btn btn-secondary ml-2" data-toggle="modal" data-target="#ModifyVilleModal" 
                                    data-ville-id="${ville.id}" data-ville-nom="${ville.nom}">
                                Modifier
                            </button>
                            </form>
                            </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="modal fade" id="ModifyVilleModal" tabindex="-1" role="dialog" aria-labelledby="ModifyVilleModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyVilleModalTitle">Modifier une ville</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="nom">Nom de la ville</label>
                            <input type="text" name="nom" class="form-control" id="modalVilleNom" required><br><br>

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalVilleId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer les modifications">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

   <!-- Votre code précédent -->
<script>
        $('#ModifyVilleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var villeId = button.data('ville-id');
            var villeName = button.data('ville-nom');
            var modal = $(this);
            modal.find('#modalVilleName').val(villeName);
            modal.find('#modalVilleId').val(villeId);
        });
    </script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>
   