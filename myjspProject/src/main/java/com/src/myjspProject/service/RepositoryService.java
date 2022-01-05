package com.src.myjspProject.service;

import com.src.myjspProject.model.BorderVo.BorderData;
import com.src.myjspProject.model.BorderVo.BorderDataDTO;
import com.src.myjspProject.model.BorderVo.Comment;
import com.src.myjspProject.model.BorderVo.CommentDTO;
import com.src.myjspProject.repository.BorderRepository;
import com.src.myjspProject.repository.CommentRepository;

//import antlr.collections.List;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RepositoryService {
    private final BorderRepository borderRepository;
    private final CommentRepository commentRepository;

    @Transactional
    public void getDataSave(final BorderDataDTO borderData){
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd:HH:mm");
        Date times = new Date();
        borderData.setTime(date.format(times));
        BorderData data =  borderRepository.save( borderData.toEntity());
    }

    @Transactional
    public Page<BorderData> getFindAllData(Pageable pageable){
        return borderRepository.findAll(pageable);
    }


    @Transactional
    public void getBorderId(BorderDataDTO  id){
        BorderData dats = borderRepository.getById(id.getId());
        borderRepository.deleteById(dats.getId());
    }

    @Transactional
    public Optional  getBorderPage(BorderDataDTO id){
        BorderData data = borderRepository.getById(id.getId());
         return borderRepository.findById(id.getId());
    }

    @Transactional
    public String getBorderPageContentUpdate(BorderDataDTO dats) {
        BorderData datas = borderRepository.getById(dats.getId());
        datas.setContent(dats.getContent());
        return "index";
    }

    @Transactional
    public void getComment(CommentDTO data) {
    	 SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd:HH:mm");
         Date times = new Date();
    	data.setTime(date.format(times));
    	Comment datas = commentRepository.save(data.toEntity());
    }

    @Transactional
    public void getCommentId(Model model,CommentDTO borderId) {
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    	List<Comment> data = commentRepository.findAllById(borderId.getBorderId());
    	System.out.println(data);
//    	 model.addAttribute("comment",data);
    }

}
