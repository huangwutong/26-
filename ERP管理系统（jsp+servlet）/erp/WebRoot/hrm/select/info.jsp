<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>员工资料</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" type="text/javascript"
			src="js/changedate.js"></script>
		<script type="text/javascript" language="JavaScript">
			function info()
			{
				document.all.update.style.display ='none';
				document.all.info.style.display ='';
			}
			function update()
			{
				document.all.update.style.display ='';
				document.all.info.style.display ='none';
			}
			function chick()
			{
				if(form1.birthday.value=="")
				{
	 				document.getElementById("date").innerHTML="生日不可以为空";
	 				form1.birthday.focus();
        			return false;
				}
				if(form1.idCardNo.value=="")
				{
	 				document.getElementById("isid").innerHTML="身份证号码不可以为空";
	 				form1.idCardNo.focus();
        			return false;
				}
				if(form1.native_.value=="")
				{
	 				document.getElementById("native_error").innerHTML="籍贯不可以为空";
	 				form1.native_.focus();
        			return false;
				}
				if(form1.nation.value=="")
				{
	 				document.getElementById("nationError").innerHTML="民族不可以为空";
	 				form1.nation.focus();
        			return false;
				}
				if(form1.finishSchool.value=="")
				{
	 				document.getElementById("finishSchool_error").innerHTML="毕业学校不可以为空";
	 				form1.finishSchool.focus();
        			return false;
				}
				if(form1.dwelling.value=="")
				{
	 				document.getElementById("dwelling_error").innerHTML="住址不可以为空";
	 				form1.dwelling.focus();
        			return false;
				}
				document.form1.submit()
			}
		function isid(va)
		{	
			if(va.length!=15 && va.length!=18)
			{
				document.getElementById("isid").innerHTML="身份证号码无效";
       			form1.idCardNo.focus();
			}
			else
			{
				document.getElementById("isid").innerHTML="";
			}
		}
		</script>
	</head>
	<body onload="info();">
		<div class="title">
			<h2>
				员工资料
			</h2>
		</div>
		<div id="update">
			<form
				action="updatePersonnel?personnelid=${sessionScope.info.personnelid}&${requestScope.page }"
				name="form1" method="post">
				<table width="100%" border="0" cellpadding="8" cellspacing="1"
					class="contentArea">
					<tr>
						<td class="contentList">
							<table width="100%" border="0" cellspacing="1" cellpadding="8"
								class="contentListTable2">
								<tr>
									<td width="16%" class="contentListTdColName">
										员工名
									</td>
									<td width="84%" class="contentListTd">
										&nbsp;${sessionScope.info.realname}
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										工号
									</td>
									<td class="contentListTd">
										&nbsp;${sessionScope.info.jobid}
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										所属分公司
									</td>
									<td width="84%" class="contentListTd">
										&nbsp;${sessionScope.info.dept.grade.deptname}
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										所在部门
									</td>
									<td width="84%" class="contentListTd">
										&nbsp;${sessionScope.info.dept.deptname}
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										职位
									</td>
									<td width="84%" class="contentListTd">
										&nbsp;${sessionScope.info.position.job }
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										生日
									</td>
									<td class="contentListTd">
										<input name="birthday" type="text" id="birthday" readonly="readonly"
											value="${sessionScope.info.birthday }" size="10"
											maxlength="10" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')"
											style="cursor: hand;" />
										*[必填项,不可以为空]
										<span id="date"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										性别
									</td>
									<td class="contentListTd">
										<c:if test="${sessionScope.info.sex == 0 }">
											<input name="sex" type="radio" id="sex" value="1" />男
          	<input name="sex" type="radio" id="sex" value="0"
												checked="checked" />女
          </c:if>
										<c:if test="${sessionScope.info.sex == 1 }">
											<input name="sex" type="radio" id="sex" value="1"
												checked="checked" />男
          	<input name="sex" type="radio" id="sex" value="0" />女
          </c:if>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										籍贯
									</td>
									<td class="contentListTd">
										<input type="text" name="native_" id="native_"
											value="${sessionScope.info.pnative}" size=10 maxlength="20" )/>
										*[必填项]
										<span id="native_error"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										民族
									</td>
									<td class="contentListTd">
										<input type="text" name="nation" id="nation"
											value="${sessionScope.info.nation}" size=10 maxlength="20" />
										*[必填项]
										<span id="nationError"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										政治面貌
									</td>
									<td class="contentListTd">
										<c:if test="${sessionScope.info.polity == null}">
											<input name="polity" type="radio" id="polity" value="A" checked="checked" />党员
											<input name="polity" type="radio" id="polity" value="B" />团员
											<input name="polity" type="radio" id="polity" value="C" />无
											<input name="polity" type="radio" id="polity" value="D" />他党人士
									</c:if>
										<c:if test="${sessionScope.info.polity != null}">
											<c:if test="${sessionScope.info.polity == 'A'}">
												<input name="polity" type="radio" id="polity" value="A"
													checked="checked" />党员</c:if>
											<c:if test="${sessionScope.info.polity != 'A'}">
												<input name="polity" type="radio" id="polity" value="A" />党员</c:if>
											<c:if test="${sessionScope.info.polity == 'B'}">
												<input name="polity" type="radio" id="polity" value="B"
													checked="checked" />团员</c:if>
											<c:if test="${sessionScope.info.polity != 'B'}">
												<input name="polity" type="radio" id="polity" value="B" />团员</c:if>
											<c:if test="${sessionScope.info.polity == 'C'}">
												<input name="polity" type="radio" id="polity" value="C"
													checked="checked" />无</c:if>
											<c:if test="${sessionScope.info.polity != 'C'}">
												<input name="polity" type="radio" id="polity" value="C" />无</c:if>
											<c:if test="${sessionScope.info.polity == 'D'}">
												<input name="polity" type="radio" id="polity" value="D"
													checked="checked" />他党人士</c:if>
											<c:if test="${sessionScope.info.polity != 'D'}">
												<input name="polity" type="radio" id="polity" value="D" />他党人士</c:if>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										身份证号码
									</td>
									<td class="contentListTd">
										<input type="text" name="idCardNo" id="idCardNo"
											value="${sessionScope.info.idcardno}" size=18 maxlength="18"
											onblur="isid(this.value);" />
										*[必填项]
										<span id="isid"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										身份证地址
									</td>
									<td class="contentListTd">
										<input type="text" name="idCardAddress" id="idCardAddress"
											value="${sessionScope.info.idcardaddress}" size=40
											maxlength="100" />
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										婚否
									</td>
									<td class="contentListTd">
										<c:if test="${sessionScope.info.wedlock == null}">
											<input name="wedlock" type="radio" id="wedlock" value="1"
												checked="checked" />已婚
          								<input name="wedlock" type="radio" id="wedlock"
												value="0" />未婚
									</c:if>
										<c:if test="${sessionScope.info.wedlock != null}">
											<c:if test="${sessionScope.info.wedlock == 1}">
												<input name="wedlock" type="radio" id="wedlock" value="1"
													checked="checked" />已婚
          	<input name="wedlock" type="radio" id="wedlock" value="0" />未婚</c:if>
											<c:if test="${sessionScope.info.wedlock == 0}">
												<input name="wedlock" type="radio" id="wedlock" value="1" />已婚
          	<input name="wedlock" type="radio" id="wedlock" value="0"
													checked="checked" />未婚</c:if>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										社保卡号
									</td>
									<td class="contentListTd">
										<input type="text" name="socialinsuranceid"
											id="socialinsuranceid"
											value="${sessionScope.info.socialinsuranceid}" size=10
											maxlength="15" />
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										毕业学校
									</td>
									<td class="contentListTd">
										<input type="text" name="finishSchool" id="finishSchool"
											value="${sessionScope.info.finishschool}" size=20
											maxlength="40" />
										*[必填项]
										<span id="finishSchool_error"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										专业
									</td>
									<td class="contentListTd">
										<input type="text" name="specialty" id="specialty"
											value="${sessionScope.info.specialty}" size=20 maxlength="30" />
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										学历
									</td>
									<td class="contentListTd">
										<c:if test="${sessionScope.info.academic == null}">
											<input name="academic" type="radio" id="academic" value="C"
												checked="checked" />高中(中专)
										<input name="academic" type="radio" id="academic" value="D" />大专
										<input name="academic" type="radio" id="academic" value="E" />本科
										<input name="academic" type="radio" id="academic" value="F" />研究生
										<input name="academic" type="radio" id="academic" value="G" />博士
										<input name="academic" type="radio" id="academic" value="H" />博士后
									</c:if>
										<c:if test="${sessionScope.info.academic != null}">
											<c:if test="${sessionScope.info.academic == 'C'}">
												<input name="academic" type="radio" id="academic" value="C"
													checked="checked" />高中(中专)</c:if>
											<c:if test="${sessionScope.info.academic != 'C'}">
												<input name="academic" type="radio" id="academic" value="C" />高中(中专)</c:if>
											<c:if test="${sessionScope.info.academic == 'D'}">
												<input name="academic" type="radio" id="academic" value="D"
													checked="checked" />大专</c:if>
											<c:if test="${sessionScope.info.academic != 'D'}">
												<input name="academic" type="radio" id="academic" value="D" />大专</c:if>
											<c:if test="${sessionScope.info.academic == 'E'}">
												<input name="academic" type="radio" id="academic" value="E"
													checked="checked" />本科</c:if>
											<c:if test="${sessionScope.info.academic != 'E'}">
												<input name="academic" type="radio" id="academic" value="E" />本科</c:if>
											<c:if test="${sessionScope.info.academic == 'F'}">
												<input name="academic" type="radio" id="academic" value="F"
													checked="checked" />研究生</c:if>
											<c:if test="${sessionScope.info.academic != 'F'}">
												<input name="academic" type="radio" id="academic" value="F" />研究生</c:if>
											<c:if test="${sessionScope.info.academic == 'G'}">
												<input name="academic" type="radio" id="academic" value="G"
													checked="checked" />博士</c:if>
											<c:if test="${sessionScope.info.academic != 'G'}">
												<input name="academic" type="radio" id="academic" value="G" />博士</c:if>
											<c:if test="${sessionScope.info.academic == 'H'}">
												<input name="academic" type="radio" id="academic" value="H"
													checked="checked" />博士后</c:if>
											<c:if test="${sessionScope.info.academic != 'H'}">
												<input name="academic" type="radio" id="academic" value="H" />博士后</c:if>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										住址
									</td>
									<td class="contentListTd">
										<input type="text" name="dwelling" id="dwelling"
											value="${sessionScope.info.dwelling}" size=30 maxlength="100" />
										*[必填项]
										<span id="dwelling_error"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										入职时间
									</td>
									<td class="contentListTd">
										<input name="adddate" type="text" id="adddate" readonly="readonly"
											value="${sessionScope.info.adddate }" size="10"
											maxlength="10" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')"
											style="cursor: hand;" />
										<span id="date"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										转正时间
									</td>
									<td class="contentListTd"> 
										<input name="passdate" type="text" id="passdate" readonly="readonly"
											value="${sessionScope.info.passdate }" size="10"
											maxlength="10" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')"
											style="cursor: hand;" />
										<span id="date"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										离职时间
									</td>
									<td class="contentListTd">
										<input name="outdate" type="text" id="outdate" readonly="readonly"
											value="${sessionScope.info.outdate }" size="10"
											maxlength="10" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')"
											style="cursor: hand;" />
										<span id="date"></span>
									</td>
								</tr>
								<tr>
									<td class="contentListTd contentListTdAlign" colspan="2">
										操作：
										<a href="javascript:info();" class="pagenum">取消修改</a>&nbsp;&nbsp;&nbsp;
										<a href="javascript:void chick();" class="pagenum">更新</a>
										<a href="javascript:document.form1.reset();" class="pagenum">重填</a>
										<a href="selectPersonnel?${requestScope.page }"
											class="pagenum">返回到列表</a>&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="info">
			<table width="100%" border="0" cellpadding="8" cellspacing="1"
				class="contentArea">
				<tr>
					<td class="attachMenu">
						<strong>基本资料</strong>
					</td>
				</tr>
				<tr>
					<td class="contentList">
						<table width="100%" border="0" cellspacing="1" cellpadding="8"
							class="contentListTable2">
							<tr>
								<td width="16%" class="contentListTdColName">
									员工姓名
								</td>
								<td width="84%" class="contentListTd">
									&nbsp;${sessionScope.info.realname}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									员工工号
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.jobid}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									所属公司
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.dept.grade.deptname}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									部门
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.dept.deptname}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									职位
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.position.job }
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									性别
								</td>
								<td class="contentListTd">
									&nbsp;
									<c:if test="${sessionScope.info.sex == 0 }">女</c:if>
									<c:if test="${sessionScope.info.sex == 1 }">男</c:if>
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									生日
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.birthday }
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									籍贯
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.pnative}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									民族
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.nation}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									政治面貌
								</td>
								<td class="contentListTd">
									&nbsp;
									<c:if test="${sessionScope.info.polity == 'A'}">党员</c:if>
									<c:if test="${sessionScope.info.polity == 'B'}">团员</c:if>
									<c:if test="${sessionScope.info.polity == 'C'}">无</c:if>
									<c:if test="${sessionScope.info.polity == 'D'}">他党人士</c:if>
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									婚否
								</td>
								<td class="contentListTd">
									&nbsp;
									<c:if test="${sessionScope.info.wedlock == 1}">已婚</c:if>
									<c:if test="${sessionScope.info.wedlock == 0}">未婚</c:if>
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									身份证号码
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.idcardno}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									身份证地址
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.idcardaddress}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									社保卡号
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.socialinsuranceid}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									毕业学校
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.finishschool}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									专业
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.specialty}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									学历
								</td>
								<td class="contentListTd">
									&nbsp;
									<c:if test="${sessionScope.info.academic == 'C'}">高中(中专)</c:if>
									<c:if test="${sessionScope.info.academic == 'D'}">大专</c:if>
									<c:if test="${sessionScope.info.academic == 'E'}">本科</c:if>
									<c:if test="${sessionScope.info.academic == 'F'}">研究生</c:if>
									<c:if test="${sessionScope.info.academic == 'G'}">博士</c:if>
									<c:if test="${sessionScope.info.academic == 'H'}">博士后</c:if>
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									住址
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.dwelling}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									入职日期
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.adddate}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									转正日期
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.passdate}
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									离职日期
								</td>
								<td class="contentListTd">
									&nbsp;${sessionScope.info.outdate}
								</td>
							</tr>
							<tr>
								<td class="contentListTd contentListTdAlign" colspan="2">
									操作：
									<a href="javascript:update();" class="pagenum">修改</a>&nbsp;&nbsp;&nbsp;
									<a href="selectPersonnel?${requestScope.page }" class="pagenum">返回到列表</a>&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="lineSpace"></div>
	</body>
</html>
