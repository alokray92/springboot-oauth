package com.springboot.oauth.server.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    
    @Column(name = "username")
    private String name;
    
    @Column(name = "password")
    private String password;
    
    @Column(name = "email")
    private String email;

    @Column(name = "enabled")
    private boolean enabled;
   
    @Column(name = "ACCOUNT_EXPIRED")
    private int accountExpired;

    @Column(name = "CREDENTIALS_EXPIRED")
    private int credExpired;
    
    @Column(name = "ACCOUNT_LOCKED")
    private int accountLocked;
    
    @Column(name = "user_id")
    private int userId;
    
    @Column(name = "active")
    private int active;
    
    @Column(name = "last_name")
    private String lastName;

    
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "role_user", 
	joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id") }, 
	inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id") })
	private Set<Role> roles;


    public Users() {
    }




    public Users(Users users) {
		super();
		this.id = users.id;
		this.name = users.name;
		this.password = users.password;
		this.email = users.email;
		this.enabled = users.enabled;
		this.accountExpired = users.accountExpired;
		this.credExpired = users.credExpired;
		this.accountLocked = users.accountLocked;
		this.userId = users.userId;
		this.active = users.active;
		this.lastName = users.lastName;
		this.roles = users.roles;
	}




	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
