package com.bu.moster;

import com.service.*;
import java.util.*;

public interface MosterBusiness {
	public boolean save(Object ob);
	public boolean update(Object ob);
	public boolean delete(String id);
	public Object findById(String id);
	public Vector findAll();
	
}
