/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * 
 */
@Entity
public class Pets implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    
    @ManyToOne
    @JoinColumn(name = "owner_id")
    private Customers owner;
    
    @OneToMany(mappedBy = "pet")
    private List<Diagnosis> diagnoses;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Customers getOwner() {
        return owner;
    }

    public void setOwner(Customers owner) {
        this.owner = owner;
    }

    public Pets() {
    }

    public Pets(String id, Customers owner) {
        this.id = id;
        this.owner = owner;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pets)) {
            return false;
        }
        Pets other = (Pets) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Pets[ id=" + id + " ]";
    }
    
}
