package com.src.myjspProject.service;

import com.src.myjspProject.model.BorderVo.BorderData;
import com.src.myjspProject.model.BorderVo.BorderDataDTO;
import com.src.myjspProject.repository.BorderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
//@RequiredArgsConstructor 는 lombok 이 초기화 되지 않은 필드를 생성합니다. 이를 통해서 의존성 주입(Dependency Injection)을 할 수 있습니다.
public class RepositoryService {
    private final BorderRepository borderRepository;



    @Transactional
    public String getDataSave(final BorderDataDTO borderData){
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd:HH:mm");
        Date times = new Date();
        borderData.setTime(date.format(times));
        BorderData data =  borderRepository.save( borderData.toEntity());
        return data.getId();
    }

    @Transactional
    public Page<BorderData> getFindAllData(Pageable pageable){
        return borderRepository.findAll(pageable);
    }


    @Transactional
    public void  getBorderId(BorderData  id){

        borderRepository.deleteById(id.getId());
    }

}
