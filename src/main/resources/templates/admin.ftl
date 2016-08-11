<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>管理员</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
     <#include "head.ftl"/>
      <!--header end-->
      <!--sidebar start-->
     <#include "left.ftl"/>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-sm-6">
                      <section class="panel">
                          <header class="panel-heading">
                              管理员
                          </header>
                        
                      </section>
                  </div>
              </div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              管理员
                          <a href="/addAdministrator"><button type="button" class="btn btn-info" style="float:right;">添加</button></a>
                          </header>
                         <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr>                                                       
                              <th class="hidden-phone">用户名</th>                                                     
                              <th class="hidden-phone">加入时间</th>
                              <th>管理员组</th>
                              <th class="hidden-phone">类型</th>                           
                              <th></th>
                          </tr>
                          </thead>
                          <tbody>
                          <#list list as admin>  
                          <tr class="odd gradeX">                          
                              <td>${admin.username}</td>                                                        
                              <td class="center hidden-phone">${admin.joinTime}</td> 
                              <td class="hidden-phone">${admin.admin_group_id}</td>  
                              <td>
                              <#if admin.type == 0>
                              超级
                              <#else>
                              普通
                              </#if>
                              </td>                         
                               <td>                                     
                                       <a href="/updateAdministrator?id=${admin.id}&username1=${admin.username}"><button class="btn btn-primary btn-xs"><i class="icon-pencil"></i></button></a>
                                       <a onclick='if(confirm("确认删除")){window.location.href="/deleteAdministrator?id=${admin.id}";}'><button class="btn btn-danger btn-xs"><i class="icon-trash "></i></button></a>
                               </td>
                          </tr>  
                          </#list>                                         
                          </tbody>
                          </table>
                          </table>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
 	<script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>

    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>
	
	<!--script for this page only-->
    <script src="js/dynamic-table.js"></script>

  </body>
</html>