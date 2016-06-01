package testcase;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import seleniumTest.Search;

public class TestSearchBooks {

	Search search;
	
	@Before
	public void setUp() throws Exception {
		search = new Search();
	}
	
	@Test
	public void test() {
		search.start();
		String name = search.getBookName();
		assertEquals("數據分析：R 語言實戰", name);
	}

}
