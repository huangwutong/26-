package com.bu.carmack;

import java.util.*;
public interface IBusiness {
	public boolean save(Object ob);
	public boolean update(Object ob);
	public boolean delete(String id);
	public Object findById(String id);
	public Vector findAll();
}
