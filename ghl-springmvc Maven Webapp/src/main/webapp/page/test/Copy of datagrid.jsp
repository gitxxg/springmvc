<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>用户列表</title>
<link type="text/css" rel="stylesheet" href="css/default.css" />
<link type="text/css" rel="styleSheet"
	href="js/jquery-easyui/themes/gray/easyui.css" />
<link type="text/css" rel="styleSheet"
	href="js/jquery-easyui/themes/icon.css" />
<script type="text/javascript" src="js/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/common/extend-easyui-validatebox.js"></script>

</head>

<body class="easyui-layout">
	<div id="center" data-options="region:'center'" style="padding: 5px;">
		<!-- 表格顶部工具按钮 -->
		<div id="toolbar" style="padding: 0px 0px;">
			<!-- 查询条件区域 -->
			<div id="search_area">
				<table>
					<tr>
						<td>用户ID：</td>
						<td><input name="userId" id="queryUserId" />
						</td>
						<td>用户名：</td>
						<td><input name="userName" id="queryUserName" />
						</td>
						<td>性别：</td>
						<td><select name="sex" id="querySex">
								<option value="">全部</option>
								<option value="1">男性</option>
								<option value="0">女性</option>
						</select></td>
						<td>&nbsp; <a href="javascript:void(0)" id="btnQuery"
							class="easyui-linkbutton my-search-button" iconCls="icon-search"
							plain="true">查询</a>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
			<%--<hr style="height:1px;border:none;border-top:1px solid #CCC;" />
			--%>

			<div id="tools_area" >
				<table>
					<tr>
						<td>
							<a href="javascript:void(0)" id="btnSave" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">新增</a> 
						</td>
						<td>
							<a href="javascript:void(0)" id="btnEdit" class="easyui-linkbutton" 
				iconCls="icon-edit" plain="true">修改</a> 
						</td>
						<td>
							<a href="javascript:void(0)" id="btnRemove" class="easyui-linkbutton" 
				iconCls="icon-remove" plain="true">删除</a>
						</td>
					</tr>
				</table>
			<%--<a href="javascript:void(0)" id="btnSave" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">新增</a> 
			<a href="javascript:void(0)" id="btnEdit" class="easyui-linkbutton" 
				iconCls="icon-edit" plain="true">修改</a> 
			<a href="javascript:void(0)" id="btnRemove" class="easyui-linkbutton" 
				iconCls="icon-remove" plain="true">删除</a>
			--%></div>
		</div>
		<table class="easyui-datagrid"
			data-options="fit:true,singleSelect:true,rownumbers:true,fitColumns:true,autoRowHeight:false,
				pagination:true, pageSize:10, toolbar:'#toolbar'">
			<thead>
				<tr>
					<th data-options="field:'f1',width:100">Title1</th>
					<th data-options="field:'f2',width:100">Title2</th>
					<th data-options="field:'f3',width:100">Title3</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
				<tr>
					<td>d11</td>
					<td>d12</td>
					<td>d13</td>
				</tr>
				<tr>
					<td>d21</td>
					<td>d22</td>
					<td>d23</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>
