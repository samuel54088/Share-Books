package p2;
import static org.junit.Assert.*;
import p2.Hello;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class HelloTest {

	public Hello t;

	@Before
	public void setUp() throws Exception {
		t = new Hello();
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
