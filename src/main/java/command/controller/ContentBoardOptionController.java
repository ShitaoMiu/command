package command.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.service.ContentBoardOptionService;
import command.vo.ContentsBoardBanWordVo;
import command.vo.ContentsBoardColumnVo;
import command.vo.ContentsBoardOptionVo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ContentBoardOptionController {

	@Resource(name = "contentBoardOptionService")
	private ContentBoardOptionService contentBoardOptionService;

	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;  

	private static final Logger logger = LogManager.getLogger(ContentBoardOptionController.class);

	@RequestMapping(value = "/admin/content/boardOption")
	public String adminboardOption(HttpServletRequest request, @ModelAttribute("searchVO") ContentsBoardOptionVo contentsBoardOptionVo,ModelMap model) {
		return "redirect:/admin/content/boardOption/list";
	}

	@RequestMapping(value = "/admin/content/boardOption/list")
	public String contentBoard(HttpServletRequest request, @ModelAttribute("searchVO") ContentsBoardOptionVo contentsBoardOptionVo,ModelMap model) {

		int totalCnt = contentBoardOptionService.selectContentsBoardTotalCnt(contentsBoardOptionVo);

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(contentsBoardOptionVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(contentsBoardOptionVo.getPageUnit());
		paginationInfo.setPageSize(contentsBoardOptionVo.getPageSize());
		paginationInfo.setTotalRecordCount(totalCnt);

		contentsBoardOptionVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		contentsBoardOptionVo.setLastIndex(paginationInfo.getLastRecordIndex());
		contentsBoardOptionVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<ContentsBoardOptionVo> contentsBoardList = contentBoardOptionService.selectContentsBoardList(contentsBoardOptionVo);

		model.addAttribute("contentsBoardList", contentsBoardList);
		model.addAttribute("paginationInfo", paginationInfo);

		return "/admin/content/boardOption/boardOption.tiles";
	}

	@RequestMapping(value = "/admin/content/boardOption/{contentBoardIdx}")
	public String boardNewForm(@PathVariable String contentBoardIdx, HttpServletRequest request, ModelMap model) {
		ContentsBoardOptionVo contentsBoardOptionVo  = null;
		if("new".equals(contentBoardIdx)) 
		{
			contentsBoardOptionVo  = new ContentsBoardOptionVo();
		}else 
		{
			int contentBoardpk =Integer.parseInt(contentBoardIdx);
			contentsBoardOptionVo = contentBoardOptionService.selectContentsBoardOne(contentBoardpk);
			Optional<ContentsBoardOptionVo> opContentsBoardVo = Optional.ofNullable(contentsBoardOptionVo);
			contentsBoardOptionVo = opContentsBoardVo.isPresent() ? opContentsBoardVo.get() : new ContentsBoardOptionVo();

			List<ContentsBoardBanWordVo> contentsBoardBanwordList = contentBoardOptionService.selectContentsBoardBandWords(contentBoardpk);
			List<ContentsBoardColumnVo> contentsBoardColumnList = contentBoardOptionService.selectContentsBoardColumnList(contentBoardpk);
			if (contentsBoardColumnList.size() > 0) {  
				List<ContentsBoardColumnVo> boardTheadList = contentsBoardColumnList.stream()
						.filter(x -> "1".equals(x.getContentsBoardColumnType())).collect(Collectors.toList());
				List<ContentsBoardColumnVo> boardTbodyList = contentsBoardColumnList.stream()
						.filter(x -> "2".equals(x.getContentsBoardColumnType())).collect(Collectors.toList());
				contentsBoardOptionVo.setBoardContentList(boardTbodyList);
				contentsBoardOptionVo.setBoardHeadList(boardTheadList);
			}
			contentsBoardOptionVo.setBanwordList(contentsBoardBanwordList);
		}
		model.put("contentsBoardOptionVo", contentsBoardOptionVo);
		return "/admin/content/boardOption/boardOptionForm.tiles";
	}

	@Transactional
	@RequestMapping(value = "/admin/content/boardOption/save", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	public String boardOptionSave(@ModelAttribute ContentsBoardOptionVo contentsBoardOptionVo, HttpServletRequest request) throws Exception {

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus txStatus = txManager.getTransaction(def);
		try {
			request.setCharacterEncoding("UTF-8");
			String contentBoardBanList = request.getParameter("contentBoardBanList");
			String contentBoardHeadList = request.getParameter("contentBoardHeadList");
			String contentBoardContentList = request.getParameter("contentBoardContentList");

			if (contentsBoardOptionVo.getContentsBoardOpIdx()== null) {
				Integer maxNo = contentBoardOptionService.selectContentsBoardMaxIdx();
				contentsBoardOptionVo.setContentsBoardOpIdx(maxNo + 1);
				contentsBoardOptionVo.setContentsBoardOpId("BBS_SET_" + maxNo);
			}

			List<ContentsBoardBanWordVo> banList = new ArrayList<ContentsBoardBanWordVo>();
			if (contentBoardBanList.length() > 0) {
				String[] contentBoardBanWordArr = contentBoardBanList.split(",");
				ContentsBoardBanWordVo contentBoardBanWordVo = null;
				for (int i = 0; i < contentBoardBanWordArr.length; i++) {
					contentBoardBanWordVo = new ContentsBoardBanWordVo();
					contentBoardBanWordVo.setContentsBoardOpIdx(contentsBoardOptionVo.getContentsBoardOpIdx());
					contentBoardBanWordVo.setContentsBoardBanword(String.valueOf(contentBoardBanWordArr[i]));
					contentBoardBanWordVo.setContentsBoardBanIdx(i);
					banList.add(contentBoardBanWordVo);
				}
			}
			List<ContentsBoardColumnVo> columnList = new ArrayList<ContentsBoardColumnVo>();
			if (contentBoardHeadList.length() > 0) {
				String[] contentBoardSetHeadArr = contentBoardHeadList.split(",");
				ContentsBoardColumnVo contentsBoardColumnVo = null;
				for (int i = 0; i < contentBoardSetHeadArr.length; i++) {
					contentsBoardColumnVo = new ContentsBoardColumnVo();
					contentsBoardColumnVo.setContentsBoardOpIdx(contentsBoardOptionVo.getContentsBoardOpIdx());
					contentsBoardColumnVo.setContentsBoardColumnName(String.valueOf(contentBoardSetHeadArr[i]));
					contentsBoardColumnVo.setContentsBoardColumnType("1");
					contentsBoardColumnVo.setContentsBoardColumnOrder(i);
					contentsBoardColumnVo.setContentsBoardColumnIdx(i);
					columnList.add(contentsBoardColumnVo);
				} 
			}
			if (contentBoardContentList.length() > 0) {
				contentBoardContentList.split(",");
				String[] boardSetContentArr = contentBoardContentList.split(",");
				ContentsBoardColumnVo contentsBoardColumnVo = null;
				for (int i = 0; i < boardSetContentArr.length; i++) {
					contentsBoardColumnVo = new ContentsBoardColumnVo();
					contentsBoardColumnVo.setContentsBoardOpIdx(contentsBoardOptionVo.getContentsBoardOpIdx());
					contentsBoardColumnVo.setContentsBoardColumnName(String.valueOf(boardSetContentArr[i]));
					contentsBoardColumnVo.setContentsBoardColumnType("2");
					contentsBoardColumnVo.setContentsBoardColumnOrder(i);
					contentsBoardColumnVo.setContentsBoardColumnIdx(i);
					columnList.add(contentsBoardColumnVo);
				}
			}
			contentBoardOptionService.saveContentBoards(contentsBoardOptionVo);
			if (banList.size() > 0) {
				contentBoardOptionService.deleteContentsBoardBanWords(banList);
				contentBoardOptionService.saveContentsBoardBanWords(banList);
			}
			if (columnList.size() > 0) {
				contentBoardOptionService.deleteContentsBoardColumns(columnList);
				contentBoardOptionService.saveContentsBoardColumns(columnList);
			}
			txManager.commit(txStatus);

		} catch (Exception ex) {
			ex.printStackTrace();
			txManager.rollback(txStatus);
		}
		return "redirect:/admin/content/boardOption/list";
	}
}
