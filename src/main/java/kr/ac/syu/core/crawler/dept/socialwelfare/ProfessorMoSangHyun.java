package kr.ac.syu.core.crawler.dept.socialwelfare;

import kr.ac.syu.core.crawler.CaptureCrawler;

public class ProfessorMoSangHyun extends CaptureCrawler {
	@Override
	public String process() {
		return crawImage("https://www.syu.ac.kr/sw/faculty/professor/", "//*[@id=\"post-54\"]/div[2]/ul/li[5]/div/div[1]");
	}
}