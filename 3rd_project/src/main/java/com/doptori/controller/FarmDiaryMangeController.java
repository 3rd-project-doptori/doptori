package com.doptori.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.doptori.entity.Address;
import com.doptori.entity.Member;
import com.doptori.entity.Step;
import com.doptori.entity.farmdiary;
import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.AddressMapper;
import com.doptori.mapper.FarmDiaryManageMapper;
import com.doptori.mapper.FarmDiaryMapper;
import com.doptori.mapper.StepMapper;

@Controller
public class FarmDiaryMangeController {

	@Autowired
	private FarmDiaryManageMapper mapper;
	@Autowired
	private AddressMapper mapper2;
	@Autowired
	private FarmDiaryMapper mapper3;
	@Autowired
	private StepMapper mapper4;

	@RequestMapping("/FarmDiaryManage.do")
	public String FarmDiaryManageInsert(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}

	@RequestMapping("/FarmDiaryManage2.do")
	public String FarmDiaryManageInsert2(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert2(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}

	@RequestMapping("/FarmDiaryManage3.do")
	public String FarmDiaryManageInsert3(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert3(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}

	@RequestMapping("/FarmDiaryManage5.do")
	public String FarmDiaryManageInsert5(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert5(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}

	
    @RequestMapping("/FarmDiaryManage6.do") 
    public String FarmDiaryManageInsert6(farmdiary_manage vo) {
    	mapper.FarmDiaryManageInsert6(vo); 
    	return "redirect:/FarmDiaryManageList2.do"; 
    }
	 

	/*
	 * @RequestMapping("/FarmDiaryManage7.do") public String
	 * FarmDiaryManageInsert7(farmdiary_manage vo) {
	 * mapper.FarmDiaryManageInsert7(vo); return
	 * "redirect:/FarmDiaryManageList2.do"; }
	 */

	@PostMapping("/FarmDiaryManage4.do")
	public String FarmDiaryManageInsert4(farmdiary_manage mvo) throws Exception {
		// 파일 업로드 처리
		String fdm4_edu_pic = null;
		String fdm4_edu_file = null;
		MultipartFile uploadFile = mvo.getUploadFile();
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
		mvo.setFdm4_edu_pic(fdm4_edu_pic);
		mvo.setFdm4_edu_file(fdm4_edu_file);

		mapper.FarmDiaryManageInsert4(mvo);
		return "redirect:/FarmDiaryManageList2.do";
	}

	@RequestMapping("/FarmDiaryManageList2.do")
	public String FarmDiaryManageList2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> list = mapper.FarmDiaryManageList(loginMember.getMb_num());
		List<farmdiary_manage> list2 = mapper.FarmDiaryManageList2(loginMember.getMb_num());
		List<farmdiary_manage> list4 = mapper.FarmDiaryManageList4(loginMember.getMb_num());
		List<farmdiary_manage> list3 = mapper.FarmDiaryManageList3(loginMember.getMb_num());
		List<farmdiary_manage> list5 = mapper.FarmDiaryManageList5(loginMember.getMb_num());
		List<farmdiary_manage> list6 = mapper.FarmDiaryManageList6(loginMember.getMb_num());
		List<farmdiary_manage> list7 = mapper.FarmDiaryManageList7(loginMember.getMb_num());
		List<Address> gugunmodelList = mapper2.gugunmodelList();
		List<Address> dongmodelList = mapper2.dongmodelList();
		model.addAttribute("dongmodelList", dongmodelList);
		model.addAttribute("gugunmodelList", gugunmodelList);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list4", list4);
		model.addAttribute("list3", list3);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		return "farm_management";
	}

	@PostMapping("/FarmDiaryManageUpdate.do")
	public String FarmDiaryManageUpdate(farmdiary_manage vo) {
		mapper.FarmDiaryManageUpdate(vo);

		// 게시글 수정하고 나면 게시판 목록으로
		return "redirect:/FarmDiaryManageList2.do";
	}

	@PostMapping("/FarmDiaryManageUpdate2.do")
	public String FarmDiaryManageUpdate2(farmdiary_manage vo) {
		mapper.FarmDiaryManageUpdate2(vo);

		// 게시글 수정하고 나면 게시판 목록으로
		return "redirect:/FarmDiaryManageList2.do";
	}

	@PostMapping("/FarmDiaryManageUpdate3.do")
	public String FarmDiaryManageUpdate3(farmdiary_manage vo) {
		mapper.FarmDiaryManageUpdate3(vo);

		// 게시글 수정하고 나면 게시판 목록으로
		return "redirect:/FarmDiaryManageList2.do";
	}

	@PostMapping("/FarmDiaryManageUpdate4.do")
	public String FarmDiaryManageUpdate4(farmdiary_manage vo) throws Exception {
		// 파일 업로드 처리
		String fdm4_edu_pic = null;
		String fdm4_edu_file = null;
		MultipartFile uploadFile = vo.getUploadFile();
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
		vo.setFdm4_edu_pic(fdm4_edu_pic);
		vo.setFdm4_edu_file(fdm4_edu_file);

		mapper.FarmDiaryManageUpdate4(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}

	@PostMapping("/FarmDiaryManageUpdate5.do")
	public String FarmDiaryManageUpdate5(farmdiary_manage vo) {
		mapper.FarmDiaryManageUpdate5(vo);

		// 게시글 수정하고 나면 게시판 목록으로
		return "redirect:/FarmDiaryManageList2.do";
	}

	@PostMapping("/FarmDiaryManageUpdate6.do")
	public String FarmDiaryManageUpdate6(farmdiary_manage vo) {
		mapper.FarmDiaryManageUpdate6(vo);

		// 게시글 수정하고 나면 게시판 목록으로
		return "redirect:/FarmDiaryManageList2.do";
	}
	
	@RequestMapping("/FarmDiaryList.do")
	public String FarmDiaryList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> list = mapper.FarmDiaryManageList(loginMember.getMb_num());
		List<farmdiary_manage> list2 = mapper.FarmDiaryManageList2(loginMember.getMb_num());
		List<farmdiary_manage> list5 = mapper.FarmDiaryManageList5(loginMember.getMb_num());
		List<farmdiary_manage> list3 = mapper.FarmDiaryManageList3(loginMember.getMb_num());
		List<farmdiary> list4 = mapper3.FarmDiaryList(loginMember.getMb_num());
		List<Step> list6 = mapper4.stepList();
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list5", list5);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list6", list6);
		return "farm_list";
	}
	
	@PostMapping("/FarmDiaryUpdate.do")
	public String FarmDiaryUpdate(farmdiary vo) throws Exception {
		
		String fdm4_edu_pic = null;
		String fdm4_edu_file = null;
		MultipartFile uploadFile = vo.getUploadFile();
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
		vo.setFd_picture(fdm4_edu_pic);
		vo.setFd_file(fdm4_edu_file);
		
		mapper3.FarmDiaryUpdate(vo);

		// 게시글 수정하고 나면 게시판 목록으로
		return "redirect:/FarmDiaryList.do";
	}
}
