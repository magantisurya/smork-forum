/**
 * 
 */
package com.smork.forum.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.smork.forum.dao.ReplyDao;
import com.smork.forum.model.Reply;
import com.smork.forum.model.Response;
import com.smork.forum.service.ReplyService;

/**
 * @author Rahil Husain
 *
 */
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public Response getReplies(long topicId) {
		try {
			return new Response(replyDao.getReplies(topicId));
		} catch (EmptyResultDataAccessException e) {
			return Response.NO_CONTENT;
		}

	}

	@Override
	public Response addReply(Reply reply) {
		if (replyDao.addReply(reply) > 0)
			return Response.CREATED;
		return Response.BAD_REQUEST;

	}

	@Override
	public Response deleteReply(long replyId) {
		if (replyDao.deleteReply(replyId) > 0)
			return Response.SUCCESS;
		return Response.NOT_FOUND;
	}

}
