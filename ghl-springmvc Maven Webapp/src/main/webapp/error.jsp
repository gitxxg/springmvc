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
		<!-- 内容tabs -->
		<div id="center" data-options="region:'center'">
				<div title="错误" style="padding: 5px; display: block;">
					<p>
						404：请求无效!!!
					</p>
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
	</body>
</html>
