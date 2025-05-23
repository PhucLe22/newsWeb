package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Role;

public interface IRoleDao {
	
	public Role findById(int id);
	public Role updateRole(Role role);
	public Role findByUserId(int userId);
	public List<Role> findByUserId2(int userId);
	public List<Role> findAll();
}
