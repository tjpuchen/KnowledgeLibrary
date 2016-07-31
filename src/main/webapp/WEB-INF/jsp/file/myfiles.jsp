<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>我的资源</title>
<%@include file="../common/head.jsp"%>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<%@include file="../common/slidebar.jsp"%>
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">我的资源</strong> / <small>我上传的资源</small>
					</div>
				</div>
				<div class="am-u-sm-12">
					<table class="am-table table-hover am-table-radius am-table-hover am-table-compact am-table-striped">
						<thead>
							<tr>
								<th>文件名称</th>
								<th>文件大小</th>
								<th>文件状态</th>
								<th>上传时间</th>
								<th>文件类别</th>
								<th>管理</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="f">
								<tr>
									<td>${f.fileName }</td>
									<td>${f.fileSizeFormat }</td>
									<td>${f.fileStateStr }</td>
									<td><fmt:formatDate value="${f.fileCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${f.fileClassId }</td>
									<td>
										<div class="am-dropdown" data-am-dropdown="">
											<button
												class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
												data-am-dropdown-toggle="">
												<span class="am-icon-cog"></span> <span
													class="am-icon-caret-down"></span>
											</button>
											<ul class="am-dropdown-content">
												<li><a href="#">1. 编辑</a></li>
												<li><a href="#">2. 下载</a></li>
												<li><a href="#">3. 删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div class="am-cf">
						共 ${page.size} 条记录
						<div class="am-fr">
							<ul class="am-pagination">
								<c:if test="${page.pageNum > 1}">
									<li><a onclick="gotoPage(${page.prePage })">«</a></li>
								</c:if>

								<c:forEach items="${page.navigatepageNums}" var="p">
									<c:if test="${page.pageNum==p}">
										<li class="am-active"><a onclick="gotoPage(${p})">${p}</a></li>
									</c:if>
									<c:if test="${page.pageNum!=p}">
										<li><a onclick="gotoPage(${p})">${p}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${page.pageNum < page.pages}">
									<li><a onclick="gotoPage(${page.nextPage })">»</a></li>
								</c:if>
							</ul>
						</div>
					</div>

					<script type="text/javascript">
						var url = "user/myfiles/";
						function gotoPage(page) {
							window.location.href = url + page;
						}
					</script>
				</div>

			</div>
		</div>
	</div>

	<%@include file="../common/footer.jsp"%>
	<!-- content end -->
</body>
</html>