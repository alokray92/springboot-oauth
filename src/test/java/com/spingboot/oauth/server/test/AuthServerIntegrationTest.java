package com.spingboot.oauth.server.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.springboot.oauth.server.AuthorizationServerApplication;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AuthorizationServerApplication.class, webEnvironment = WebEnvironment.RANDOM_PORT)
public class AuthServerIntegrationTest {
	@Test
	public void contextLoads() {
	}

}
