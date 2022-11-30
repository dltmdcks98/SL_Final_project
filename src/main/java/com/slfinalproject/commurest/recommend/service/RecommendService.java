package com.slfinalproject.commurest.recommend.service;


import com.slfinalproject.commurest.recommend.repository.RecommendMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service @RequiredArgsConstructor @Log4j2
public class RecommendService {
    private final RecommendMapper recommendMapper;

}
