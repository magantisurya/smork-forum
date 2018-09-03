/**
 * 
 */
package com.smork.forum.model;

import java.util.Date;

/**
 * @author Rahil Husain
 *
 */
public class Reply {
	private long replyId;
	private long repliedBy;
	private Date creationTime;
	private String content;
	private long topicId;
	private long parentId;

	public long getReplyId() {
		return replyId;
	}

	public void setReplyId(long replyId) {
		this.replyId = replyId;
	}

	public long getRepliedBy() {
		return repliedBy;
	}

	public void setRepliedBy(long repliedBy) {
		this.repliedBy = repliedBy;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getTopicId() {
		return topicId;
	}

	public void setTopicId(long topicId) {
		this.topicId = topicId;
	}

	public long getParentId() {
		return parentId;
	}

	public void setParentId(long parentId) {
		this.parentId = parentId;
	}

}
