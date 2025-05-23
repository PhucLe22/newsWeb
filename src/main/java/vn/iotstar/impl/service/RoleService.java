package vn.iotstar.impl.service;

import vn.iotstar.entity.Role;
import vn.iotstar.impl.dao.*;
import vn.iotstar.service.IRoleService;

import java.util.List;

import vn.iotstar.dao.*;

public class RoleService implements IRoleService{
	
	public IRoleDao roleDao = new RoleDao();
	
	@Override
	public Role findById(int id)
	{
		return roleDao.findById(id);
	}

	@Override
	public Role getDefaultUserRole() {
	    return roleDao.findById(1); // Hoặc tên method rõ ràng hơn
	}
	@Override
	public Role findByUserId(int userId)
	{
		return roleDao.findByUserId(userId);
	}
	@Override
	public Role updateRole(Role role)
	{
		return roleDao.updateRole(role);
	}
	
	@Override
	public List<Role> findById2(int id)
	{
		return roleDao.findByUserId2(id);
	}
	@Override
	public List<Role> findAll()
	{
		return roleDao.findAll();
	}
}
