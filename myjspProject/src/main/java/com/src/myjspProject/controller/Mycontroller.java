package com.src.myjspProject.controller;

import com.src.myjspProject.model.BorderVo.BorderDataDTO;
import com.src.myjspProject.model.BorderVo.CommentDTO;
import com.src.myjspProject.service.RepositoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;import javax.persistence.Id;

@Controller
public class Mycontroller {
	@Autowired
    private RepositoryService service;



    @PostMapping(value = "/border/data/saves")
    public String getData(@RequestBody BorderDataDTO borderData) throws IOException {
        service.getDataSave(borderData);
        return "index";
    }

    @GetMapping(value = "/")
    public String getData(Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) throws IOException{
        model.addAttribute("data",service.getFindAllData(pageable));
        return "index";
    }




    @GetMapping(value = "/index")
    public String getData(Model model,@RequestParam String page,@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) throws IOException{
        System.out.println("page = " + page);
        if(page != null) {
            PageRequest pageRequest = PageRequest.of(Integer.parseInt(page), Integer.parseInt(page)+0);
        }

        model.addAttribute("data",service.getFindAllData(pageable));
        return "index";
    }



    @GetMapping(value = "/border/delete")
    public String getBorderDelteId(@ModelAttribute BorderDataDTO id) throws IOException {
                service.getBorderId(id);
        return "index";
    }

    @GetMapping(value = "/page/border")
    public String getBorderPage(Model model, @ModelAttribute BorderDataDTO id,CommentDTO borderId) throws IOException{
        System.out.println("id = " + id.getId());


        service.getCommentId(model, borderId);
        service.getBorderPage(id);

//        service.getCommentId(model, borderId);

        model.addAttribute("page",service.getBorderPage(id));
        return "page/border";
    }

    @PostMapping(value = "/page/border/comment")
    public String getBorderComment(Model model,@RequestBody CommentDTO data) {

    	service.getComment(data);

    	return "page/border";
    }

    @PostMapping(value = "/page/border/update")
    public String getBorderPageUpdate(Model model,@RequestBody BorderDataDTO data) throws IOException{
        System.out.println(data);
        service.getBorderPageContentUpdate(data);
        return "page/border";
    }
}
