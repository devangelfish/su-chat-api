package kr.ac.syu.core.crawler.dept.leisureandsports;

import kr.ac.syu.core.crawler.CaptureCrawler;

public class ProfessorLeeJaeGu extends CaptureCrawler {
	@Override
	public String process() {
		return crawImage("https://www.syu.ac.kr/sports/faculty/professor/", "//*[@id=\"post-54\"]/div[2]/ul/li[1]/div/div[1]");
	}
}