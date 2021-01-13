package kr.ac.syu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.syu.core.ResponseProcess;
import kr.ac.syu.vo.MessageVo;
import kr.ac.syu.vo.ResponseDTO;

@Controller
public class ChatAPIController {
	
	private ResponseProcess processedResponse = new ResponseProcess();
	
	@RequestMapping(value="/ChatAPIController", method=RequestMethod.POST)
	@ResponseBody
	private ResponseDTO communicateMessage(@RequestBody MessageVo param) {
		System.out.println(param.getText());
		String message = processedResponse.getMessage(param.getText());
		String[] result = message.split("\\|");
		ResponseDTO response = new ResponseDTO();
		response.setContent(result);
		return response;
	}
}
