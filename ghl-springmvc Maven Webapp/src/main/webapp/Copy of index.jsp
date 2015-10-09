<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<title>后台管理系统模板</title>
<link type="text/css" rel="stylesheet" href="css/default.css" />
<link type="text/css" rel="stylesheet" href="js/jquery-easyui/themes/gray/easyui.css"/>
<link type="text/css" rel="stylesheet" href="js/jquery-easyui/themes/icon.css" />
<link type="text/css" rel="stylesheet" href="js/JQuery-zTree/css/zTreeStyle/zTreeStyle.css"/>
<script type="text/javascript" src="js/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/JQuery-zTree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/extends.js"></script>
<script type="text/javascript" src="js/common.js"></script>

	</head>

	<body class="easyui-layout">
	<!-- 头部标题 -->
	<div data-options="region:'north',border:false" style="height:50px; padding:3px; background:#F3F3F3"> 
		<a href="www.solooo.net"><span class="northTitle">jQuery EasyUI</span></a>
	    <span class="loginInfo">登录用户：admin&nbsp;&nbsp;姓名：管理员&nbsp;&nbsp;角色：系统管理员</span>
	</div>
		<!-- 左侧导航 -->
		<div data-options="region:'west',split:true,title:'导航菜单', fit:false"
			style="width: 200px;">
			<ul id="menuTree" class="ztree">
			</ul>
		</div>

		<!-- 页脚信息 -->
		<div data-options="region:'south',border:false"
			style="height: 20px; background: #F3F3F3; padding: 2px; vertical-align: middle;">
			<span id="sysVersion">系统版本：V1.0</span>
			<span id="nowTime"></span>
		</div>

		<!-- 内容tabs -->
		<div id="center" data-options="region:'center'">
			<div id="tabs" class="easyui-tabs">
				<div title="首页" style="padding: 5px; display: block;">
					<p>
						模板说明：
					</p>
					<ul>
						<li>
							主界面使用 easyui1.3.5
						</li>
						<li>
							导航树使用 JQuery-zTree-v3.5.15
						</li>
					</ul>
					<p>
						特性说明：
					</p>
					<ul>
						<li>
							所有弹出框均显示在顶级父窗口
						</li>
						<li>
							修改easyui window拖动，移动时显示窗口而不显示虚线框，并限制拖动范围
						</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 用于弹出框 -->
		<div id="parent_win"></div>

	</body>
</html>