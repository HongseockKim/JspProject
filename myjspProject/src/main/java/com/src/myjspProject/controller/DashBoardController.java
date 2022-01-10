package com.src.myjspProject.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.src.myjspProject.model.chartDataVo.DashBoardeData;
import com.src.myjspProject.model.chartDataVo.DashBoardeDataDTO;
import com.src.myjspProject.model.memberVo.MemberDTO;
import com.src.myjspProject.myView.MyView;
import com.src.myjspProject.service.RepositoryService;

@Controller
@RequestMapping("/dashborad")
public class DashBoardController {
	@Autowired
    private RepositoryService service;

	/**
	 * 데이터 메인
	 * @param model
	 * @param dashBoardeData
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/main")
	public String getDashBoardMain(Model model,DashBoardeData dashBoardeData) throws Exception {
		System.out.println("메인");
		model.addAttribute("borderData",service.getDashBoradDataOut(dashBoardeData));

		return "dashborad/dashborad";
	}

	/**
	 * 데이터 저장
	 * @param dataValue
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/data",produces = "application/json")
	public String getDashBoardData(@RequestBody DashBoardeDataDTO dataValue) throws Exception {

		return service.getDashBoradData(dataValue);
	}

	@PostMapping(value="/member/register")
	public String getMemberData(@RequestBody MemberDTO memberData) {
		System.out.println(memberData.getName());
		return "dashborad/dashborad";
	}

}
