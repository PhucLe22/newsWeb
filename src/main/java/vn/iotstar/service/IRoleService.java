package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.Role;

public interface IRoleService {
	
	public Role findById(int id);
	public Role getDefaultUserRole();
	public Role findByUserId(int userId);
	public Role updateRole(Role role);
	public List<Role> findById2(int id);
	public List<Role> findAll();
}
