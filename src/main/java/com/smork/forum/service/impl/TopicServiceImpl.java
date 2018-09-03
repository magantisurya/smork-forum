/**
 * 
 */
package com.smork.forum.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParser;
import com.smork.forum.dao.TopicDao;
import com.smork.forum.model.Response;
import com.smork.forum.model.Topic;
import com.smork.forum.service.ReplyService;
import com.smork.forum.service.TopicService;

/**
 * @author Rahil Husain
 *
 */
@Service
public class TopicServiceImpl implements TopicService {

	@Autowired
	private TopicDao topicDao;

	@Autowired
	private ReplyService replyService;

	@Override
	public Response getTopics(long categoryId, boolean latest, boolean top, Date fromDate, Date toDate) {
		try {
			return new Response(topicDao.getTopics(categoryId, latest, top, fromDate, toDate));
		} catch (EmptyResultDataAccessException e) {
			return Response.NO_CONTENT;
		}
	}

	@Override
	public Response getTopic(long topicId) {
		try {
			Map<String, Object> topic = topicDao.getTopic(topicId);
			topic.put("replies", replyService.getReplies(topicId).getData());
			return new Response(topic);
		} catch (EmptyResultDataAccessException e) {
			return Response.NO_CONTENT;
		}
	}

	@Override
	public Response addTopic(Topic topic) {
		if (topicDao.addTopic(topic) > 0)
			return Response.CREATED;
		return Response.BAD_REQUEST;
	}

	@Override
	public Response deleteTopic(long topicId) {
		if (topicDao.deleteTopic(topicId) > 0)
			return Response.SUCCESS;
		return Response.NOT_FOUND;
	}

}
