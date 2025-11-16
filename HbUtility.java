package com.incapp;


import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import com.incapp.entity.Product;
import com.incapp.entity.User;

public class HbUtility {
	public static SessionFactory getSessionFactory() {
		Configuration cfg=new Configuration();
	       
        Properties p=new Properties();
        p.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
		p.put(Environment.URL, "jdbc:mysql://localhost:3306/userapp");
		p.put(Environment.USER, "root");
		p.put(Environment.PASS, "Incapp@12");
		p.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
		p.put(Environment.HBM2DDL_AUTO, "update");
        
		cfg.setProperties(p);
        cfg.addAnnotatedClass(Product.class); 
        cfg.addAnnotatedClass(User.class); 
        return cfg.buildSessionFactory();
	}
}
