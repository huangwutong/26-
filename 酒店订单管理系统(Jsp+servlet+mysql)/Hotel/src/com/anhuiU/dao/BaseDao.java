package com.anhuiU.dao;

import java.util.List;

import com.anhuiU.model.BaseModel;

public abstract class BaseDao {
     public abstract void add(BaseModel bm);
     public abstract void update(BaseModel bm);
     public abstract void delete(int id);
     public abstract List select();
}
