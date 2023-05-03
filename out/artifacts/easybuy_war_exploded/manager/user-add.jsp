<%@ page import="com.ybj.entity.Users" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.ybj.util.ConvertDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>后台管理 - 易买网</title>
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
	<script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li class="current"><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li><a href="order.jsp">订单</a></li>
			<li><a href="guestbook.jsp">留言</a></li>
			<li><a href="news.jsp">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		<%
			//获取登录的管理员信息
			Object adminObj = session.getAttribute("administrator");
			Users admin = (Users) adminObj;
			if (admin != null) {
		%>
		管理员<%=admin.getUname()%>您好，今天是<%=ConvertDate.dateToStr(new Date(), 1)%>，欢迎回到管理后台。
		<%
			}
		%>
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><em><a href="user-add.jsp">新增</a></em><a href="user.jsp">用户管理</a></dd>
				<dt>商品信息</dt>
				<dd><em><a href="productClass-add.jsp">新增</a></em><a href="productClass.jsp">分类管理</a></dd>
				<dd><em><a href="product-add.jsp">新增</a></em><a href="product.jsp">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="order.jsp">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="guestbook.jsp">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="news-add.jsp">新增</a></em><a href="news.jsp">新闻管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>添加用户</h2>
		<div class="manage">
			<form action="../usersManagerServlet">
				<input type="hidden" name="status" value="userAdd" />
				<table class="form">
					<tr>
						<td class="field">用户编号(*)：</td>
						<td><input type="text" class="text" name="uid" /></td>
					</tr>
					<tr>
						<td class="field">用户名(*)：</td>
						<td><input type="text" class="text" name="uname" /></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input type="text" class="text" name="passWord" value="" /></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td><input type="radio" name="gender" value="男" checked="checked" />男 <input type="radio" name="gender" value="女" />女</td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<input type="date" name="birthday" />
						</td>
					</tr>
					<tr>
						<td class="field">身份证：</td>
						<td><input type="text" class="text" name="identityCode" id="identityCode" /></td>
					</tr>
					<tr>
						<td class="field">电子邮件：</td>
						<td><input type="text" class="text" name="email" value="" id="email" /></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="mobile" /></td>
					</tr>
					<tr>
						<td class="field">地址(*)：</td>
						<td><input type="text" class="text" name="address" id="address" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="addUser" value="增加用户" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 湖南软测信息技术有限公司 All Rights Reserved. 湘ICP证1001号
</div>
</body>
</html>
