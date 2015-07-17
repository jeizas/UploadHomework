package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.model.Course;
import com.spring.model.Student;
import com.spring.model.Teacher;
import com.spring.service.AdminService;
import com.spring.service.CourseService;
import com.spring.service.StudentService;
import com.spring.service.TeacherService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Resource
	private AdminService  adminService = null;
	@Resource
	private TeacherService teacherService = null;
	@Resource
	private StudentService studentService = null;
	@Resource 
	private CourseService courseService = null;
	
	@RequestMapping(value="/homePage",method=RequestMethod.GET)
	public String homePage(HttpServletRequest request,Model model){
		String ano =decrypt( request.getParameter("id") );
		System.out.println(ano);
		model.addAttribute("ano", ano);
		return "admin/homePage";
	}
	/*
	 * 管理老师
	 */
	@RequestMapping(value="/teacherManage",method=RequestMethod.GET)
	public String teacherManege(Model model){
		List<Teacher> tealist = teacherService.getAll();
		model.addAttribute("tealist",tealist);
		return "admin/teacherManage";
	}
	//修改老师
	@RequestMapping(value="/updteacher",method=RequestMethod.GET)
	public String updteacher(HttpServletRequest request,Model model){
		String tno = request.getParameter("tno");
		Teacher tea = teacherService.selectBytno(tno);
		model.addAttribute("tea", tea);
		return "admin/updteacher";
	}
	@RequestMapping(value="/updteacher",method=RequestMethod.POST)
	public String updteacher(@PathVariable MultipartFile timage ,HttpServletRequest request) throws IOException{
		String tno = request.getParameter("tno");
		String tname = request.getParameter("_tname");
		String tpwd = request.getParameter("_tpwd");
		if(timage.getOriginalFilename()!=""){
			String realpath = request.getSession().getServletContext().getRealPath("/images");//得到文件夹路径
			File f=new File(realpath+"/"+timage.getOriginalFilename());//判断文件名是否存在  以要上传的文件路径和新建文件
			FileUtils.copyInputStreamToFile(timage.getInputStream(),f);
			System.out.println("图片存入..."+teacherService.updateToimage( tno,timage.getOriginalFilename()));
		}
		System.out.println(teacherService.updateTmp(tno, tname, tpwd));
		return "redirect:/admin/updteacher";
	}
	//删除老师
	@RequestMapping(value="/delteacher",method=RequestMethod.GET)
	public String delteacher(HttpServletRequest request){
		String tno = request.getParameter("tno");
		System.out.println(teacherService.deleteBytno(tno));
		return "redirect:/admin/teacherManage";
	}
	//增加老师
	@RequestMapping(value="/addteacher",method=RequestMethod.GET)
	public String addteacher(){
		return "admin/addteacher";
	}
	@RequestMapping(value="/addteacher",method=RequestMethod.POST)
	public String addteacher(@PathVariable MultipartFile timage, HttpServletRequest request) throws IOException{
		String tno = request.getParameter("tno");
		String tname = request.getParameter("tname");
		String tpwd = request.getParameter("tpwd");
		if(timage.getOriginalFilename() != null){
			String realpath = request.getSession().getServletContext().getRealPath("/images");//得到文件夹路径
			File f=new File(realpath+"/"+timage.getOriginalFilename());//判断文件名是否存在  以要上传的文件路径和新建文件
			FileUtils.copyInputStreamToFile(timage.getInputStream(),f);		
		}
		System.out.println(teacherService.insertAll(tno, tpwd, tname,timage.getOriginalFilename()));
		return "redirect:/admin/teacherManage";
	}
	
	/*
	 * 管理学生
	 */
	@RequestMapping(value="/studentManage",method=RequestMethod.GET)
	public String studentManage(Model model){
		List<Student> stulist = studentService.getAll();
		model.addAttribute("stulist", stulist);
		return "admin/studentManage";
	}
	//增加学生
	@RequestMapping(value="/addstudent",method=RequestMethod.GET)
	public String addstudent(){
		return "admin/addstudent";
	}
	@RequestMapping(value="/addstudent",method=RequestMethod.POST)
	public String addatudent(HttpServletRequest request){
		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		String spwd = request.getParameter("spwd");
		String smajor = request.getParameter("smajor");
		String sgrade = request.getParameter("sgrade");
		String sclass = request.getParameter("sclass");
		System.out.println("增加学生..."+studentService.insertAll(sno, spwd, sname, smajor, sgrade, sclass));
		return "redirect:/admin/studentManage";
	}
	//删除学生
	@RequestMapping(value="delstudent",method=RequestMethod.GET)
	public String delstudent(HttpServletRequest request){
		String sno = request.getParameter("sno");
		System.out.println("删除学生..."+studentService.deleteBykey(sno));
		return "redirect:/admin/studentManage";
	}
	//修改学生
	@RequestMapping(value="updstudent",method=RequestMethod.GET)
	public String updstudent(Model model,HttpServletRequest request){
		String sno = request.getParameter("sno");
		Student stu = studentService.selectBysno(sno);
		model.addAttribute("stu", stu);
		return "admin/updstudent";
	}
	@RequestMapping(value="updstudent",method=RequestMethod.POST)
	public String updstudent(HttpServletRequest request){
		String sno = request.getParameter("sno");
		String sname  =request.getParameter("sname");
		String spwd = request.getParameter("spwd");
		String smajor = request.getParameter("smajor");
		String sgrade = request.getParameter("sgrade");
		String sclass = request.getParameter("sclass");
		System.out.println("更新学生..."+studentService.updateBykey(sno, spwd, sname, smajor, sgrade, sclass));
		return "redirect:/admin/studentManage";
	}
	/*
	 * 管理课程
	 */
	@RequestMapping(value="/courseManage",method=RequestMethod.GET)
	public String courseManage(Model model){
		List<Course> coulist = courseService.getAll();
		model.addAttribute("coulist",coulist);
		return "admin/courseManage";
	}
	//添加课程
	@RequestMapping(value="/addcourse",method=RequestMethod.GET)
	public String addcourse(){
		return "admin/addcourse";
	}
	@RequestMapping(value="/addcourse",method=RequestMethod.POST)
	public String addcourse(@PathVariable MultipartFile cimage, HttpServletRequest request) throws IOException{
		String cno = request.getParameter("cno");
		String cname = request.getParameter("cname");
		String csummary = request.getParameter("csummary");
		if(cimage.getOriginalFilename() != null){
			String realpath = request.getSession().getServletContext().getRealPath("/images");//得到文件夹路径
			File f=new File(realpath+"/"+cimage.getOriginalFilename());//判断文件名是否存在  以要上传的文件路径和新建文件
			FileUtils.copyInputStreamToFile(cimage.getInputStream(),f);		
		}
		System.out.print("增加课程..."+courseService.insertAll(cno, cname, csummary, cimage.getOriginalFilename()));
		return "redirect:/admin/courseManege";
	}
	//delete course
	@RequestMapping(value="delcourse",method=RequestMethod.GET)
	public String delcourse(HttpServletRequest request){
		String cno = request.getParameter("cno");
		System.out.println("删除学生..."+courseService.deleteBykey(cno));
		return "redirect:/admin/studentManage";
	}
	//update course
	@RequestMapping(value="/updcourse",method=RequestMethod.GET)
	public String updcourse(HttpServletRequest request,Model model){
		String cno = request.getParameter("cno");
		Course cou = courseService.selectBycno(cno);
		model.addAttribute("cou", cou);
		return "admin/updcourse";
	}
	@RequestMapping(value="/updcourse",method=RequestMethod.POST)
	public String updcourse(@PathVariable MultipartFile cimage ,HttpServletRequest request) throws IOException{
		String cno = request.getParameter("cno");
		String cname = request.getParameter("cname");
		String csummary = request.getParameter("csummary");
		if(cimage.getOriginalFilename()!=""){
			String realpath = request.getSession().getServletContext().getRealPath("/images");//得到文件夹路径
			File f=new File(realpath+"/"+cimage.getOriginalFilename());//判断文件名是否存在  以要上传的文件路径和新建文件
			FileUtils.copyInputStreamToFile(cimage.getInputStream(),f);
			System.out.println("图片存入..."+courseService.updateToimage(cno, cimage.getOriginalFilename()));
		}
		System.out.println(courseService.updateCMY(cno, cname, csummary));
		return "redirect:/admin/courseManage";
	}
	/*
	 * 修改密码
	 * 
	 */
	@RequestMapping(value="changePassword",method=RequestMethod.GET)
	public String changePassword(){
		return "admin/changePassword";
	}
	@RequestMapping(value="changePassword",method=RequestMethod.POST)
	public String changePassword(HttpServletRequest request){
		String ano =decrypt( request.getParameter("id") );
		String apwd = request.getParameter("apwd");
		System.out.println("更新密码..."+adminService.updateBykey(ano, apwd));
		return "admin/changePassword";
	}
	
	/*MD5解密算法*/
	public static String decrypt(String ssoToken)  {  
		try  {  
        	char[] ac = ssoToken.toCharArray();
        	StringBuilder str = new StringBuilder();
        	for(int i=0;i<ac.length;i++){
        		char a = (char) ((int)ac[i]-3);
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
