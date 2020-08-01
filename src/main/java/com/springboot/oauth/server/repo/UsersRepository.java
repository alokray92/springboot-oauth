package com.springboot.oauth.server.repo;


import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.oauth.server.model.Users;

import java.util.Optional;

public interface UsersRepository extends JpaRepository<Users, Integer> {
    Optional<Users> findByName(String username);
}
