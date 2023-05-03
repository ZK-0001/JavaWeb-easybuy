<%@ page import="com.ybj.entity.Users" %>
<%@ page import="com.ybj.util.ConvertDate" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.ybj.util.PageUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ybj.entity.Product" %>
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
			<li><a href="user.jsp">用户</a></li>
			<li class="current"><a href="product.jsp">商品</a></li>
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
			Users admin = (Users)adminObj;
			if(admin != null){
		%>
		管理员<%=admin.getUname()%>您好，今天是<%=ConvertDate.dateToStr(new Date(),1)%>，欢迎回到管理后台。
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
		<h2>商品管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>商品名称</th>
					<th>操作</th>
				</tr>
				<%--<tr>
					<td class="first w4 c">1</td>
					<td class="thumb"><img src="../images/product/0_tiny.gif" /><a href="../product-view.jsp" target="_blank">铁三角 Audio-Technica ATH-EQ300M-SV 银色 挂耳式耳机</a></td>
					<td class="w1 c"><a href="product-modify.jsp">修改</a> <a href="javascript:Delete(1);">删除</a></td>
				</tr>--%>
				<%
					//获取所有用户的一页页信息
					Object productObj =  session.getAttribute("pu");
					PageUtil pu = null;
					if(productObj != null){
						pu = (PageUtil) productObj;
						List<Product> productList = pu.getList();
						for(int i = 0; i < productList.size(); i++){
							Product p = productList.get(i);
				%>
				<tr>
					<td class="first w4 c"><%=p.getPid()%></td>
					<td class="thumb"><img src="../images/product/<%=p.getFilename()%>" />
						<a href="../productManagerServlet?status=productView&pid=<%=p.getPid()%>" target="_blank"><%=p.getPname()%></a></td>
					<td class="w1 c"><a href="../productManagerServlet?status=initModify&pid=<%=p.getPid()%>">修改</a>
						<a href="javascript:DeleteProduct('<%=p.getPid()%>')">删除</a></td>
				</tr>
				<%
						}
					} else {
						//用户列表为空访问usersServlet
						response.sendRedirect("../productManagerServlet?status=productPage");
					}
				%>
			</table>
		</div>
		<div class="pager">
			<%
				if (pu != null) {
			%>
			<ul class="clearfix">
				<li class="current">1</li>
				<li><a href="#">2</a></li>
			</ul>
			<table align="center">
				<tr>
					<td><a href="../productManagerServlet?status=productPage&index=<%=pu.getFirst()%>">首页</a></td>
					<td><a href="../productManagerServlet?status=productPage&index=<%=pu.getBack()%>">上一页</a></td>
					<td><%=pu.getNow()%>/<%=pu.getTotal()%>
					</td>
					<td><a href="../productManagerServlet?status=productPage&index=<%=pu.getNext()%>">下一页</a></td>
					<td><a href="../productManagerServlet?status=productPage&index=<%=pu.getLast()%>">尾页</a></td>
				</tr>
			</table>
			<%
				}
				session.removeAttribute("pu");
			%>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 湖南软测信息技术有限公司 All Rights Reserved. 湘ICP证1001号
</div>
</body>
</html>
