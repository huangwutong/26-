package com.bu.mars;

import java.util.*;

import com.struts.*;
import com.struts.form.MarsBillInfoForm;
import com.struts.form.MarsCargoInfoForm;
import com.struts.form.MarsJfreeCharBranchForm;
import com.struts.form.MarsJfreeCharFormForm;
import com.po.*;
import com.service.*;
public class BillInfoBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		BillInfo billinfo=daos.getBillinfodao().findById(new Integer(id));
		try {
			daos.getBillinfodao().delete(billinfo);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector billvc=new Vector();
		List ls=daos.getBillinfodao().findAll();
		for (Object object : ls) {
			BillInfo billinfo=(BillInfo)object;
			MarsBillInfoForm billf=new MarsBillInfoForm();
			billf.setBillid(billinfo.getBillId().toString());
			//创建货物集合对象
			Vector vccg=new Vector();
			//获取货票货物集合
			Set cargovs=billinfo.getCargoVectors();
			if(cargovs!=null||!cargovs.isEmpty())
			{
				Iterator it=cargovs.iterator();
				//获取货票货物对象
				while(it.hasNext())
				{
					CargoVector cargovc=(CargoVector)it.next();
					CargoInfo cargo=cargovc.getCargoInfo();
					MarsCargoInfoForm cargof=new MarsCargoInfoForm();
					cargof.setCargoid(cargo.getCargoId().toString());
					cargof.setCargoname(cargo.getCargoName());
					cargof.setCargoweight(cargo.getCargoWeight());
					cargof.setCargobulk(cargo.getCargoBulk());
					cargof.setCargonum(cargo.getCargoNum());
					cargof.setCargounit(cargo.getCargoUnit());
					cargof.setCargovalue(cargo.getCargoValue());
					cargof.setCargofreight(cargo.getCargoFreight());
					cargof.setCargoamends(cargo.getCargoAmends());
					cargof.setCargomemo(cargo.getCargoMemo());
					cargof.setCargostate(cargo.getCargoState().toString());
					cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
					cargof.setBranchname(cargo.getBranchInfo().getBranchName());
					cargof.setCargostartdata(cargo.getCargoStartData());
					cargof.setCargoenddata(cargo.getCargoEndData());
					vccg.add(cargof);
				}
			}
			//获取发货用户信息
			billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
			billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
			billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
			//获取收货用户信息
			billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
			billf.setTruckline(billinfo.getTruckLine());
			billf.setPayername(billinfo.getPayerName());
			billf.setUserid(billinfo.getUserInfo().getUserId().toString());
			billf.setUsername(billinfo.getUserInfo().getUserName());
			billf.setBilldata(billinfo.getBillData());
			billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
			billf.setBillstatename(billinfo.getBillState().getBillStateName());
			billf.setBillmemo(billinfo.getBillMemo());
			//获取发货分公司信息
			billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
			//获取收货分公司信息
			billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
			billf.setCgvcs(vccg);
			billvc.add(billf);
		}
		return billvc;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		BillInfo bill=daos.getBillinfodao().findById(new Integer(id));
		MarsBillInfoForm billf=new MarsBillInfoForm();
		billf.setBillid(bill.getBillId().toString());
		Vector vccg=new Vector();
		Set cargovs=bill.getCargoVectors();
		if(cargovs!=null||!cargovs.isEmpty())
		{
			Iterator it=cargovs.iterator();
			String[]cgid=new String[cargovs.size()];
			int i=0;
			while(it.hasNext())
			{
				CargoVector cargovc=(CargoVector)it.next();
				CargoInfo cargo=cargovc.getCargoInfo();
				MarsCargoInfoForm cargof=new MarsCargoInfoForm();
				cargof.setCargoid(cargo.getCargoId().toString());
				cargof.setCargoname(cargo.getCargoName());
				cargof.setCargoweight(cargo.getCargoWeight());
				cargof.setCargobulk(cargo.getCargoBulk());
				cargof.setCargonum(cargo.getCargoNum());
				cargof.setCargounit(cargo.getCargoUnit());
				cargof.setCargovalue(cargo.getCargoValue());
				cargof.setCargofreight(cargo.getCargoFreight());
				cargof.setCargoamends(cargo.getCargoAmends());
				cargof.setCargomemo(cargo.getCargoMemo());
				cargof.setCargostate(cargo.getCargoState().toString());
				cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
				cargof.setBranchname(cargo.getBranchInfo().getBranchName());
				cargof.setCargostartdata(cargo.getCargoStartData());
				cargof.setCargoenddata(cargo.getCargoEndData());
				cgid[i]=cargof.getCargoid();
				i++;
				vccg.add(cargof);
			}
			billf.setCgid(cgid);
		}
		billf.setSendid(bill.getCustomerInfoBySendId().getCustomerId().toString());
		billf.setSendcusname(bill.getCustomerInfoBySendId().getCustomerName());
		billf.setReceiveid(bill.getCustomerInfoByReceiveId().getCustomerId().toString());
		//获取收货用户信息
		billf.setReceivecusname(bill.getCustomerInfoByReceiveId().getCustomerName());
		billf.setTruckline(bill.getTruckLine());
		billf.setPayername(bill.getPayerName());
		billf.setUserid(bill.getUserInfo().getUserId().toString());
		billf.setUsername(bill.getUserInfo().getUserName());
		billf.setBilldata(bill.getBillData());
		billf.setBillstateid(bill.getBillState().getBillStateId().toString());
		billf.setBillstatename(bill.getBillState().getBillStateName());
		billf.setBillmemo(bill.getBillMemo());
		//获取发货分公司信息
		billf.setSendbranchname(bill.getBranchInfoBySendBranchId().getBranchName());
		//获取收货分公司信息
		billf.setReceivebranchname(bill.getBranchInfoByReceiveBranchId().getBranchName());
		billf.setCgvcs(vccg);
		return billf;
	}
	
	  //按公司，制单时间查所有货票表
	 public Vector findByBranchinf(String branchid,String billstartdata,String billenddata)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findByBranchinf(branch, billstartdata, billenddata);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司，制单时间,货票状态,查所有货票表
	 public Vector findByBranchinf(String branchid,String billstartdata,String billenddata,String billstateid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 BillState billstate=daos.getBillstatedao().findById(new Integer(billstateid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findByBranchinf(branch, billstartdata, billenddata, billstate);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司（发货）,制单时间查发货的货票
	 public Vector findBySendBranch(String branchid,String billstartdata,String billenddata)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findBySendBranch(branch, billstartdata, billenddata);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司（发货）,制单时间,货票状态查发货的货票
	 public Vector findBySendBranch(String branchid,String billstartdata,String billenddata,String billstateid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 BillState billstate=daos.getBillstatedao().findById(new Integer(billstateid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findBySendBranch(branch, billstartdata, billenddata, billstate);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司（收货），制单时间查收货的货票
	 public Vector findByReceiveBranch(String branchid,String billstartdata,String billenddata)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findByReceiveBranch(branch, billstartdata, billenddata);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司（收货），制单时间,货票状态,查收货的货票
	 public Vector findByReceiveBranch(String branchid,String billstartdata,String billenddata,String billstateid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 BillState billstate=daos.getBillstatedao().findById(new Integer(billstateid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findByReceiveBranch(branch, billstartdata, billenddata, billstate);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按客户,制单时间查所有货票信息
	 public Vector findByCustomer(String customerid,String billstartdata,String billenddata,String branchid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 CustomerInfo customer=daos.getCustomerinfodao().findById(new Integer(customerid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findByCustomer(customer, billstartdata, billenddata,branch);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按客户,制单时间,货票状态,查所有货票信息
	 public Vector findByCustomer(String customerid,String billstartdata,String billenddata,String billstateid,String branchid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 CustomerInfo customer=daos.getCustomerinfodao().findById(new Integer(customerid));
		 BillState billstate=daos.getBillstatedao().findById(new Integer(billstateid));
		 Vector billvc=new Vector();
			List ls=daos.getBillinfodao().findByCustomer(customer, billstartdata, billenddata, billstate,branch);
			for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司角色(收货),调度查询
	 public Vector findByReceiveBranchshare(String branchid,String billstateid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 BillState billstate=daos.getBillstatedao().findById(new Integer(billstateid));
		 Vector billvc=new Vector();
		 List ls=daos.getBillinfodao().findByReceiveBranchshare(branch, billstate);
		 for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	 //按公司角色（发货),调度查询
	 public Vector findBySendBranchshare(String branchid,String billstateid)
	 {
		 BranchInfo branch=daos.getBranchinfodao().findById(new Integer(branchid));
		 BillState billstate=daos.getBillstatedao().findById(new Integer(billstateid));
		 Vector billvc=new Vector();
		 List ls=daos.getBillinfodao().findBySendBranchshare(branch, billstate);
		 for (Object object : ls) {
				BillInfo billinfo=(BillInfo)object;
				MarsBillInfoForm billf=new MarsBillInfoForm();
				billf.setBillid(billinfo.getBillId().toString());
				//创建货物集合对象
				Vector vccg=new Vector();
				//获取货票货物集合
				Set cargovs=billinfo.getCargoVectors();
				if(cargovs!=null||!cargovs.isEmpty())
				{
					Iterator it=cargovs.iterator();
					//获取货票货物对象
					while(it.hasNext())
					{
						CargoVector cargovc=(CargoVector)it.next();
						CargoInfo cargo=cargovc.getCargoInfo();
						MarsCargoInfoForm cargof=new MarsCargoInfoForm();
						cargof.setCargoid(cargo.getCargoId().toString());
						cargof.setCargoname(cargo.getCargoName());
						cargof.setCargoweight(cargo.getCargoWeight());
						cargof.setCargobulk(cargo.getCargoBulk());
						cargof.setCargonum(cargo.getCargoNum());
						cargof.setCargounit(cargo.getCargoUnit());
						cargof.setCargovalue(cargo.getCargoValue());
						cargof.setCargofreight(cargo.getCargoFreight());
						cargof.setCargoamends(cargo.getCargoAmends());
						cargof.setCargomemo(cargo.getCargoMemo());
						cargof.setCargostate(cargo.getCargoState().toString());
						cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
						cargof.setBranchname(cargo.getBranchInfo().getBranchName());
						cargof.setCargostartdata(cargo.getCargoStartData());
						cargof.setCargoenddata(cargo.getCargoEndData());
						vccg.add(cargof);
					}
				}
				//获取发货用户信息
				billf.setSendid(billinfo.getCustomerInfoBySendId().getCustomerId().toString());
				billf.setSendcusname(billinfo.getCustomerInfoBySendId().getCustomerName());
				billf.setReceiveid(billinfo.getCustomerInfoByReceiveId().getCustomerId().toString());
				//获取收货用户信息
				billf.setReceivecusname(billinfo.getCustomerInfoByReceiveId().getCustomerName());
				billf.setTruckline(billinfo.getTruckLine());
				billf.setPayername(billinfo.getPayerName());
				billf.setUserid(billinfo.getUserInfo().getUserId().toString());
				billf.setUsername(billinfo.getUserInfo().getUserName());
				billf.setBilldata(billinfo.getBillData());
				billf.setBillstateid(billinfo.getBillState().getBillStateId().toString());
				billf.setBillstatename(billinfo.getBillState().getBillStateName());
				billf.setBillmemo(billinfo.getBillMemo());
				//获取发货分公司信息
				billf.setSendbranchname(billinfo.getBranchInfoBySendBranchId().getBranchName());
				//获取收货分公司信息
				billf.setReceivebranchname(billinfo.getBranchInfoByReceiveBranchId().getBranchName());
				billf.setCgvcs(vccg);
				billvc.add(billf);
			}
			return billvc;
	 }
	//查客户业务比重
	 public Vector findBySendBranchJF()
	 {
		 
		 Vector vc = new Vector();
		 List ls=daos.getBillinfodao().findBySendBranchJF();
		 Iterator it = ls.iterator();
		 while(it.hasNext()){
			 Object[] ob = (Object[]) it.next();
			MarsJfreeCharFormForm  jf = new MarsJfreeCharFormForm();
			CustomerInfo cusf=daos.getCustomerinfodao().findById(new Integer(ob[0].toString())); 
			jf.setSendid(cusf.getCustomerName());
			jf.setCount(ob[1].toString());
			 vc.add(jf);
		 }
		 return vc;
	 }
	 //查公司业务比重
	 public Vector findByBranchidchar()
	 {
		 	Vector vc=new Vector();
		 	List ls=daos.getBillinfodao().findByBranchidchar();
		 	Iterator it=ls.iterator();
		 	 while(it.hasNext()){
				 Object[] ob = (Object[]) it.next();
				MarsJfreeCharBranchForm jfb=new MarsJfreeCharBranchForm();
				BranchInfo branchf=daos.getBranchinfodao().findById(new Integer(ob[0].toString()));
				jfb.setBranchid(branchf.getBranchName());
				jfb.setCount(ob[1].toString());
				vc.add(jfb);
			 }
		 	 return vc;
	 }
	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
