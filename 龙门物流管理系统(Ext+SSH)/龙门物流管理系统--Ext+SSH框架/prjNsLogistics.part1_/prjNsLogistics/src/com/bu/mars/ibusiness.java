package com.bu.mars;
import java.util.*;
public interface ibusiness {
	public boolean save(Object ob);
	public boolean update(Object ob);
	public boolean delete(String id);
	public Object findById(String id);
	public Vector findAll();
}
