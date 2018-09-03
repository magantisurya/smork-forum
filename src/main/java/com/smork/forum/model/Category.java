/**
 * 
 */
package com.smork.forum.model;

import java.util.Date;

/**
 * @author Rahil Husain
 *
 */
public class Category {
	private long categoryId;
	private String categoryName;
	private String description;
	private long createdBy;
	private Date creationTime;
	private long topicsPerMonth;

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public long getTopicsPerMonth() {
		return topicsPerMonth;
	}

	public void setTopicsPerMonth(long topicsPerMonth) {
		this.topicsPerMonth = topicsPerMonth;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", description=" + description
				+ ", createdBy=" + createdBy + ", creationTime=" + creationTime + ", topicsPerMonth=" + topicsPerMonth
				+ "]";
	}

}
