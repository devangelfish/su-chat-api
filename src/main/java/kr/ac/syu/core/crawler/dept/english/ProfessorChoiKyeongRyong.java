package kr.ac.syu.core.crawler.dept.english;

import kr.ac.syu.core.crawler.CaptureCrawler;

public class ProfessorChoiKyeongRyong extends CaptureCrawler {
	@Override
	public String process() {
		return crawImage("https://www.syu.ac.kr/english/faculty/professor/", "//*[@id=\"post-54\"]/div[2]/ul/li[2]/div/div[1]");
	}
}