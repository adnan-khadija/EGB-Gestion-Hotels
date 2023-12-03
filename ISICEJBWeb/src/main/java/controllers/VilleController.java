package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import entities.Ville;

import java.io.IOException;
import java.util.List;

import dao.VilleLocale;

@WebServlet("/VilleController")
public class VilleController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    VilleLocale villeLocal;

    public VilleController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ville> villes = villeLocal.findAll();
        request.setAttribute("villes", villes);
        request.getRequestDispatcher("/ville.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
            
        if ("delete".equals(action)) {
            // Suppression d'une ville existante
            int villeId = Integer.parseInt(request.getParameter("id"));
            Ville villeToDelete = villeLocal.findById(villeId);
            if (villeToDelete != null) {
                villeLocal.delete(villeToDelete);
            }
        } else if ("edit".equals(action)) {
            // Modification d'une ville existante
            int villeId = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            Ville villeToUpdate = villeLocal.findById(villeId);
            if (villeToUpdate != null) {
                villeToUpdate.setNom(nom);
                villeLocal.update(villeToUpdate);
            }
        } else {
            // Ajout d'une nouvelle ville
            String nom = request.getParameter("nom");
            Ville nouvelleVille = new Ville(nom);
            villeLocal.create(nouvelleVille);
        }

        // Redirection vers la page principale des villes après l'action effectuée
        response.sendRedirect(request.getContextPath() + "/VilleController");
    }

}
