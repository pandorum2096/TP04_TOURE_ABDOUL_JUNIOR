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
        creeCompteBancaire(10000, "C001", "SEKE", "YED");
        creeCompteBancaire(100, "E002", "KOUDIO", "ABEL");
        creeCompteBancaire(4000, "X003", "ASSI", "MAUREL");
        creeCompteBancaire(0, "P004", "KARIMOU", "YANNICK");
    }
//final double balance, final String accountNumber, final String lastname, final String firstname

    public CompteBancaire creeCompteBancaire(double balance, String accountNumber, String firstname, String lastname) {
        CompteBancaire u = new CompteBancaire(balance, accountNumber, firstname, lastname);
        em.persist(u);
        return u;
    }
      

    public Collection<CompteBancaire> getAllCompteBancaire() {
        // Exécution d'une requête équivalente à un select *
        Query q = em.createQuery("select u from CompteBancaire u");
        return q.getResultList();
    }

    

}
