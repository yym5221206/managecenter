package com.runrong.managecenter.business.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runrong.managecenter.business.cache.PermissionCache;
import com.runrong.managecenter.business.dao.PermissionDao;
import com.runrong.managecenter.business.model.Permission;
import com.runrong.managecenter.common.base.ResultModel;
import com.runrong.managecenter.common.util.JsonUtil;

/**
 * 权限处理层
 * @author yanyimin
 *
 */
@Service
public class PermissionService {

	@Autowired
	PermissionDao permissionDao;
	@Autowired
	PermissionCache permissionCache;
	@Autowired
	AdminService adminService;
	
	/**
	 * 查询权限 
	 * @param request
	 * @return
	 */
	public ResultModel getPermission(HttpServletRequest request){
		
		Integer id=request.getParameter("id")==null?null:Integer.valueOf(request.getParameter("id"));
		String permission=request.getParameter("permission")==null?null:request.getParameter("permission");
		String permissionName=request.getParameter("permissionName")==null?null:request.getParameter("permissionName");
		String parent=request.getParameter("parent")==null?null:request.getParameter("parent");
		String parentName=request.getParameter("parentName")==null?null:request.getParameter("parentName");
		
		Permission p=new Permission();
		p.setId(id);
		p.setParent(parent);
		p.setParentName(parentName);
		p.setPermission(permission);
		p.setPermissionName(permissionName);
		
		List list=permissionDao.getPermission(p);
		return ResultModel.successModel(list);
	}
	
	/**
	 * 添加权限
	 * @param request
	 * @return
	 */
	public ResultModel addPermission(HttpServletRequest request){
		
		String permission=request.getParameter("permission");
		String permissionName=request.getParameter("permissionName");
		String parent=request.getParameter("parent");
		String parentName=request.getParameter("parentName");
		
		if((permission==null || permission.equals("")) && (permissionName==null || permissionName.equals("")) && (parent==null || parent.equals("")) && (parentName==null || parentName.equals(""))){
			return ResultModel.failModel("参数错误");
		}
		
		Permission permissions=new Permission();
		permissions.setParent(parent);
		permissions.setParentName(parentName);
		permissions.setPermission(permission);
		permissions.setPermissionName(permissionName);
		
		int id=permissionDao.addPermission(permissions);
		
		if(id>0){
			//更新缓存
			updatePermissionCache();
			
			return ResultModel.successModel("添加成功");
		}
		return ResultModel.failModel("添加失败");
	}
	
	/**
	 * 删除权限
	 * @param request
	 * @return
	 */
	public ResultModel deletePermission(HttpServletRequest request){
		
		Permission permissions=new Permission();
		
		if(request.getParameter("id")==null){
			return ResultModel.failModel("参数为空");
		}
		
		Integer id=Integer.valueOf(request.getParameter("id"));	
		permissions.setId(id);
		
		permissionDao.deletePermission(permissions);
		
		//每次删除后都需要存入缓存中	
		permissionCache.put(String.valueOf(request.getSession().getAttribute("admin_id")), adminService.getAdminPermission((int) request.getSession().getAttribute("admin_id")));
		//更新缓存
		updatePermissionCache();
		
		return ResultModel.successModel("删除成功");
	}
	
	/**
	 * 修改权限
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 */
	public ResultModel updatePermission(HttpServletRequest request){
		Permission p=new Permission();
		
		if(request.getParameter("id")==null){
			return ResultModel.failModel("参数为空");
		}
		
		Integer id=Integer.valueOf(request.getParameter("id"));			
		String permission=request.getParameter("permission")==null?null:request.getParameter("permission");
		String permissionName=request.getParameter("permissionName")==null?null:request.getParameter("permissionName");
		String parent=request.getParameter("parent")==null?null:request.getParameter("parent");
		String parentName=request.getParameter("parentName")==null?null:request.getParameter("parentName");
		
		p.setId(id);
		p.setParent(parent);
		p.setParentName(parentName);
		p.setPermission(permission);
		p.setPermissionName(permissionName);
		
		permissionDao.updatePermission(p);
		
		return ResultModel.successModel("修改成功");
	}
	
	/**
	 * 更新权限缓存
	 * @return
	 */
	public List updatePermissionCache(){
		List<String> permission = new ArrayList<String>();;
        List<Map> maps;
        //查询数据库中添加的权限
        maps=permissionDao.getPermission(new Permission());
        for(Map map:maps){
        	permission.add(map.get("parent")+"_"+map.get("permission"));
        }
        permissionCache.put("permission", permission);
		return permission;
	}
}
