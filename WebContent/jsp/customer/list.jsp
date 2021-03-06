﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>客户列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css"
	type=text/css rel=stylesheet>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
</SCRIPT>

<script type="text/javascript">
	function ck_function() {
		var str = "";
		var ck = $("input[name='bb']:checked");//这里可以input[type='checkbox']:checked
		var len = ck.length;
		if (len == 0) {
			alert("请选择");
			return false;
		}
		for (var i = 0; i < ck.length; i++) {
			if (ck[i].checked) {
				str += ck[i].value + ",";
			}
		}
		str = str.substr(0, str.length - 1);
		alert(str);
		window.location.href = '${pageContext.request.contextPath }/customer_deletes.action?ck1='
				+ str;

	}
</script>

<script type="text/javascript">
$(function() {
    $("#checkAll").click(function() {
         $('input[name="bb"]').attr("checked",this.checked); 
     });
     var $subBox = $("input[name='bb']");
     $subBox.click(function(){
         $("#checkAll").attr("checked",$subBox.length == $("input[name='bb']:checked").length ? true : false);
     });
 });
</script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>

</HEAD>

<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/customer_like.action"
		method=post>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%"
						background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }
						/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg"
						border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：客户管理 &gt; 客户列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>客户名称：</TD>
													<TD><INPUT class=textbox id=sChannel2
														style="WIDTH: 80px" maxLength=50 name="username"></TD>

													<TD><INPUT class=button id=sButton2 type=submit
														value=" 筛选 " name=sButton2></TD>

													<TD><button type="button" onclick="ck_function()">批量删除</button></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD><input id="checkAll" type="checkbox" />全选</TD>
													<TD>客户名称</TD>
													<TD>客户级别</TD>
													<TD>客户来源</TD>
													<TD>电话</TD>
													<TD>手机</TD>
													<TD>操作</TD>
												</TR>
  			

												<s:iterator value="customers" var="c">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">

														<td><input type="checkbox" name="bb"
															value="${c.cid } " name="ck" /></td>
														<input type="hidden" value="${c.cid }" />
														<TD><s:property value="#c.custName" /></TD>
														<TD><s:property value="#c.custLevel" /></TD>
														<TD><s:property value="#c.custSource" /></TD>
														<TD><s:property value="#c.custPhone" /></TD>
														<TD><s:property value="#c.custMobile" /></TD>
														<td><a
															href="${pageContext.request.contextPath }/customer_updateCustomer.action?cid=${c.cid}"
															style="color: black;">修改</a>|<a
															href="${pageContext.request.contextPath }/customer_deleteCustomer.action?cid=${c.cid }"
															style="color: black;">删除</a></td>
													</TR>
												</s:iterator>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<h1></h1>
									<TD><SPAN id=pagelink>
											<DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B>${page.totalCount }</B>]条记录,共[<B>${page.totalPage }</B>]页
												,当前第[<b>${page.currentPage }</b>]页 [<A
													href="${pageContext.request.contextPath }/customer_list.action?cc=${page.nextPage}">下一页</A>]
												[<A
													href="${pageContext.request.contextPath }/customer_list.action?cc=${page.lastPage}">上一页</A>]
												<input type="hidden" size="3" id="page" name="page" />
											</DIV>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15
						background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg"
						height=15></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
