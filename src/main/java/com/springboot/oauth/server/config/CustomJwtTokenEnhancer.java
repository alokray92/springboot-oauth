package com.springboot.oauth.server.config;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import com.springboot.oauth.server.model.CustomUserDetails;

public class CustomJwtTokenEnhancer extends JwtAccessTokenConverter {

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
		/*
		 * final Map<String, Object> additionalInfo = new HashMap<>();
		 * additionalInfo.put("organization", authentication.getName() +
		 * randomAlphabetic(4)); ((DefaultOAuth2AccessToken)
		 * accessToken).setAdditionalInformation(additionalInfo); return accessToken;
		 */
    	CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();

		Map<String, Object> info = new LinkedHashMap<String, Object>(accessToken.getAdditionalInformation());

		info.put("email", user.getEmail());
		info.put("Organisation", "Comcast");
		DefaultOAuth2AccessToken customAccessToken = new DefaultOAuth2AccessToken(accessToken);
		customAccessToken.setAdditionalInformation(info);

		return super.enhance(customAccessToken, authentication);
    }
}
