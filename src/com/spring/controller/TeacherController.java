package com.spring.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
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

import com.spring.model.Comments;
import com.spring.model.Course;
import com.spring.model.Coursedata;
import com.spring.model.SC;
import com.spring.model.Settask;
import com.spring.model.Student;
import com.spring.model.Teacher;
import com.spring.service.CommentsService;
import com.spring.service.CourseService;
import com.spring.service.CoursedataService;
import com.spring.service.ScService;
import com.spring.service.SettaskService;
import com.spring.service.StudentService;
import com.spring.service.TeacherService;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
	
	private Teacher teacher;
	@Resource
	private TeacherService teacherService = null ;
	@Resource 
	private CourseService courseService = null ;
	@Resource
	private SettaskService settaskService = null;
	@Resource 
	private StudentService studentService = null;
	@Resource
	private ScService scService = null;
	@Resource
	public CommentsService commentsService = null;
	@Resource
	public CoursedataService coursedataService = null;
	
	/*
	 * 登录成功后进入主页
	 * 通过前页的model传值
	 */
	@RequestMapping(value="/homePage",method=RequestMethod.GET)
	public String homePage(Model model,HttpServletRequest request,HttpSession session){
		String tno = decrypt(request.getParameter("id"));
		teacher = teacherService.selectBytno(tno);
		session.setAttribute("teacher", teacher);
		return "teacher/homePage";
	}
	/*
	 * 课程管理页面
	 */
	@RequestMapping(value="/courseManage",method=RequestMethod.GET)
	public String courseManage(Model model){
		List<Course> courseList = courseService.getAll();
		model.addAttribute("courseList", courseList);
		return "teacher/courseManage";
	}
	/*
	 * 老师查看作业
	 */
	@RequestMapping(value="/lookHomework/{cno}",method=RequestMethod.GET)
	public String lookHomeWork(@PathVariable String cno,String page,HttpSession session,Model model){
		int pageSize =10;//分页设计
		List<SC> scList = scService.selectBycno(cno);     
        //查到的总用户数
        model.addAttribute("scNum", scList.size());
        //总页数
        Integer pageTimes;
        if(scList.size()%pageSize == 0)
        {
            pageTimes = scList.size()/pageSize;
        }
        else{
            pageTimes = scList.size()/pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);     
        //页面初始的时候page没有值
        if(null == page){
            page = "1";
        }   
        //每页开始的第几条记录            
        Integer startRow = (Integer.parseInt(page)-1) * pageSize;
        
        Map<String,Object> map =new HashMap<String,Object>();      
        map.put("cno",cno);
        map.put("startRow",startRow);
        map.put("pageSize",pageSize);
        List<SC> sclistbypage = scService.getscFromcnoByPage(map);
        
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("sclist", sclistbypage);
        
		
		
		Course course = courseService.selectBycno(cno);
		session.setAttribute("course", course);//老师信息
		session.setAttribute("teacher", teacher);//课程信息
		//作业信息
		List<Settask> tasklist = settaskService.getAll(cno);
		model.addAttribute("tasklist", tasklist);//作业次数,内容显示到下一页
		//班级信息
		List<String> sclass = studentService.selectSclass();
		session.setAttribute("sclass", sclass);
		//List<SC> scList = scService.selectBycno(cno);//课程全部上交的作业		
		//model.addAttribute("sclist", scList);
		return "teacher/lookHomework";
	}
	//按班级查询
	@RequestMapping(value="/select/{cno}",method=RequestMethod.POST)
	public String selectHomework(@PathVariable String cno,String sclass,String sctimes,String page,Model model){
		int pageSize =10;//分页设计		
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("sclass",sclass);
		map1.put("sctimes",sctimes);
		map1.put("cno",cno);		
		List<SC> scList = scService.selectBysclasstimes(map1);    
        //查到的总用户数
        model.addAttribute("scNum", scList.size());
        //总页数
        Integer pageTimes;
        if(scList.size()%pageSize == 0)
        {
            pageTimes = scList.size()/pageSize;
        }
        else{
            pageTimes = scList.size()/pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);     
        //页面初始的时候page没有值
        if(null == page){
            page = "1";
        }   
        //每页开始的第几条记录            
        Integer startRow = (Integer.parseInt(page)-1) * pageSize;
        
        Map<String,Object> map =new HashMap<String,Object>();      
        map.put("sclass",sclass);
      	map.put("sctimes",sctimes);
      	map.put("cno", cno);
        map.put("startRow",startRow);
        map.put("pageSize",pageSize);
        List<SC> sclistbypage = scService.getscFromsclasstimesByPage(map);
        
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("sclist", sclistbypage);
		
		
		//作业信息
		List<Settask> tasklist = settaskService.getAll(cno);
		model.addAttribute("tasklist", tasklist);//作业次数,内容显示到下一页
		return "teacher/lookHomework_F";
	}
	//按学号查询
	@RequestMapping(value="/selectBysno/{cno}",method=RequestMethod.POST)
	public String selectBysno(@PathVariable String cno,String sno,String page,Model model){
		int pageSize =10;//分页设计
		List<SC> scList = scService.selectBysnocno(sno, cno);    
        //查到的总用户数
        model.addAttribute("scNum", scList.size());
        //总页数
        Integer pageTimes;
        if(scList.size()%pageSize == 0)
        {
            pageTimes = scList.size()/pageSize;
        }
        else{
            pageTimes = scList.size()/pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);     
        //页面初始的时候page没有值
        if(null == page){
            page = "1";
        }   
        //每页开始的第几条记录            
        Integer startRow = (Integer.parseInt(page)-1) * pageSize;
        
        Map<String,Object> map =new HashMap<String,Object>();      
        map.put("sno",sno);
      	map.put("cno",cno);
        map.put("startRow",startRow);
        map.put("pageSize",pageSize);
        List<SC> sclistbypage = scService.getscFromsnocnoByPage(map);
        
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("sclist", sclistbypage);
		
		
		//作业信息
		List<Settask> tasklist = settaskService.getAll(cno);
		model.addAttribute("tasklist", tasklist);//作业次数,内容显示到下一页
		//List<SC> scList = scService.selectBysnocno(sno, cno);
		//model.addAttribute("sclist", scList);
		return "teacher/lookHomework_S";		
	}
	
	/*
	 * 未交作业学生名单
	 */
	@RequestMapping(value="/unupload/{cno}",method=RequestMethod.POST)
	public String unupload(@PathVariable String cno,String page,HttpServletRequest request,Model model){
		String sclass = request.getParameter("sclass");
		String sctimes = request.getParameter("sctimes");
		model.addAttribute("sctimes",sctimes);
		Map<String,Object> map = new HashMap<>();
		map.put("cno", cno);
		map.put("sclass", sclass);
		map.put("sctimes",sctimes);
		
		int pageSize =10;//分页设计
		List<Student> stulist = studentService.selectUnupload(map);    
        //查到的总用户数
        model.addAttribute("scNum", stulist.size());
        //总页数
        Integer pageTimes;
        if(stulist.size()%pageSize == 0)
        {
            pageTimes = stulist.size()/pageSize;
        }
        else{
            pageTimes = stulist.size()/pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);     
        //页面初始的时候page没有值
        if(null == page){
            page = "1";
        }   
        //每页开始的第几条记录            
        Integer startRow = (Integer.parseInt(page)-1) * pageSize;
        
        Map<String,Object> map1 =new HashMap<String,Object>();      
        map1.put("cno", cno);
		map1.put("sclass", sclass);
		map1.put("sctimes",sctimes);
        map1.put("startRow",startRow);
        map1.put("pageSize",pageSize);
        List<Student> stulistbypage = studentService.getstudentFromsnocnoByPage(map1);
        
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("stulist", stulistbypage);
		
		//List<Student> stulist = studentService.selectUnupload(map);
		//model.addAttribute("stulist",stulist);
	
		//作业信息
		List<Settask> tasklist = settaskService.getAll(cno);
		model.addAttribute("tasklist", tasklist);//作业次数,内容显示到下一页
		return "teacher/unuploadwork";
	}
	
	
	/*
	 * 允许学生看
	 * 
	 */
	@RequestMapping(value="/allowlook/{cno}",method=RequestMethod.POST)
	public String allowlook(@PathVariable String cno,String sclass,String sctimes,String page,Model model){
		System.out.println("该班该此作业可"+scService.updateTOallowlook(cno, sctimes));		
		return "redirect:/teacher/lookHomework/{cno}";
	}
	/*
	 * 更改签名
	 */
	@RequestMapping(value="/changeSign/{cno}",method=RequestMethod.POST)
	public String changeSign(@PathVariable MultipartFile attach, HttpServletRequest request) throws IOException{
		String realpath = request.getSession().getServletContext().getRealPath("/images");//得到文件夹路径
		File f=new File(realpath+"/"+attach.getOriginalFilename());//判断文件名是否存在  以要上传的文件路径和新建文件
		FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
		System.out.println("图片存入..."+teacherService.updateToimage( teacher.getTno(),attach.getOriginalFilename()));
		return "redirect:/teacher/lookHomework/{cno}";
	}
	/*@PathVariable MultipartFile attach,
	 * 写评语的页面
	 */
	@RequestMapping(value="/comment",method=RequestMethod.GET)
	public String comment(HttpServletRequest request,Model model,HttpSession session){
		String sno = request.getParameter("sno");
		String cno = request.getParameter("cno");
		String sctimes = request.getParameter("sctimes");
		model.addAttribute("sno", sno);
		model.addAttribute("cno", cno);
		model.addAttribute("sctimes", sctimes);
		//查询学生信息
		Student student = studentService.selectBysno(sno);
		model.addAttribute("student", student);
		//查询课程信息
		Settask settask = settaskService.selectBycnosctimes(cno, sctimes);
		model.addAttribute("task", settask);
		//查看是否有评论，如果没有加入签名
		Comments comments = commentsService.selectBycomment(sno+cno+sctimes);
		//System.out.println(comments);
		if(comments == null){
			String image = "<img src=\"./images/ "+ teacher.getTimage()+" \"  style=\"float:right; width:60px;height:40px;margin:15px 20px auto auto;\" />";
			//System.out.println(image);
			model.addAttribute("image", image);
		}
		else{
			model.addAttribute("comments",comments );
			java.sql.Date sqltime=new java.sql.Date(comments.getComtime().getTime());//时间转换
			model.addAttribute("sqltime",sqltime);
			//是否允许看所对应的记录
			Map<String,Object> map =new HashMap<String,Object>();
			map.put("sno",sno);
			map.put("cno", cno);
			map.put("sctimes", sctimes);
			SC sc = scService.selectBysnocnosctimes(map);
			model.addAttribute("sc",sc);
		}
		return "teacher/comment";
	}
	/*保存评论*/
	@RequestMapping(value="/comment",method=RequestMethod.POST)
	public String comment1(@PathVariable MultipartFile attach,HttpServletRequest request,Model model) throws ParseException, IOException{
		String sno = request.getParameter("sno");
		String cno = request.getParameter("cno");
		String sctimes = request.getParameter("sctimes");//接受页面信息评语学号、课程号、作业次数
		
		model.addAttribute("sno", sno);
		model.addAttribute("cno", cno);
		model.addAttribute("sctimes", sctimes);	//next page	
		//接受页面传值
		String comment = sno+cno+sctimes;//comments---->comment评语号
		String allowlook = request.getParameter("allowlook");//sc----->allowlook是否允许看
		String comremark = request.getParameter("comremark");//comments----->comremark评语
		String comtime = request.getParameter("time");//comments------>time评语时间
		String comscore = request.getParameter("comscore");//comments------>comscore分数
		///存文件。
		if(attach.getOriginalFilename() != ""){
			String realpath = request.getSession().getServletContext().getRealPath("/resource/upload")+sno;//得到文件夹路径
			System.out.println(realpath+"  "+attach.getOriginalFilename());//输出文件路径
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
		    //文件修改成功
			Map<String, Object> map1 = new HashMap<String,Object>();
			map1.put("sno",sno);
	      	map1.put("cno",cno);
	        map1.put("sctimes",sctimes);
	        map1.put("scfile",attach.getOriginalFilename());
	        //map1.put("allowlook", allowlook);
			System.out.println("文件名更新..."+scService.updateToscfile(map1));//updata sc--->scfile
		}	
		Map<String, Object> map2 = new HashMap<String,Object>();
		map2.put("sno",sno);
      	map2.put("cno",cno);
        map2.put("sctimes",sctimes);
        map2.put("allowlook", allowlook);
		System.out.print("是否允许看更新..."+scService.updateTolook(map2));
		//System.out.println(sno+cno+sctimes+allowlook);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("comment", comment);
		map.put("comscore", comscore);
		map.put("comtime",comtime);
		map.put("comremark", comremark);
		//查看是否已经评阅,并且更新
		Comments comments = commentsService.selectBycomment(comment);
		//System.out.println(comments);
		if(comments==null){
			System.out.println(commentsService.insertComments(map));
		}
		else{	
			System.out.println(commentsService.updateBycomment(map));
			model.addAttribute("comments", comments);
		}
		return "redirect:/teacher/comment";
	}
	
	
	/*
	 * 
	 * 文件下载
	 */
	@RequestMapping(value="/{sno}/{scfile}/download",method=RequestMethod.GET) //
    public String download(@PathVariable String sno,@PathVariable String scfile, HttpServletRequest request, HttpServletResponse response,Model model)throws Exception {     
    	//fileName = CharacterTool.enCodeStr(fileName);//此处出现了乱码。这个函数用来转码，后来看到设置tomcat就好了
		System.out.println(sno + scfile);
    	response.setContentType("text/html;charset=utf-8");  
        request.setCharacterEncoding("utf-8"); 
        BufferedInputStream bis = null;   
        BufferedOutputStream bos = null;   
        System.out.println("文件"+scfile+"已被选中下载");
        String ctxPath = request.getSession().getServletContext().getRealPath("/resource/upload")+sno;   
        String downLoadPath = ctxPath + "/"+scfile;   
        System.out.println("当前路径"+downLoadPath);   
        try {   
            long fileLength = new File(downLoadPath).length();   
            response.setContentType("application/x-msdownload;");   
            response.setHeader("Content-disposition", "attachment; filename="+ new String(scfile.getBytes("utf-8"), "ISO8859-1"));   
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
	/*设置作业次数*/
	@RequestMapping(value="/setTask",method=RequestMethod.GET)
	public String setTask(Model model,HttpServletRequest request){
		String cno = request.getParameter("cno");
		List<Settask> tasks = settaskService.selectBycno(cno);
		List<Settask> newtasksList = new ArrayList<Settask>();
		for(Settask s:tasks){
			java.sql.Date sqltime=new java.sql.Date(s.getStoptime().getTime());//时间转换
			Settask newtask = new Settask(s.getCno(),s.getSctimes(),sqltime,s.getStitle(),s.getStcontent());
			newtasksList.add(newtask);
		}
		model.addAttribute("tasks", newtasksList);
		model.addAttribute("cno", cno);
		return "teacher/setTask";
	}
	//增加作业
	@RequestMapping(value="/addTask",method=RequestMethod.POST)
	public String addTask(HttpServletRequest request,Model model){
		String stitle = request.getParameter("stitle");
		String stoptime = request.getParameter("stoptime");
		String stcontent = request.getParameter("stcontent");
		String cno = request.getParameter("cno");
		//System.out.println(stitle+stoptime+stcontent+cno);
		String sctimes = settaskService.selectsctimeMax(cno);
		//System.out.println(sctimes);
		int times;
		if(sctimes == null){
			times = 1;
		}
		else{
			times = Integer.parseInt(sctimes);
			times = times+1;
		}
		//System.out.println("cishi:"+times);
		String _times = String.valueOf(times);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cno",cno);
		map.put("_times",_times);
		map.put("stitle",stitle);
		map.put("stoptime",stoptime);
		map.put("stcontent",stcontent);
		System.out.println(settaskService.insertAll(map));
		model.addAttribute("cno", cno);
		return "redirect:/teacher/setTask";
	}
	//修改作业
	@RequestMapping(value="/updatetask",method=RequestMethod.POST)
	public String updatetask(HttpServletRequest request,Model model){
		String cno = request.getParameter("cno");
		String sctimes = request.getParameter("sctimes");
		String stitle = request.getParameter("stitle");
		String stoptime = request.getParameter("stoptime");
		String stcontent = request.getParameter("stcontent");		
		//System.out.println(cno+sctimes+stitle+stoptime+stcontent);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cno",cno);
		map.put("sctimes",sctimes);
		map.put("stoptime",stoptime);
		map.put("stitle",stitle);
		map.put("stoptime",stoptime);
		map.put("stcontent",stcontent);		
		System.out.println("作业已经更新..."+settaskService.updateBykey(map));
		model.addAttribute("cno", cno);
		return "redirect:/teacher/setTask";
	}
	
	/*
	 * 上传资料
	 */
	@RequestMapping(value="/webSource/{cno}",method=RequestMethod.GET)
	public String webSource(@PathVariable String cno,HttpServletRequest request,Model model){
		//String cname = request.getParameter("cname");
		model.addAttribute("cno",cno);
		List<Coursedata> dataList = coursedataService.selcetBycno(cno);
		model.addAttribute("datalist", dataList);
		return "teacher/webSource";
	}
	/*
	 * 存储资料
	 */
	@RequestMapping(value="/uploadData/{cno}",method=RequestMethod.POST)
	public String _webSource(@PathVariable String cno,@PathVariable MultipartFile attach,HttpServletRequest request,Model model) throws IOException{
		String dname = request.getParameter("dname");
		String dsummary = request.getParameter("dsummary");
		//System.out.println(dname);
		java.util.Date  date=new java.util.Date();
		java.sql.Date  date1=new java.sql.Date(date.getTime());//获取当前系统时间，并将其转换成sql的时间格式
		if(attach.getOriginalFilename()==""){
			//如果资料文件为空，说明只需将资料简介存入
			Coursedata record = new Coursedata(cno,dname,"无",dsummary,date1);
			System.out.println(coursedataService.insert(record));
		}
		else{
			String realpath = request.getSession().getServletContext().getRealPath("/resource/upload")+"/"+cno;//得到文件夹路径
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
			Coursedata record = new Coursedata(cno,dname,attach.getOriginalFilename(),dsummary,date1);
			System.out.println(coursedataService.insert(record));
		}		
		model.addAttribute("cno", cno);
		List<Coursedata> dataList = coursedataService.selcetBycno(cno);
		model.addAttribute("datalist", dataList);
		return "teacher/webSource";
	}
	/*
	 * 删除资料
	 */
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteData(HttpServletRequest request,Model model){
		String cno = request.getParameter("cno");
		model.addAttribute("cno", cno);
		String dname = request.getParameter("name");
		System.out.println(cno+dname);
		System.out.println("资料被删除"+coursedataService.deleteBykey(cno, dname));
		return "redirect:/teacher/webSource/{cno}";
	}
	
	
	/*
	 * 有'localhost:8080/uploadHomework/aboutUs'时跳转到“关于我们”的页面
	 * 关于我们的页面*/
	@RequestMapping(value="/aboutUs",method=RequestMethod.GET)
	public String aboutUs(){
		return "teacher/aboutUs";
	}
	
	@RequestMapping(value="changePassword",method=RequestMethod.GET)
	public String changePassword(){
		return "teacher/changePassword";
	}
	@RequestMapping(value="changePassword",method=RequestMethod.POST)
	public String changePassword(HttpServletRequest request){
		String tno = decrypt(request.getParameter("id"));
		String tpwd = request.getParameter("tpwd");
		//System.out.println(tno+tpwd);
		System.out.println("密码已经修改..."+teacherService.updatePassword(tno, tpwd));
		return "teacher/homePage";
	}
	/*
	 * ajax
	 */
	@RequestMapping(value="/ajaxpost",method=RequestMethod.POST)
	public void ajaxpost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String sno = request.getParameter("sno"); 
		String cno = request.getParameter("cno");
		String sctimes = request.getParameter("sctimes");
		System.out.print(sno+"  "+cno+" "+sctimes);		
		/*根据sno\cno\sctimes查询allowlook,如果是设置其相反值*/
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sno", sno);
		map.put("cno", cno);
		map.put("sctimes",sctimes );
		System.out.print("ss");		
		SC sc = scService.selectBysnocnosctimes(map);
		System.out.print(sc.getAllowlook());		
		if(sc.getAllowlook() != null){
			Map<String, Object> map1 = new HashMap<String,Object>();
			map1.put("sno",sno);
			map1.put("cno",cno);
			map1.put("sctimes", sctimes);
			map.put("allowlook", "null");
			System.out.println("可见已更新..."+scService.updateTolook(map1));
		}
		else{
			Map<String, Object> map1 = new HashMap<String,Object>();
			map1.put("sno",sno);
			map1.put("cno",cno);
			map1.put("sctimes", sctimes);
			map1.put("allowlook", "checked");
			System.out.println("不可见已更新..."+scService.updateTolook(map1));
		}
		
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write("true");
		response.getWriter().flush();
	}
	
	/*
	 * 随便的url传id加密，没找到更好的办法
	 */
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
 