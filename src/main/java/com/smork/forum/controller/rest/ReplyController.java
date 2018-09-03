package com.smork.forum.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smork.forum.model.AuthUser;
import com.smork.forum.model.Reply;
import com.smork.forum.model.Response;
import com.smork.forum.service.ReplyService;

/**
 * @author Rahil Husain
 *
 */
@RestController
@RequestMapping("/rest/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@GetMapping("/")
	public Response getReplies(@RequestParam long topicId) {
		return replyService.getReplies(topicId);
	}

	@PostMapping("/add")
	public Response addReply(@RequestBody Reply reply) {
		AuthUser userDetails = (AuthUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		reply.setRepliedBy(userDetails.getUserId());
		return replyService.addReply(reply);
	}

	@GetMapping("/delete")
	public Response deleteReply(@RequestParam long replyId) {
		return replyService.deleteReply(replyId);
	}
}
