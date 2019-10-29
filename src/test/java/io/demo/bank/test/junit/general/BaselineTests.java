package io.demo.bank.test.junit.general;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BaselineTests {
	
	@Test
	public void testTrue() {
		assertTrue(true);
	}
	
	@Test
	public void testFalse() {
		assertTrue(true);
	}

}
