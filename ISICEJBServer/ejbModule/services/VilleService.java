package services;

import java.util.List;
import dao.IDaoLocale;
import dao.IDaoRemote;
import dao.VilleLocale;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@Stateless(name = "kenza")
public class VilleService implements VilleLocale, IDaoRemote<Ville> {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	@PermitAll
	public Ville create(Ville o) {
		em.persist(o);
		return o;
	}

	@Override
	@PermitAll
	public boolean delete(Ville o) {
	    try {
	        em.remove(em.contains(o) ? o : em.merge(o));
	        return true;
	    } catch (Exception ex) {
	        // G�rer l'exception ici
	        ex.printStackTrace();
	        return false;
	    }
	}
	@Override
	@PermitAll
	public Ville update(Ville o) {
		Ville updatedVille=em.merge(o);
		
		return updatedVille;
	}

	@Override
	@PermitAll
	public Ville findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Ville.class, id);
	}

	@Override
	@PermitAll
	public List<Ville> findAll() {
		Query query = em.createQuery("select v from Ville v");
		return query.getResultList();
	}

}
