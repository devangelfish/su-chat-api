package kr.ac.syu.core.crawler.dept.counselingandpsychology;

import kr.ac.syu.core.crawler.CaptureCrawler;

public class ProfessorLeeGunHo extends CaptureCrawler {
	@Override
	public String process() {
		return crawImage("https://www.syu.ac.kr/couns/faculty/professor/", "//*[@id=\"post-54\"]/div[2]/ul/li[6]/div/div[1]");
	}
}