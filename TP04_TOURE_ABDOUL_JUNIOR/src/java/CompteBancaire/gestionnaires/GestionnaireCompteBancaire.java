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
        creeCompteBancaire(10000, "X001", "Lennon", "John");
        creeCompteBancaire(100, "X002", "Mac Cartney", "Paul");
        creeCompteBancaire(4000, "X003", "Starr", "Ringo");
        creeCompteBancaire(0, "X004", "Harisson", "Georges");
    }
//final double balance, final String accountNumber, final String lastname, final String firstname

    public CompteBancaire creeCompteBancaire(double balance, String accountNumber, String lastname, String firstname) {
        CompteBancaire u = new CompteBancaire(balance, accountNumber, lastname, firstname);
        em.persist(u);
        return u;
    }
      

    public Collection<CompteBancaire> getAllCompteBancaire() {
        // Exécution d'une requête équivalente à un select *
        Query q = em.createQuery("select u from CompteBancaire u");
        return q.getResultList();
    }

    

}
