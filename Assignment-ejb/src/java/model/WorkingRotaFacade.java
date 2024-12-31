/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * 
 */
@Stateless
public class WorkingRotaFacade extends AbstractFacade<WorkingRota> {

    @PersistenceContext(unitName = "Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WorkingRotaFacade() {
        super(WorkingRota.class);
    }
    
    public boolean weekNumberExists(int weekNumber) {
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(wr) FROM WorkingRota wr WHERE wr.weekNumber = :weekNumber", Long.class);
        query.setParameter("weekNumber", weekNumber);
        return query.getSingleResult() > 0;
    }

    public List<WorkingRota> getWeeklyRota() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
