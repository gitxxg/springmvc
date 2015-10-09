<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/default.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.3.5/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.3.5/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/extends.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script>

$(function(){

//添加用户链接
	$("#btnSave").bind("click", function() {
		$("#userForm").form("clear");
		$("#name").removeAttr("readonly");
		$("#boy").attr("checked", "checked");
		$("#userOper").dialog("open").dialog("setTitle", "添加用户");
		url = "user!save";
	});

	//编辑用户链接
	$("#btnEdit").bind(
			"click",
			function() {
				var selectedRow = $("#tt").datagrid("getSelections");
				if (selectedRow.length <= 0) {
					$.messager.alert("提示", "请选择需编辑的行", "error");
				} else {
					$.post("user!find", {
						"userID" : selectedRow[0].id
					}, function(data) {
						//window.alert($.param(data));
							if (data) {
								var userJsonData = eval(data);
								$("#userForm").form("clear");
								$("#name").val(userJsonData.name).attr(
										"readonly", "readonly");
								if (userJsonData.sex == 0) {
									$("#boy").attr("checked", "checked");
								} else {
									$("#girls").attr("checked", "checked");
								}
								$("#phone").val(userJsonData.phone);
								$("#email").val(userJsonData.email);
								$("#remark").val(userJsonData.remark);

								$("#userOper").dialog("open").dialog(
										"setTitle", "编辑用户");
								url = "user!edit?userID=" + userJsonData.id;
							}
						}, "json");
				}
			});

	//删除用户链接
	$("#btnRemove").bind("click", function() {
		var selectedRow = $("#tt").datagrid("getSelections");
		if (selectedRow.length <= 0) {
			$.messager.alert("提示", "请选择需编辑的行", "error");
		} else {
			$.messager.confirm("提示", "确认删除?", function(r) {
				if (r) {
					$.post("user!remove", {
						"userID" : selectedRow[0].id
					}, function(data) {
						if (data == "succ") {
							$.messager.alert("提示", "删除成功", "info");
							$("#userOper").dialog("close");
							$("#tt").datagrid("reload");
						} else {
							$.messager.alert("提示", "删除失败", "error");
						}
					}, "text");
				}
			});
		}
	});
	
	$("#tt").datagrid({
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width(),
		idField:'id',
		nowrap : true,
		striped : true,
		collapsible : true,
		singleSelect : true,
		url:"user!list",  
		singleSelect:true, 
		nowrap:true,
		fit:true,
		fitColumns:true,
		rownumbers:true,
		showPageList:false,
		//toolbar:'#tt_btn',  
        pagination : true,
		rownumbers : true ,
		pagePosition : 'bottom' ,
		pageSize : 10,
		columns : [ [ {
			field : 'name',
			title : '名称',
			width : 100,
			align : 'center'
		}, {
			field : 'sex',
			title : '性别',
			width : 100,
			align : 'center',
			formatter : function(val, rec) {
				if (val == 1)
					return "男";
				else if (val == 2)
					return "女";
			}
		}, {
			field : 'phone',
			title : '手机号码',
			width : 200,
			align : 'center'
		}, {
			field : 'email',
			title : '邮箱',
			width : 200,
			align : 'center'
		}, {
			field : "remark",
			title : "备注",
			width : 300,
			align : "center"
		}, {
			field : "id",
			title : "操作",
			width : 500,
			align : "center",
			formatter : function(val, rec) {
				return "<a href='javascript:remove(" + val + ");'>删除</a>";
			}
		} ] ],

		 toolbar: [{
            text: '添加', iconCls: 'icon-add', handler: function () {
                if (editRow != undefined) {
                    $("#Student_Table").datagrid('endEdit', editRow);
                }
                if (editRow == undefined) {
                    $("#Student_Table").datagrid('insertRow', {
                        index: 0,
                        row: {}
                    });
 
                    $("#Student_Table").datagrid('beginEdit', 0);
                    editRow = 0;
                }
            }
        }]
	});
	
	//设置分页控件 
    var p = $('#tt').datagrid('getPager'); 
    $(p).pagination({ 
        pageSize: 10,//每页显示的记录条数，默认为10 
        pageList: [5,10,15],//可以设置每页记录条数的列表 
        beforePageText: '第',//页数文本框前显示的汉字 
        afterPageText: '页    共 {pages} 页', 
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    });
	
	//构造对话框
	$("#userOper").dialog( {
		width : "400",
		height : "300",
		buttons : [ {
			text : "保存",
			iconCls : "icon-save",
			handler : function() {
				$("#userForm").form("submit", {
					url : url,
					onSubmit : function() {
						return $(this).form("validate");
					},
					success : function(result) {
						if (result == "succ") {
							$("#tt").datagrid("reload");
							$("#userOper").dialog("close");
						} else if (result == "fail") {
							$.messager.alert("提示", "保存失败", "error");
						} else {
							$.messager.alert("提示", "该用户名称已存在,请重新输入", "error");
							$("#name").val(" ").focus();
						}
					}
				});
			}
		}, {
			text : "取消",
			iconCls : "icon-cancel",
			handler : function() {
				$("#userOper").dialog("close");
			}
		} ]
	});
	
	//新增弹出框
	$("#save").on("click", function(){
		$parent("#parent_win").window({
			width:274,
			height:225,
			href:'user/addUser.html',
			title:'新增用户'
		});
	});
	//修改
	$("#update").on("click", function(){
		$parent.messager.alert("提示","update", "info");
	});
	//删除
	$("#delete").on("click", function(){
		$parent.messager.alert("提示","delete", "info");
	});
})

function viewDetail(date, id){
	$parent.messager.alert("提示","查询详细", "info");
}

//监听窗口大小变化
window.onresize = function(){
	setTimeout(domresize,300);
};
//改变表格宽高
function domresize(){
	$('#tt').datagrid('resize',{  
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width()
	});
}
</script>
</head>
<body class="easyui-layout" >
<div id="body" region="center" > 
  <!-- 查询条件区域 -->
  <div id="search_area" >
    <div id="conditon">
      <table border="0">
        <tr>
          <td>用户名：</td>
          <td ><input  name="userName" id="userName"   /></td>
          <td>&nbsp;性别：</td>
          <td><input  name="sex" id="sex"  /></td>
          <td>&nbsp;部门：</td>
          <td><input  name="department" id="department"  /></td>
          <td>
              <a  href="javascript:void(0)" class="easyui-linkbutton my-search-button" iconCls="icon-search" plain="true">查询</a> 
              <a  href="javascript:void(0)" class="easyui-linkbutton my-search-button" iconCls="icon-reset" plain="true" >重置</a>
          </td>
          <td></td>
        </tr>
      </table>
    </div>
    <span id="openOrClose">.....</span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="tt" style="table-layout:fixed;" >	
  </table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)"  id="btnSave" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)"  id="btnEdit" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 
      <a href="javascript:void(0)"  id="btnRemove" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
   </div>
</div>
<!-- 对话框 -->
		<div id="userOper" closed="true"
			style="padding-left: 45px; padding-top: 10px;">
			<form id="userForm" method="post">
				<table>
					<tr>
						<td>
							你的名字:
						</td>
						<td>
							<input id="name" name="name" class="easyui-validatebox"
								required="true" missingMessage="请填写你的名字" />
						</td>
					</tr>
					<tr>
						<td>
							性别:
						</td>
						<td>
							<label>
								<input type="radio" id="boy" name="sex" value="1" />
								男
							</label>
							<label>
								<input type="radio" id="girls" name="sex" value="2" />
								女
							</label>
						</td>
					</tr>
					<tr>
						<td>
							手机号码:
						</td>
						<td>
							<input id="phone" name="phone" type="text" />
						</td>
					</tr>
					<tr>
						<td>
							邮箱:
						</td>
						<td>
							<input id="email" name="email" class="easyui-validatebox"
								required="true" validType="email" missingMessage="请填写你的邮箱"
								invalidMessage="邮箱格式错误" />
						</td>
					</tr>
					<tr>
						<td>
							备注:
						</td>
						<td>
							<textarea id="remark" name="remark" cols="23" rows="4"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>
