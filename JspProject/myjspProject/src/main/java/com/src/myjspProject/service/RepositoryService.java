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
import java.util.HashMap;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RepositoryService {
    private final BorderRepository borderRepository;
    private final CommentRepository commentRepository;

    /**
     * 
     * @param borderDataa 게시글
     */
    
    @Transactional
    public void getDataSave(final BorderDataDTO borderData){
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd:HH:mm");
        Date times = new Date();
        borderData.setTime(date.format(times));
        BorderData data =  borderRepository.save( borderData.toEntity());
    }

    /**
     * 
     * @param pageable페이지
     * @return
     */
    @Transactional
    public Page<BorderData> getFindAllData(Pageable pageable){
        return borderRepository.findAll(pageable);
    }

    /**
     * 
     * @param id 게시글id
     */

    @Transactional
    public void getBorderId(BorderDataDTO  id){
        BorderData dats = borderRepository.getById(id.getId());
        borderRepository.deleteById(dats.getId());
        
        long longId = id.getId();
        List<Comment> comments = commentRepository.findAllById(longId);
        commentRepository.deleteAllInBatch(comments);
    }

    /**
     * 
     * @param id 게시글id
     * @return
     */
    @Transactional
    public Optional  getBorderPage(BorderDataDTO id){
        BorderData data = borderRepository.getById(id.getId());
         return borderRepository.findById(id.getId());
    }

    /**
     * 
     * @param dats 수정사
     * @return
     */
    @Transactional
    public String getBorderPageContentUpdate(BorderDataDTO dats) {
        BorderData datas = borderRepository.getById(dats.getId());
        datas.setContent(dats.getContent());
        return "index";
    }

    /**
     * 
     * @param dat댓글 내
     */
    
    @Transactional
    public void getComment(CommentDTO data) {
    	 SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd:HH:mm");
         Date times = new Date();
    	data.setTime(date.format(times));
    	Comment datas = commentRepository.save(data.toEntity());
    }
    
    /**
     * 게시글 댓글 리스
     * @param model
     * @param borderId
     */

    @Transactional
    public void getCommentId(Model model,long borderId) {
    	
    	System.out.println("@@@@@@@@@@@@@@comment@@@@@@@@@@@@@@@@@@@@");
    	List<Comment> data = commentRepository.findAllById(borderId);

    	 model.addAttribute("comment",data);
    }
    
    /**
     * comment Id
     * @param id
     */
    
    @Transactional
    public void getCommentIdDelete(CommentDTO id) {
    	Comment getId = commentRepository.getById(id.getId());
    	commentRepository.deleteById(getId.getId());
    	System.out.print(getId.getId());
    }
   
    

}
