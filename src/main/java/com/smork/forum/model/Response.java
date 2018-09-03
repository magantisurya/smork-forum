/**
 * 
 */
package com.smork.forum.model;

import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * @author Rahil Husain
 *
 */
public class Response {
	int status;
	String message;

	// HttpStatus
	public static final Response SUCCESS = new Response(200, "Success");
	public static final Response SERVER_ERROR = new Response(500, "Server error");
	public static final Response NO_CONTENT = new Response(204, "No data found");
	public static final Response CREATED = new Response(201, "Created");
	public static final Response BAD_REQUEST = new Response(400, "Bad request");
	public static final Response NOT_FOUND = new Response(404, "Not found");
	
	public Response(int status, String message) {
		super();
		this.status = status;
		this.message = message;
	}

	public Response(Object data) {
		super();
		this.data = data;
		this.status = 200;
		this.message = "Success";
	}

	public Response(int status, String message, Object data) {
		super();
		this.status = status;
		this.message = message;
		this.data = data;
	}

	@JsonInclude(Include.NON_NULL)
	Object data;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
