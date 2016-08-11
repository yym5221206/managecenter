package com.runrong.managecenter.business.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runrong.managecenter.business.dao.AdminDao;
import com.runrong.managecenter.business.model.Administrator;
import com.runrong.managecenter.common.base.ResultModel;
import com.runrong.managecenter.common.dictionary.Constant;
import com.runrong.managecenter.common.encrypt.MD5;
/**
 * 管理员账号处理层
 * @author yanyimin
 *
 */
@Service
public class AdminService {

	@Autowired
	AdminDao adminDao;
	
	/**
	 * 添加管理员
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 */
	public ResultModel addAdministrator(HttpServletRequest request) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		Administrator admin=new Administrator();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(username==null || password==null || username.equals("") || password.equals("")){
			return ResultModel.failModel("参数为空");
		}
		if(checkUsernameIsRepeat(username)){
			return ResultModel.failModel("用户名重复");
		}
		password=MD5.encoderByMd5Salt(password, username);
		
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setJoinTime(new Date());
		int id=adminDao.addAdministrator(admin);
	
		return ResultModel.successModel("添加成功");
	}
	
	/**
	 * 修改管理员
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 */
	public ResultModel updateAdministrator(HttpServletRequest request) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		Administrator admin=new Administrator();
		
		if(request.getParameter("id")==null){
			return ResultModel.failModel("参数为空");
		}
		
		Integer id=Integer.valueOf(request.getParameter("id"));			
		Integer adminGroupid=request.getParameter("adminGroupid")==null?null:Integer.valueOf(request.getParameter("adminGroupid"));
		String password=request.getParameter("password");
		String username=request.getParameter("username");
		
		if(password==null && adminGroupid==null){
			return ResultModel.failModel("参数为空");
		}
		admin.setUuid(id);
		admin.setAdminGroupid(adminGroupid);		
		admin.setPassword(MD5.encoderByMd5Salt(password, username));
		
		adminDao.updateAdministrator(admin);
	
		return ResultModel.successModel("修改成功");
	}
	
	/**
	 * 删除管理员
	 * @param request
	 * @return
	 */
	public ResultModel deleteAdministrator(HttpServletRequest request) {
		Administrator admin=new Administrator();
		
		if(request.getParameter("id")==null){
			return ResultModel.failModel("参数为空");
		}
		
		Integer id=Integer.valueOf(request.getParameter("id"));	
		admin.setUuid(id);
		
		adminDao.deleteAdministrator(admin);
	
		return ResultModel.successModel("删除成功");
	}
	
	/**
	 * 查找管理员
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	public ResultModel getAdministrator(HttpServletRequest request) throws ParseException {		
		Administrator admin=new Administrator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Integer adminGroupid=request.getParameter("adminGroupid")==null?null:Integer.valueOf(request.getParameter("adminGroupid"));
		Integer type=request.getParameter("type")==null?null:Integer.valueOf(request.getParameter("type"));
		String username=request.getParameter("username");
		Integer id=request.getParameter("id")==null?null:Integer.valueOf(request.getParameter("id"));	
		Integer pageNum=request.getParameter("pageNum")==null?Constant.PAGE_NUM:Integer.valueOf(request.getParameter("pageNum"));
		Integer pageSize=request.getParameter("pageSize")==null?Constant.PAGE_SIZE:Integer.valueOf(request.getParameter("pageSize"));
		Date jointime=request.getParameter("joinTime")==null?null:sdf.parse(request.getParameter("joinTime"));
		
		admin.setUuid(id);
		admin.setAdminGroupid(adminGroupid);
		admin.setUsername(username);
		admin.setType(type);
		admin.setPageNum(pageNum);
		admin.setPageSize(pageSize);
		admin.setStart(pageSize, pageNum);
		admin.setJoinTime(jointime);
		
		List list=adminDao.getAdministrator(admin);
	
		return ResultModel.successModel(list);
	}
	
	/**
	 * 检查用户名是否重复
	 * @param username
	 * @return
	 */
	public boolean checkUsernameIsRepeat(String username){
		
		Administrator admin=new Administrator();
		admin.setUsername(username);
		List list=adminDao.getAdministrator(admin);
		
		if(list==null || list.size()==0){
			return false;
		}
		return true;
	}
}