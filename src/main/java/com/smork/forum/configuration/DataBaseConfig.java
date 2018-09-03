/**
 * 
 */
package com.smork.forum.configuration;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 * @author Rahil Husain
 *
 */
@Configuration
public class DataBaseConfig {

	@Bean
	DataSource getDataSource() {
		DriverManagerDataSource ds = new DriverManagerDataSource("jdbc:mysql://localhost:3306/smork_forum", "root",
				"root");
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		return ds;
	}
	@Bean 
	JdbcTemplate getJdbcTemplate() {
		return new JdbcTemplate(getDataSource());
	}
}
