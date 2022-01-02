package com.src.myjspProject.controller;

import com.src.myjspProject.model.BorderVo.BorderData;
import com.src.myjspProject.model.BorderVo.BorderDataDTO;
import com.src.myjspProject.service.RepositoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
public class Mycontroller {
    @Autowired  private RepositoryService service;

private final Logger logger = LoggerFactory.getLogger(getClass());


    @PostMapping(value = "/border/data/saves")
    public String getData(@RequestBody BorderDataDTO borderData) throws IOException {
        service.getDataSave(borderData);
        System.out.println("세이브실행");
        return "index";
    }
    
    @GetMapping(value = "/")
    public String getData(Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) throws IOException{

        model.addAttribute("data",service.getFindAllData(pageable));
        System.out.println(service.getFindAllData(pageable));
        System.out.println("조회 실행");
        return "index";
    }
    
    @GetMapping(value = "/delete")
    public void getBorderDelete(@RequestParam BorderData id) throws IOException {
        service.getBorderId(id);
    }
}
