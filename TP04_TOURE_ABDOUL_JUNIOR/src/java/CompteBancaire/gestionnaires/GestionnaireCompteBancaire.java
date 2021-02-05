/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CompteBancaire.gestionnaires;

import CompteBancaire.modeles.CompteBancaire;
import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author HP
 */
@Stateless
public class GestionnaireCompteBancaire {

    // Ici injection de code : on n'initialise pas. L'entity manager sera créé
    // à partir du contenu de persistence.xml
    @PersistenceContext
    private EntityManager em;

    public void creerCompteBancaireDeTest() {
        creeCompteBancaire("John", "Lennon", "0001", 1111);
        creeCompteBancaire("Paul", "Mac Cartney", "0002", 2222);
        creeCompteBancaire("Ringo", "Starr", "0003", 3333);
        creeCompteBancaire("Georges", "Harisson", "0004", 4444);
    }

    public CompteBancaire creeCompteBancaire(String nom, String prenom, String accountNumber, double balance) {
        CompteBancaire u = new CompteBancaire( nom,  prenom, accountNumber,  balance);
        em.persist(u);
        return u;
    }

    public Collection<CompteBancaire> getAllUsers() {
        // Exécution d'une requête équivalente à un select *
        Query q = em.createQuery("select u from CompteBancaire u");
        return q.getResultList();
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
