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
<script type="text/javascript">
	$(function() {
		var url;
		
		//添加用户链接
		$("#btnSave").bind("click", function() {
			$("#userForm").form("clear");
			$("#username").removeAttr("readonly");
			$("#boy").attr("checked", "checked");
			$("#saveOrUpdateDialog").dialog("open").dialog("setTitle", "添加用户");
			url = "userInfo/save.do";
		});

		//编辑用户链接
		$("#btnEdit").bind("click",function() {
			var selectedRow = $("#dataGridTable").datagrid("getSelections");
			if (selectedRow.length <= 0) {
				$.messager.alert("提示", "请选择需编辑的行", "error");
			} else {
				$.post("userInfo/get.do", {
					"userId" : selectedRow[0].userId
				}, function(data) {
					//window.alert($.param(data));
					if (data) {
						var data = eval(data);
						//$("#userForm").form("clear");
						///$("#password").parent().parent().hide();
						$("#password").val(data.password);
						$("#username").val(data.username).attr(
								"readonly", "readonly");
						$("#boy").attr("checked", "checked");
						if (data.sexFlag == "1") {
							$("#boy").attr("checked", "checked");
						} else {
							$("#girl").attr("checked", "checked");
						}
						$("#telephoneNo").val(data.telephoneNo);
						$("#emailAddr").val(data.emailAddr);
						$("#realname").val(data.realname);
						$("#remark").val(data.remark);

						$("#saveOrUpdateDialog").dialog("open").dialog(
								"setTitle", "编辑用户");
						url = "userInfo/update.do?userId=" + data.userId;
					}
				}, "json");
			}
		});

		//删除用户链接
		$("#btnRemove").bind("click", function() {
			var selectedRow = $("#dataGridTable").datagrid("getSelections");
			if (selectedRow.length <= 0) {
				$.messager.alert("提示", "请选择需删除的行", "error");
			} else {
				$.messager.confirm("提示", "确认删除?", function(r) {
					//alert(selectedRow[0].userId);
					if (r) {
						$.post("userInfo/remove.do", {
							"userId" : selectedRow[0].userId
						}, function(data) {
							var data = eval("("+data+")");
							if (data.result == "succ") {
								$.messager.alert("提示", "删除成功", "info");
								$("#saveOrUpdateDialog").dialog("close");
								$("#dataGridTable").datagrid("reload");
							} else {
								$.messager.alert("提示", "删除失败", "error");
							}
						}, "text");
					}
				});
			}
		});

		//查询链接
		$("#btnQuery").bind("click", function() {
			var queryUserId = $.trim($("#queryUserId").val());
			var queryUserName = $.trim($("#queryUserName").val());
			var querySex = $.trim($("#querySex").val());
			$("#dataGridTable").datagrid("load", {
				"userId" : queryUserId,
				"username" : queryUserName,
				"sexFlag" : querySex
			});
		});
		
		//构造对话框
		$("#saveOrUpdateDialog").dialog({
			buttons : [{
				text : "保存",
				iconCls : "icon-save",
				handler : function() {
					$("#userForm").form("submit",{
						url : url,
						onSubmit : function() {
							return $(this).form("validate");
						},
						success : function(data) {
							//alert(data);
							var data = eval("("+data+")");
							//alert(data.result);
							if (data.result == "succ") {
								$.messager.alert(
										"提示",
										"保存成功",
										"info");
								$("#dataGridTable").datagrid("reload");
								$("#saveOrUpdateDialog").dialog("close");
							} else if (data.result == "fail") {
								$.messager.alert(
									"提示",
									"保存失败",
									"error");
							} else {
								$.messager.alert(
									"提示",
									"该用户名称已存在,请重新输入",
									"error");
								$("#username").val(
									" ").focus();
							}
						}
					});
				}
			}, {
				text : "取消",
				iconCls : "icon-cancel",
				handler : function() {
					$("#saveOrUpdateDialog").dialog("close");
				}
			} ]
		});
		
		var editRow = undefined;
		//构造列表
		$('#dataGridTable').datagrid({
			nowrap : true,
			striped : true,
			loadMsg : '数据装载中......',
			collapsible : true,
			fit : true,
			fitColumns : true,
			scrollbarSize : '15',
			idField : 'id',
			toolbar : '#toolbar',
			rownumbers : true,
			singleSelect : true,
			pagination : true,
			url : 'userInfo/findJson.do',
			method : 'get',
			//sortName : 'userId',
			//sortOrder : 'desc',
			remoteSort : false,
			pagination : true,
			rownumbers : true,
			autoRowHeight : false,
			striped : true,
			columns : [ [ {
				field : 'userId',
				title : '用户ID',
				width : 100,
				align : 'center'
			}, {
				field : 'username',
				title : '用户名',
				width : 200,
				align : 'center',
				sortable : true,
				sorter : function(a, b) {
					a = a.split('/');
					b = b.split('/');
					if (a[2] == b[2]) {
						if (a[0] == b[0]) {
							return (a[1] > b[1] ? 1 : -1);
						} else {
							return (a[0] > b[0] ? 1 : -1);
						}
					} else {
						return (a[2] > b[2] ? 1 : -1);
					}
				}
			}, {
				field : 'sexFlag',
				title : '性别',
				width : 100,
				align : 'center',
				formatter : function(val, rec) {
					if (val == 1)
						return "男";
					else if (val == 0)
						return "女";
					else
						return val;
				}
			}, {
				field : 'telephoneNo',
				title : '手机号码',
				width : 200,
				align : 'center'
			}, {
				field : 'emailAddr',
				title : '邮箱',
				width : 200,
				align : 'center'
			}, {
				field : 'createTime',
				title : '创建时间',
				width : 300,
				align : 'center',
				formatter : function(value, row, index) {
					var unixTimestamp = new Date(value);
					return unixTimestamp.toLocaleString();
				}
			} ] ]
		});

		//设置分页控件 
		var p = $('#dataGridTable').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 10, 20, 30, 50 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示{from} - {to} 条记录   共  {total} 条记录'
		});
	});
	
</script>
</head>

<body class="easyui-layout">
	<!-- 表格顶部工具按钮 -->
	<div id="toolbar">
		<table id="search_table">
			<tr>
				<td><label>用户ID：</label><input name="userId" id="queryUserId" /></td>
				<td><label>用户名：</label><input name="userName" id="queryUserName" /></td>
				<td><label>性别：</label><select name="sex" id="querySex">
						<option value="">全部</option>
						<option value="1">男性</option>
						<option value="0">女性</option>
				</select>
				</td>
				<td>&nbsp; <a href="javascript:void(0)" id="btnQuery"
					class="easyui-linkbutton my-search-button" iconCls="icon-search"
					plain="true">查询</a>
				</td>
			</tr>
		</table>
		<!-- 用来画一条分割线 -->
		<table style="width: 100%; border-bottom:solid 1px #CCC;">
			<tr></tr>
		</table>
		<table>
			<tr>
				<td><a href="javascript:void(0)" id="btnSave"
					class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
				</td>
				<td><a href="javascript:void(0)" id="btnEdit"
					class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				</td>
				<td><a href="javascript:void(0)" id="btnRemove"
					class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
				</td>
			</tr>
		</table>
	</div>
	<!-- 数据表格区域 -->
	<div id="data_area" data-options="region:'center'" style="padding: 3px;">
		<table id="dataGridTable" cssstyle="table-layout: fixed;" >
		</table>
	</div>
	<!-- 对话框 -->
	<div id="saveOrUpdateDialog" closed="true" data-options="region:'center'" >
		<form id="userForm" method="post">
			<table>
				<tr>
					<th>用户名:</th>
					<td><input id="username" name="username" type="text" class="easyui-validatebox"
						required="true" missingMessage="请填写你的名字" /></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input id="password" name="password" type="text" class="easyui-validatebox"
						required="true" missingMessage="请填写密码" /></td>
				</tr>
				<tr>
					<td>昵称:</td>
					<td><input id="realname" name="realname"  type="text" class="easyui-validatebox"
						required="true" missingMessage="请填写你的名字" /></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td><label> <input type="radio" id="boy" name="sexFlag"
							value="1" /> 男 </label> <label> <input type="radio" id="girl"
							name="sexFlag" value="0" /> 女 </label></td>
				</tr>
				<tr>
					<td>手机号码:</td>
					<td><input id="telephoneNo" name="telephoneNo" type="text"
						class="easyui-validatebox"
						required="true"  validType="mobile" missingMessage="请填写正确的手机号码" invalidMessage="手机号码格式错误" /></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><input id="emailAddr" name="emailAddr" class="easyui-validatebox" type="text"
						required="true" validType="email" missingMessage="请填写你的邮箱"
						invalidMessage="邮箱格式错误" /></td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><textarea id="remark" name="remark" cols=80 rows=3 style="resize: none;" value="123@163.com"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
