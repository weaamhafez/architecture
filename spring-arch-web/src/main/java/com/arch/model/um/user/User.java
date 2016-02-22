package com.arch.model.um.user;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;


@Entity
@Table(name = "user")
public class User implements Serializable {

	private static final long serialVersionUID = -7789127033463790740L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true, nullable = false)
    private Integer id;

    @Column(name = "USERNAME", length = 13, nullable = false)
    private String username;

    @Column(name = "NAME", length = 250, nullable = false)
    private String name;

    @Column(name = "EMAIL", length = 255)
    private String email;

    @Column(name = "MOBILE", length = 255)
    private String mobile;


    @Column(name = "PASSWORD", length = 32)
    private String password;


    @Column(name = "ACTIVE", columnDefinition = "BIT", length = 1)
    private Boolean active;

    @Column(name = "CREATE_TIME")
    @CreatedDate
    private Date createTime;

    @Column(name = "VERSION")
    @LastModifiedDate
    private Date version;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Date getVersion() {
        return version;
    }

    public void setVersion(Date version) {
        this.version = version;
    }

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
}
