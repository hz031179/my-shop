<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Shop | 分类管理</title>
    <jsp:include page="../includes/header.jsp"/>
    <!-- treeTable CSS -->
    <link rel="stylesheet" href="/static/assets/plugins/treeTable/themes/vsStyle/treeTable.min.css"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../includes/nav.jsp"/>
    <jsp:include page="../includes/menu.jsp"/>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                分类管理
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">分类管理</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>
                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title">分类管理列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <a href="/content/category/form" type="button" class="btn btn-sm btn-default"><i
                                    class="fa fa-plus"></i>新增</a>&nbsp;&nbsp;&nbsp;
                            <a href="#" type="button" class="btn btn-sm btn-default"><i
                                    class="glyphicon glyphicon-import"></i>导入</a>&nbsp;&nbsp;&nbsp;
                            <a href="#" type="button" class="btn btn-sm btn-default"><i
                                    class="glyphicon glyphicon-export"></i>导出</a>&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="box-body table-responsive">
                            <table id="treeTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>名字</td>
                                    <td>排序</td>
                                    <td>操作</td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${tbContentCategories}" var="tbContentCategorie">
                                    <tr id="${tbContentCategorie.id}" pId="${tbContentCategorie.parent.id}">
                                        <td>${tbContentCategorie.id}</td>
                                        <td>${tbContentCategorie.name}</td>
                                        <td>${tbContentCategorie.sortOrder}</td>
                                        <td>
                                            <a href="/content/category/form?id=${tbContentCategorie.id}" type="button"
                                               class="btn btn-sm btn-primary"><i
                                                    class="fa fa-edit"></i>编辑</a>&nbsp;&nbsp;&nbsp;
                                            <button type="button" class="btn btn-sm btn-danger"
                                                    onclick="App.deleteSingle('/content/category/delete','${tbContentCategorie.id}','警告：该删除操作将会将包括选中类目在内的全部子类目及属于类目的内容一并删除，请谨慎操作！您还确定删除吗?')">
                                                <i
                                                        class="fa fa-trash-o"></i>删除
                                            </button>&nbsp;&nbsp;&nbsp;
                                            <a href="/content/category/form?parent.id=${tbContentCategorie.id}&parent.name=${tbContentCategorie.name}"
                                               type="button"
                                               class="btn btn-sm btn-default"><i
                                                    class="fa fa-plus"></i>新增下级菜单</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../includes/copyright.jsp"/>
</div>
<jsp:include page="../includes/footer.jsp"/>
<!-- treeTable JS -->
<script src="/static/assets/plugins/treeTable/jquery.treeTable.min.js"></script>
<!-- 加载自定义模态对话框 -->
<sys:modal/>

<script>
    $(function () {
        $("#treeTable").treeTable({
            expandLevel: 2,// int {树表的展开层次. 默认:1}
            column: 1 // int {可控制列的序号. 默认:0，即第一列}
        });
    });
</script>
</body>
</html>