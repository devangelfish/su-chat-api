package kr.ac.syu.crawler.quicklink;

import kr.ac.syu.core.crawler.URLSender;

public class Eclass extends URLSender {  // eclass연결
	@Override
	public String process() {
		return packLink("https://lms.suwings.syu.ac.kr/ilos/main/main_form.acl");
	}
}
