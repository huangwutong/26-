package com.jeecms.core;

import java.io.Serializable;

import com.ponyjava.common.hibernate3.BaseDaoImpl;

public class JeeCoreDaoImpl<T extends Serializable> extends BaseDaoImpl<T>
		implements JeeCoreDao<T> {

}
