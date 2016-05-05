import static org.junit.Assert.*;
import p2.TEST;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TESTtest {

	public TEST t;

	@Before
	public void setUp() throws Exception {
		t = new TEST();
	}

	@After
	public void tearDown() throws Exception {
		t=null;
	}

	@Test
	public void test() {
		String result = t.m1();
		assertEquals("Hi~",result);
	}

}
