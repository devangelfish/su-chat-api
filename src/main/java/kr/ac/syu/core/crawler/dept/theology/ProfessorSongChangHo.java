package kr.ac.syu.core.crawler.dept.theology;

import kr.ac.syu.core.crawler.CaptureCrawler;

public class ProfessorSongChangHo extends CaptureCrawler {
	@Override
	public String process() {
		return crawImage("https://www.syu.ac.kr/theology/faculty/professor/", "//*[@id=\"post-54\"]/div[2]/ul/li[11]/div/div[1]");
	}
}