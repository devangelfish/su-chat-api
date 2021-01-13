package kr.ac.syu.crawler.curriculum;

import kr.ac.syu.core.crawler.CaptureCrawler;

public class JapaneseCur extends CaptureCrawler {
	@Override
	public String process() {
		return crawImage("https://www.syu.ac.kr/japanese/curriculum/curriculum/",
				/*
				"//*[@id=\"post-48\"]/div[1]/div[1]",
				"//*[@id=\"post-48\"]/div[1]/div[2]",
				"//*[@id=\"post-48\"]/div[1]/div[3]",
				"//*[@id=\"post-48\"]/div[1]/div[4]",
				"//*[@id=\"post-48\"]/div[1]/div[5]",
				"//*[@id=\"post-48\"]/div[1]/div[6]",
				"//*[@id=\"post-48\"]/div[1]/div[7]",
				"//*[@id=\"post-48\"]/div[1]/div[8]"
				*/
				"//*[@id=\"post-48\"]/div[1]");
	}
}
