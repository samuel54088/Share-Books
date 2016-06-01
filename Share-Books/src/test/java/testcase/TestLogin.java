package testcase;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import seleniumTest.Login;


public class TestLogin {
	
	Login login;
	
	@Before
	public void setUp() throws Exception {
		login = new Login();
	}

	@Test
	public void test() {
		Boolean result = login.start();
		assertEquals(true, result);
		
		String str = login.getString();
		assertEquals("Hello Jobs, 您已經登入成功!!", str);
	}

}
