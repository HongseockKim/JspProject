package com.src.myjspProject.controller;

import com.src.myjspProject.model.BorderVo.BorderDataDTO;
import com.src.myjspProject.model.BorderVo.CommentDTO;
import com.src.myjspProject.service.RepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
public class Mycontroller {
	@Autowired
    private RepositoryService service;



    @PostMapping(value = "/border/data/saves")
    public String getData(@RequestBody BorderDataDTO borderData) throws IOException {
        service.getDataSave(borderData);
        return "index";
    }
    /**
     *
     * @param model
     * @param pageables
     */

    @GetMapping(value = "/")
    public String getData(Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) throws IOException{
        model.addAttribute("data",service.getFindAllData(pageable));
        return "index";
    }



    /**
     * main Controller
     * @param model
     * @param page
     * @param pageable
     */

    @GetMapping(value = "/index")
    public String getData(Model model,@RequestParam String page,@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) throws IOException{
        // System.out.println("page = " + page);
    	System.out.println("µé¾î¿È");
        if(page != null) {
            PageRequest pageRequest = PageRequest.of(Integer.parseInt(page), Integer.parseInt(page)+0);
        }

        model.addAttribute("data",service.getFindAllData(pageable));
        return "index";
    }


    /**
     * border Delete Controller
     * @param id
     */

    @GetMapping(value = "/border/delete")
    public String getBorderDelteId(@ModelAttribute BorderDataDTO id) throws IOException {
        service.getBorderId(id);
        return "index";
    }

    /**
     * border Detail Controller
     * @param model
     * @param id
     */
    @GetMapping(value = "/page/border")
    public String getBorderPage(Model model, @ModelAttribute BorderDataDTO id) throws IOException{
         System.out.println("id = " + id.getId());

         long getId = id.getId();

        service.getBorderPage(id);

        service.getCommentId(model, getId);
        model.addAttribute("page",service.getBorderPage(id));
        return "page/border";
    }


    /**
     * Comment Add Controller
     * @param model
     * @param data
     */

    @PostMapping(value = "/page/border/comment")
    public String getBorderComment(Model model,@RequestBody CommentDTO data) {

    	service.getComment(data);

    	return "page/border";
    }



    /**
     * border Update Controller
     * @param model
     * @param data
     */
    @PostMapping(value = "/page/border/update")
    public String getBorderPageUpdate(Model model,@RequestBody BorderDataDTO data) throws IOException{
        // System.out.println(data);
        service.getBorderPageContentUpdate(data);
        return "page/border";
    }

    /**
     *  commentDelte Controller
     * @param id
     */
    @PostMapping(value = "/page/border/commnet/delete")
    public String getCommnetDelete(@RequestBody CommentDTO id) throws IOException{

    	service.getCommentIdDelete(id);
    	return "page/border";
    }
}
