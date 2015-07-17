package com.spring.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.UseException;
import com.spring.model.Comments;
import com.spring.model.Course;
import com.spring.model.Coursedata;
import com.spring.model.SC;
import com.spring.model.Settask;
import com.spring.model.Student;
import com.spring.service.CommentsService;
import com.spring.service.CourseService;
import com.spring.service.CoursedataService;
import com.spring.service.ScService;
import com.spring.service.SettaskService;
import com.spring.service.StudentService;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	private Student student;
	@Resource
	private StudentService studentService = null;
	@Resource
	private CourseService courseService = null;
	@Resource
	private SettaskService settaskService = null;
	@Resource
	private ScService scService = null;
	@Resource
	private CoursedataService coursedataService = null;
	@Resource
	private CommentsService commentsService = null;
	
	/*
	 * 登录成功到首页
	 */
	@RequestMapping(value="/homePage",method=RequestMethod.GET)
	public String homePage(HttpServletRequest request,HttpSession session,Model model){
		//System.out.println(request.getParameter("id"));
		String sno =decrypt( request.getParameter("id") );
		//System.out.println(sno);
		student = studentService.selectBysno(sno);
		model.addAttribute("sname",student.getSname());//首页显示用户的登录名
		session.setAttribute("student", student);
		
		return "student/homePage";
	}
	
	/*
	 * 课程管理页面
	 * 在页面显示其所学的所有课程
	 */
	@RequestMapping(value="/courseManage",method=RequestMethod.GET)
	public String courseMamage(Model model){
		List<Course> courseList = courseService.getAll();
		model.addAttribute("courseList", courseList);
		return "student/courseManage";
		
	}
	
	/*
	 * 进入上传作业的页面
	 */
	
	@RequestMapping(value="/uploadHomework/{cno}",method=RequestMethod.GET)
	public String uploadHomework(@PathVariable String cno,String page,Model model){		
		int pageSize =10;//分页设计
		List<SC> sclist = scService.selectBysnocno(student.getSno(), cno);;      
        //查到的总用户数
        model.addAttribute("scNum", sclist.size());
        //总页数
        Integer pageTimes;
        if(sclist.size()%pageSize == 0)
        {
            pageTimes = sclist.size()/pageSize;
        }
        else{
            pageTimes = sclist.size()/pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);     
        //页面初始的时候page没有值
        if(null == page){
            page = "1";
        }   
        //每页开始的第几条记录            
        Integer startRow = (Integer.parseInt(page)-1) * pageSize;
        
        Map<String,Object> map =new HashMap<String,Object>();      
        map.put("sno", student.getSno());
        map.put("cno",cno);
        map.put("startRow",startRow);
        map.put("pageSize",pageSize);
        List<SC> sclistbypage = scService.getscFromsnocnoByPage(map);
        
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("sc", sclistbypage);
		
		
		Course course = courseService.selectBycno(cno);
		model.addAttribute("course", course);//课程信息投影到下一个页面
		model.addAttribute("student", student);//用户的登录信息
		List<Settask> tasklist = settaskService.getAll(cno);
		model.addAttribute("tasklist", tasklist);//作业次数,内容显示到下一页
		//显示上交的作业
		System.out.println(student.getSno()+cno);
		System.out.println(sclist);
		model.addAttribute("sclist", sclist);
		
		return "student/uploadHomework";
	}
	
	/*
	 * 点击上传文件按钮上传文件
	 */
	@RequestMapping(value="/{cno}/upfile",method=RequestMethod.POST)
	public String upfile(@PathVariable String cno ,@PathVariable MultipartFile attach,HttpServletRequest request,Model model) throws IOException, UseException{
		String times = request.getParameter("times");//获得要上传作业的次数
		System.out.println(cno+times);
		//根据cno和sctimes查找结束时间
		Settask task = settaskService.selectBycnosctimes(cno, times);
		java.util.Date  date=new java.util.Date();
		java.sql.Date  date1=new java.sql.Date(date.getTime());
		if(date1.getTime()>task.getStoptime().getTime()){//如果超时
			//System.out.println("1212121212");
			//request.setAttribute("error", "上传失败，作业提交已结束，请联系老师");
			return "redirect:/student/uploadHomework/{cno}";
		}
		System.out.println("343433");
		System.out.println(student.getSname()+"我在上交作业... ...");//后台输出信息
		if(attach.getOriginalFilename()==""){
			System.out.println("文件无效！！！");
			throw new UseException("文件不能为空");
		}
		//Course course = courseService.selectBycno(cno);//根据课程名字查询相关课程的信息
		System.out.println(attach.getName()+","+attach.getOriginalFilename()+","+attach.getContentType());//显示要上传的文件名
		String realpath = request.getSession().getServletContext().getRealPath("/resource/upload")+student.getSno();//得到文件夹路径
		System.out.println(realpath);//输出文件路径
		File file = new File(realpath);//判断该学生对应的文件夹是名是否存在
		if(!file.exists()  && !file.isDirectory()) {   
		    	System.out.println("//文件夹不存在，已创建");
		    	file.mkdir();      
		}
		else{
			System.out.println("文件夹存在");
		}
		File f=new File(realpath+"/"+attach.getOriginalFilename());//判断文件名是否存在  以要上传的文件路径和新建文件
		FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
		//request.setAttribute("files",filelist(request,id));
		//java.util.Date  date=new java.util.Date();
		//java.sql.Date  date1=new java.sql.Date(date.getTime());//获取当前系统时间，并将其转换成sql的时间格式
		String sno = student.getSno();
		Integer sctimes = Integer.valueOf(times);
		SC sc = new SC(sno,cno,sctimes,attach.getOriginalFilename(),date1);
		System.out.println("sc--->"+sc );//信息存入数据库中
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sno", student.getSno());
		map.put("cno", cno);
		map.put("sctimes", sctimes);
		
		String record =scService.selectAllbykey(map);//数据库中传String和Intrger所以要用Map传值
		
		System.out.println("record--->"+record);
		
		if(record != null){
			System.out.println(scService.updatebykey(sc)+"条记录已经更新... ...");
		}
		else{
			System.out.println(scService.insertSelective(sc) +"数据已经存入数据库... ...");//先判断主键（sno，cno，wtimes）是否存在，如果存在更新，否则插入数据
		}
		System.out.println("作业上传成功！！！");
		model.addAttribute("sno", student.getSno());
		return "redirect:/student/uploadHomework/{cno}";
	}
	/*
	 * 显示评语
	 */
	@RequestMapping(value="/{sno}/{cno}/{sctimes}/showComment",method=RequestMethod.GET)
	public String showComment(@PathVariable String sno,@PathVariable String cno,@PathVariable String sctimes,Model model){
		String comment = sno+cno+sctimes;
		System.out.println(comment);
		Comments comments = commentsService.selectBycomment(comment);
		//是否允许看
		Map<String,Object> map =new HashMap<String,Object>();      
        map.put("sno", sno);
        map.put("cno",cno);
        map.put("sctimes",sctimes);
		SC sc = scService.selectBysnocnosctimes(map);
		System.out.println(sc.getAllowlook());
		if(sc.getAllowlook()== null){
			java.util.Date  date=new java.util.Date();
			java.sql.Date  date1=new java.sql.Date(date.getTime());
			Comments c = new Comments(comment,date1,"无","正在评阅中...请稍后查看...");
			model.addAttribute("comment", c);
		}
		else{
			model.addAttribute("comment", comments);
			//时间转换
			java.sql.Date sqltime=new java.sql.Date(comments.getComtime().getTime());
			model.addAttribute("sqltime",sqltime);
		}		
		//course
		Course course = courseService.selectBycno(cno);
		model.addAttribute("course", course);
		//sc
		/*Map<String,Object> map =new HashMap<String,Object>();      
        map.put("sno", sno);
        map.put("cno",cno);
        map.put("sctimes",sctimes);
		SC sc = scService.selectBysnocnosctimes(map);*/
		model.addAttribute("sc",sc);
		//task
		Settask task = settaskService.selectBycnosctimes(cno, sctimes);
		model.addAttribute("task", task);
		//comment表中查找评语相关的内容
		return "student/showComment";
	}
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String home(HttpServletRequest request,Model model){
		student = studentService.selectBysno(request.getParameter("sno"));
		model.addAttribute("sname",student.getSname());//首页显示用户的登录名
		return "student/homePage";
	}
	
	/*
	 * 资料
	 */
	@RequestMapping(value="/webSource",method=RequestMethod.GET)
	public String webSource(Model model){
		List<Coursedata> datalist = coursedataService.selectAll();
		model.addAttribute("datalist", datalist);
		return "student/webSource";
	}
	
	//下载资料
	@RequestMapping(value="/{cno}/{dfile}/download",method=RequestMethod.GET) //
    public String downloaddata(@PathVariable String cno,@PathVariable String dfile, HttpServletRequest request, HttpServletResponse response,Model model)throws Exception {     
    	//fileName = CharacterTool.enCodeStr(fileName);//此处出现了乱码。这个函数用来转码，后来看到设置tomcat就好了
		System.out.println(cno + dfile);
    	response.setContentType("text/html;charset=utf-8");  
        request.setCharacterEncoding("utf-8"); 
        BufferedInputStream bis = null;   
        BufferedOutputStream bos = null;   
        System.out.println("文件"+dfile+"已被选中下载");
        String ctxPath = request.getSession().getServletContext().getRealPath("/resource/upload")+cno;   
        String downLoadPath = ctxPath + "/"+dfile;   
        System.out.println("当前路径"+downLoadPath);   
        try {   
            long fileLength = new File(downLoadPath).length();   
            response.setContentType("application/x-msdownload;");   
            response.setHeader("Content-disposition", "attachment; filename="+ new String(dfile.getBytes("utf-8"), "ISO8859-1"));   
            response.setHeader("Content-Length", String.valueOf(fileLength));   
            bis = new BufferedInputStream(new FileInputStream(downLoadPath));   
            bos = new BufferedOutputStream(response.getOutputStream());   
            byte[] buff = new byte[2048];   
            int bytesRead;   
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {   
                bos.write(buff, 0, bytesRead);   
            }   
        	} 
         catch (Exception e) {   
            e.printStackTrace();   
         	} 
         finally { 
        	 model.addAttribute("bos", bos);
            if (bis != null)   
                bis.close();   
            if (bos != null)   
                bos.close();   
        }   
        return null;   
    }
	
	
	
	/*
	 * 有'localhost:8080/uploadHomework/aboutUs'时跳转到“关于我们”的页面
	 * 关于我们的页面*/
	@RequestMapping(value="/aboutUs",method=RequestMethod.GET)
	public String aboutUs(){
		return "student/aboutUs";
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

