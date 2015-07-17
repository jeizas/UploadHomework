package com.spring.controller;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dao.UseException;
import com.spring.model.Admin;
import com.spring.model.Student;
import com.spring.model.Teacher;
import com.spring.service.AdminService;
import com.spring.service.StudentService;
import com.spring.service.TeacherService;

@Controller
public class LoginController {
	
	@Resource
	private StudentService studentService = null;
	@Resource
	private TeacherService teacherService = null;
	@Resource 
	private AdminService adminService = null;
	
	/*
	 * 用户登录
	 *学生学号9个字节，老师5个字节，用于区分不不同的用户 
	 * 登录*/
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String number,String password,Model model,HttpSession session) throws UseException{
		switch(number.length()){
		case 9:
			System.out.println("学生登录");
			List<Student> stulist = studentService.getAll();
			for(Student s:stulist){
				if(s.getSno().equals(number) && s.getSpwd().equals(password)){
					
					model.addAttribute("id",encrypt(s.getSno()));//调用加密算法
					session.setAttribute("id", encrypt(s.getSno()));
					return "redirect:/student/homePage";//类之间传值用Model
				}
				else if(s.getSno().equals(number) && s.getSpwd()!=password){
					throw new UseException("用户名或密码不正确");	
				}
			}
			throw new UseException("用户名或密码不正确");
		case 5:
			System.out.println("***老师登录***");
			List<Teacher> tealist = teacherService.getAll();
			for(Teacher t:tealist){
				if(t.getTno().equals(number) && t.getTpwd().equals(password)){
					model.addAttribute("id",encrypt(t.getTno()));//调用加密算法
					session.setAttribute("id", encrypt(t.getTno()));
					return "redirect:/teacher/homePage";//类之间传值用Model
				}
				else if(t.getTno().equals(number) && t.getTpwd()!=password){
					throw new UseException("用户名或密码不正确！！！");	
				}
			}
			throw new UseException("用户名或密码不正确");
		case 7:
			System.out.println("***管理员登录***");
			List<Admin> adminlist = adminService.getAll();
			for(Admin t:adminlist){
				if(t.getAno().equals(number) && t.getApwd().equals(password)){
					model.addAttribute("id",encrypt(t.getAno()));//调用加密算法
					session.setAttribute("id", encrypt(t.getAno()));
					session.setAttribute("ano",t.getAno());
					return "redirect:/admin/homePage";//类之间传值用Model
				}
				else if(t.getApwd().equals(number) && t.getAno()!=password){
					throw new UseException("用户名或密码不正确！！！");	
				}
			}
			throw new UseException("用户名或密码不正确");
		default:
			throw new UseException("用户名不正确！！！");	
		}		
	}
	/*
	 * 注销登录
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String loginout(HttpServletRequest request){
		// 清除session
		Enumeration<String> em = request.getSession().getAttributeNames();
	    while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		request.getSession().invalidate();
		String path = request.getContextPath();
		// 拼接跳转页面路径
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		System.out.println(basePath);
		return "redirect:" + basePath;
}

	/*MD5加密算法*/
	public static String encrypt(String ssoToken){  
        try  {  
        	char[] ac = ssoToken.toCharArray();
        	StringBuilder str = new StringBuilder();
        	for(int i=0;i<ac.length;i++){
        		char a = (char) ((int)ac[i]+3);
        		str.append(a);
        	}
        	return str.toString();
       }
        catch(Exception e)  {  
        	e.printStackTrace() ;  
        	return null;  
       }  
     }  

}
