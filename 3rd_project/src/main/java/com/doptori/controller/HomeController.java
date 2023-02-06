package com.doptori.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doptori.entity.DateData;
import com.doptori.entity.ScheduleDto;
import com.doptori.mapper.ScheduleDao;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {

	@Autowired
	public ScheduleDao dao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "calendar.do/{mb_num}", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData, @PathVariable("mb_num")int mb_num) {

		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		// 검색 날짜
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		dateData.setMb_num(mb_num);

		// 검색 날짜 end
		ArrayList<ScheduleDto> Schedule_list = dao.schedule_list(dateData);

		// 달력데이터에 넣기 위한 배열 추가
		ScheduleDto[][] schedule_data_arr = new ScheduleDto[32][4];
		if (Schedule_list.isEmpty() != true) {
			int j = 0;
			for (int i = 0; i < Schedule_list.size(); i++) {
				int date = Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).substring(
						String.valueOf(Schedule_list.get(i).getSchedule_date()).length() - 2,
						String.valueOf(Schedule_list.get(i).getSchedule_date()).length()));
				if (i > 0) {
					int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i - 1).getSchedule_date())
							.substring(String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).length() - 2,
									String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).length()));
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
			calendarData = new DateData(null, null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			ScheduleDto[] schedule_data_arr3 = new ScheduleDto[4];
			schedule_data_arr3 = schedule_data_arr[i];

			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", schedule_data_arr3);
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", schedule_data_arr3);
			}
			dateList.add(calendarData);

		}

		// 달력 빈 곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}

		// 배열에 담음
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "/schedule/calendar";
	}

	@RequestMapping(value = "schedule_add.do/{mb_num}", method = RequestMethod.GET)
	public String schedule_add(HttpServletRequest request, ScheduleDto scheduleDto, RedirectAttributes rttr, @PathVariable("mb_num")int mb_num) {
		scheduleDto.setMb_num(mb_num);
		int count = dao.before_schedule_add_search(scheduleDto);
		String message = "";
		String url = "redirect:/calendar.do/" + scheduleDto.getMb_num();

		if (count >= 4) {
			message = "스케쥴은 최대 4개만 등록 가능합니다.";
		} else {
			dao.schedule_add(scheduleDto);
			message = "스케쥴이 등록되었습니다";
		}

		rttr.addFlashAttribute("message", message);
		return url;
	}

		
	@RequestMapping(value = "/schedule_show", method = RequestMethod.GET)
	public String schedule_show(Model model,HttpServletRequest request, @RequestParam("schedule_idx") int idx, RedirectAttributes rttr) {
		model.addAttribute("schedule_show",dao.get(idx));
		return "/schedule/schedule_show";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String schedule_modify(Model model,HttpServletRequest request, ScheduleDto scheduleDto, RedirectAttributes rttr) {

		dao.update(scheduleDto);
		model.addAttribute("schedule_modify",dao.update(scheduleDto));
		return "/schedule/modify";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String schedule_delete(Model model,HttpServletRequest request, ScheduleDto scheduleDto, RedirectAttributes rttr) {

		dao.delete(scheduleDto);
		model.addAttribute("schedule_delete",dao.delete(scheduleDto));
		return "/schedule/delete";
	}
}