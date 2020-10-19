package org.mariapresso.impd.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.constant.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	LocaleResolver resolver;

	/**
	 * TODO 설정값을 세팅하는 방식으로 변할필요가 있슴.
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "/a", "/index**", "/default**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage(HttpServletRequest request) {
		if (request.isUserInRole("ADMIN") || request.isUserInRole("SYSADMIN")) {
			return new ModelAndView("redirect:/distribution/getDistributionJobQueueListForm.do");
		} else if (request.isUserInRole("LINEUP-QC")) {
			return new ModelAndView("redirect:/lineup/getLineupQCListForm.do");
		} else if (request.isUserInRole("LINEUP")) {
			return new ModelAndView("redirect:/lineup/getLineupWorkflowListForm.do");
		} else if (request.isUserInRole("QC")) {
			return new ModelAndView("redirect:/qc/getQcSearchForm.do");
		} else if (request.isUserInRole("MATERIAL") || request.isUserInRole("USER")) {
			return new ModelAndView("redirect:/material/getMaterialSearchForm.do");
		} else {
			ModelAndView model = new ModelAndView();
			model.addObject("title", "Dashboard");
			model.addObject("page", "dashboard/default");
			model.setViewName(Pages.main.viewAdmin((String)model.getModelMap().get("page")));//
			return model;
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username or password!");
			System.out.println("error-" + error);
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("home/login");

		return model;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login.do?logout";
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "common/exception/access_denied_page";
	}

	@RequestMapping(value = "/setLocale", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String setLocale(@RequestParam("locale") String locale, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Locale l = new Locale(locale);
			resolver.setLocale(request, response, l);
			resolver.resolveLocale(request);
		} catch (Exception e) {
			log.error(String.format("Exeption[%s]", e.getMessage()));
			return "Set Locale Error";
		}

		return "Success";
	}
}
