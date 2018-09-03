/**
 * 
 */
package com.smork.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smork.forum.service.TopicService;

/**
 * @author Rahil Husain
 *
 */
@Controller
public class ForumController {

	@Autowired
	private TopicService topicService;

	@GetMapping("/add-topic")
	public String addNewTopic(@RequestParam long categoryId, Model model) {
		model.addAttribute("categoryId", categoryId);
		return "add-topic";
	}

	@GetMapping("/open-topic")
	public String openTopic(@RequestParam long topicId, Model model) {
		model.addAttribute("data", topicService.getTopic(topicId).getData());
		return "view-topic";
	}
}
