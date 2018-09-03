package com.smork.forum.controller.rest;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smork.forum.model.AuthUser;
import com.smork.forum.model.Response;
import com.smork.forum.model.Topic;
import com.smork.forum.service.TopicService;

/**
 * @author Rahil Husain
 *
 */
@RestController
@RequestMapping("/rest/topic")
public class TopicController {

	@Autowired
	private TopicService topicService;

	@GetMapping("")
	public Response getTopics(@RequestParam long categoryId, @RequestParam boolean latest, @RequestParam boolean top,
			@RequestParam(required = false) Date fromDate, @RequestParam(required = false) Date toDate) {
		return topicService.getTopics(categoryId, latest, top, fromDate, toDate);
	}

	@PostMapping("/add")
	public Response addTopic(@RequestBody Topic topic) {
		AuthUser userDetails = (AuthUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		topic.setCreatedBy(userDetails.getUserId());
		return topicService.addTopic(topic);
	}

	@GetMapping("/delete")
	public Response deleteTopic(@RequestParam long topicId) {
		return topicService.deleteTopic(topicId);
	}

	@GetMapping("/get")
	public Response getTopic(@RequestParam long topicId) {
		return topicService.getTopic(topicId);
	}
}
