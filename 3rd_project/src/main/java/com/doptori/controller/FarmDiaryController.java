package com.doptori.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doptori.entity.DateData2;
import com.doptori.entity.Farm;
import com.doptori.entity.Member;
import com.doptori.entity.Step;
import com.doptori.entity.farmdiary;
import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.AddressMapper;
import com.doptori.mapper.FarmDiaryManageMapper;
import com.doptori.mapper.FarmDiaryMapper;
import com.doptori.mapper.StepMapper;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class FarmDiaryController {

	@Autowired
	public FarmDiaryMapper mapper;
	@Autowired
	private FarmDiaryManageMapper mapper5;
	@Autowired
	private FarmDiaryMapper mapper3;
	@Autowired
	private StepMapper mapper4;

	private static final Logger logger = LoggerFactory.getLogger(FarmDiaryController.class);
	
	@RequestMapping(value = "calendar2.do/{mb_num}", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData2 dateData, @PathVariable("mb_num")int mb_num) {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> list = mapper5.FarmDiaryManageList(loginMember.getMb_num());
		List<farmdiary_manage> list2 = mapper5.FarmDiaryManageList2(loginMember.getMb_num());
		List<farmdiary_manage> list5 = mapper5.FarmDiaryManageList5(loginMember.getMb_num());
		List<farmdiary_manage> list3 = mapper5.FarmDiaryManageList3(loginMember.getMb_num());
		List<farmdiary> list4 = mapper3.FarmDiaryList(loginMember.getMb_num());
		List<Step> list6 = mapper4.stepList();
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list5", list5);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list6", list6);
		
		Calendar cal = Calendar.getInstance();
		DateData2 calendarData;
		// 검색 날짜
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData2(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData2> dateList = new ArrayList<DateData2>();
		dateData.setFd_mb_num(mb_num);

		// 검색 날짜 end
		ArrayList<farmdiary> Schedule_list = mapper.schedule_list(dateData);

		// 달력데이터에 넣기 위한 배열 추가
		farmdiary[][] schedule_data_arr = new farmdiary[32][4];
		if (Schedule_list.isEmpty() != true) {
			int j = 0;
			for (int i = 0; i < Schedule_list.size(); i++) {
				int date = Integer.parseInt(String.valueOf(Schedule_list.get(i).getFd_start()).substring(
						String.valueOf(Schedule_list.get(i).getFd_start()).length() - 2,
						String.valueOf(Schedule_list.get(i).getFd_start()).length()));
				if (i > 0) {
					int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i - 1).getFd_start())
							.substring(String.valueOf(Schedule_list.get(i - 1).getFd_start()).length() - 2,
									String.valueOf(Schedule_list.get(i - 1).getFd_start()).length()));
					if (date_before == date) {
						j = j + 1;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					} else {
						j = 0;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					}
				} else {
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			}
		}

		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData2(null, null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			farmdiary[] schedule_data_arr3 = new farmdiary[4];
			schedule_data_arr3 = schedule_data_arr[i];

			if (i == today_info.get("today")) {
				calendarData = new DateData2(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", schedule_data_arr3);
			} else {
				calendarData = new DateData2(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", schedule_data_arr3);
			}
			dateList.add(calendarData);

		}

		// 달력 빈 곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateData2(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}
		model.addAttribute("Schedule_list", Schedule_list);
		
		for (farmdiary farmdiary : Schedule_list) {
			System.out.println(farmdiary.toString());
		}
		
		
		// 배열에 담음
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		
		for (DateData2 farmdiary2 : dateList) {
			System.out.println(farmdiary2.toString());
		}
		
		model.addAttribute("today_info", today_info);
		return "/schedule/calendar2";
	}

	@RequestMapping("/schedule_add.do/{mb_num}")
	public String schedule_add(HttpServletRequest request, farmdiary farmdiary, RedirectAttributes rttr, @PathVariable("mb_num")int mb_num)throws Exception {
		farmdiary.setFd_mb_num(mb_num);
		int count = mapper.before_schedule_add_search(farmdiary);
		
		// 파일 업로드 처리
		  String mb_pic = null;
		  String mb_file = null;
		  MultipartFile uploadFile = farmdiary.getUploadFile(); 
		  if (!uploadFile.isEmpty()) { 
			  String originalFileName = uploadFile.getOriginalFilename(); 
			  String ext = FilenameUtils.getExtension(originalFileName); //확장자 구하기
			  UUID uuid = UUID.randomUUID(); //UUID 구하기
			  String[] uuids = uuid.toString().split("-");

			  String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
			  String uniqueName = uuids[0];
			  System.out.println("생성된 고유문자열" + uniqueName);
			  System.out.println("확장자명" + fileExtension);

			  String uploadFolder = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images";

			  
			  mb_pic = uniqueName + fileExtension;
			  mb_file = uploadFolder+"\\"+ uniqueName + fileExtension;

				File saveFile = new File(mb_file); 

				uploadFile.transferTo(saveFile);

		  }
		  farmdiary.setFd_picture(mb_pic);
		  farmdiary.setFd_file(mb_file);
		
		String message = "";
		String url = "redirect:/calendar2.do/" + farmdiary.getFd_mb_num();

		if (count >= 4) {
			message = "스케쥴은 최대 4개만 등록 가능합니다.";
		} else {
			mapper.schedule_add(farmdiary);
			message = "스케쥴이 등록되었습니다";
		}

		rttr.addFlashAttribute("message", message);
		return url;
	}
	
	@RequestMapping("/schedule_add2.do/{mb_num}")
	public String schedule_add2(HttpServletRequest request, farmdiary farmdiary, RedirectAttributes rttr, @PathVariable("mb_num")int mb_num)throws Exception {
		
		farmdiary.setFd_mb_num(mb_num);
		int count = mapper.before_schedule_add_search(farmdiary);
		
		// 파일 업로드 처리
		  String mb_pic = null;
		  String mb_file = null;
		  MultipartFile uploadFile = farmdiary.getUploadFile(); 
		  if (!uploadFile.isEmpty()) { 
			  String originalFileName = uploadFile.getOriginalFilename(); 
			  String ext = FilenameUtils.getExtension(originalFileName); //확장자 구하기
			  UUID uuid = UUID.randomUUID(); //UUID 구하기
			  String[] uuids = uuid.toString().split("-");

			  String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
			  String uniqueName = uuids[0];
			  System.out.println("생성된 고유문자열" + uniqueName);
			  System.out.println("확장자명" + fileExtension);

			  String uploadFolder = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images";

			  
			  mb_pic = uniqueName + fileExtension;
			  mb_file = uploadFolder+"\\"+ uniqueName + fileExtension;

				File saveFile = new File(mb_file); 

				uploadFile.transferTo(saveFile);

		  }
		  farmdiary.setFd_picture(mb_pic);
		  farmdiary.setFd_file(mb_file);
		
		String message = "";
		String url = "redirect:/FarmDiaryList.do";

		if (count >= 4) {
			message = "스케쥴은 최대 4개만 등록 가능합니다.";
		} else {
			mapper.schedule_add(farmdiary);
			message = "스케쥴이 등록되었습니다";
		}

		rttr.addFlashAttribute("message", message);
		return url;
	}

		
	@RequestMapping(value = "/schedule_show", method = RequestMethod.GET)
	public String schedule_show(Model model,HttpServletRequest request, @RequestParam("fd_num") int idx, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> list = mapper5.FarmDiaryManageList(loginMember.getMb_num());
		List<farmdiary_manage> list2 = mapper5.FarmDiaryManageList2(loginMember.getMb_num());
		List<farmdiary_manage> list5 = mapper5.FarmDiaryManageList5(loginMember.getMb_num());
		List<farmdiary_manage> list3 = mapper5.FarmDiaryManageList3(loginMember.getMb_num());
		List<farmdiary> list4 = mapper3.FarmDiaryList(loginMember.getMb_num());
		List<Step> list6 = mapper4.stepList();
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list5", list5);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list6", list6);
		
		
		model.addAttribute("schedule_show",mapper.get(idx));
		
		return "/schedule/schedule_show";
	}
	
	@PostMapping("/FarmDiaryUpdate2.do")
	public String schedule_modify(Model model,HttpServletRequest request, farmdiary farmdiary, RedirectAttributes rttr)throws Exception {
		String fdm4_edu_pic = null;
		String fdm4_edu_file = null;
		MultipartFile uploadFile = farmdiary.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			String[] uuids = uuid.toString().split("-");

			String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),
					originalFileName.length());
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			String uploadFolder = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images";

			fdm4_edu_pic = uniqueName + fileExtension;
			fdm4_edu_file = uploadFolder + "\\" + uniqueName + fileExtension;

			File saveFile = new File(fdm4_edu_file);

			uploadFile.transferTo(saveFile);

		}
		farmdiary.setFd_picture(fdm4_edu_pic);
		farmdiary.setFd_file(fdm4_edu_file);
		
		mapper.update(farmdiary);
		model.addAttribute("schedule_modify",mapper.update(farmdiary));
		return "/schedule/modify";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String schedule_delete(Model model,HttpServletRequest request, farmdiary farmdiary, RedirectAttributes rttr) {

		mapper.delete(farmdiary);
		model.addAttribute("schedule_delete",mapper.delete(farmdiary));
		return "/schedule/delete";
	}
	


}