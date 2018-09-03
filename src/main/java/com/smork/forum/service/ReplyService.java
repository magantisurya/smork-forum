/**
 * 
 */
package com.smork.forum.service;

import com.smork.forum.model.Reply;
import com.smork.forum.model.Response;

/**
 * @author Rahil Husain
 *
 */
public interface ReplyService {
	Response getReplies(long topicId);

	Response addReply(Reply reply);

	Response deleteReply(long replyId);
}
