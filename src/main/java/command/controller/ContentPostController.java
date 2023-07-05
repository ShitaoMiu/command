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

 import command.service.ContentPostService;
import command.vo.ContentsBoardBanWordVo;
import command.vo.ContentsBoardColumnVo;
import command.vo.ContentsBoardOptionVo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ContentPostController {

	@Resource(name = "contentPostService")
	private ContentPostService contentPostService;

	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;  

	private static final Logger logger = LogManager.getLogger(ContentPostController.class);

//	@RequestMapping(value = "/admin/content")
//	public String adminContentPost(HttpServletRequest request, @ModelAttribute("searchVO") ContentsBoardVo contentsBoardVo,ModelMap model) {
//		return "redirect:/admin/content/post";
//	}

	@RequestMapping(value = "/admin/content/post")
	public String contentPost(HttpServletRequest request, @ModelAttribute("searchVO") ContentsBoardOptionVo contentsBoardVo,ModelMap model) {
 
		return "/admin/content/post/post.tiles";
	}

	 
}
