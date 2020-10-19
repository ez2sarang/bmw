<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 3. 5.
  Time: PM 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
        %>
<%@ include file="/WEB-INF/views/common/includes.jsp"
        %>
<c:import url="/WEB-INF/views/admin/components/datatables.jsp" charEncoding="UTF-8">
    <c:param name="viewUrl" value="/system/userDetail.do?id="/>
    <c:param name="regUrl" value="/system/userRegForm.do"/>
    <c:param name="editUrl" value="/system/userModifyForm.do?id="/>
    <c:param name="delUrl" value="/system/userRemove.do"/>
</c:import>
<script>
    var table;
    $(document).ready(function () {
        table = $('#datatables').DataTable({
            "processing": true
            , "columns": [
                {"data": "id", "name": "id", "orderable": false, "visible": false}
                , {"data": "userId", "name": "userId", "orderable": true, "visible": true}
                , {"data": "userName", "name": "userName", "orderable": true, "visible": true}
                , {"data": "type", "name": "type", "orderable": true}
                , {"data": "userGrade", "name": "userGrade", "orderable": true}
                , {"data": "userPhone", "name": "userPhone", "orderable": true}
                , {"data": "userEmail", "name": "userEmail", "orderable": true}
                , {"data": "createTime", "name": "createTime", "orderable": true}
            ]
            , "order": [[0, "desc"]]
            , "sort": true
            , "serverSide": true
            , "ajax": {
                "url": "${ctxRoot}/system/userList.json"
                , "type": "POST"
                , "data": function (d) {
                    return $.extend({}, d, {
                        "userId": $("#datatables_wrapper .dataTables_filter input").val()
                    });
                }
                , "beforeSend": function (jqXHR, settings) {
                    jqXHR.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                    try {
                        $(".btn").css("cursor","default");
                        $(".btn").prop("disabled", false);
                    } catch (e) {
                    }
                }
                , "complete": function (jqXHR, textStatus) {
                    try {
                        $(".btn").css("cursor","default");
                        $(".btn").prop("disabled", false);
                    } catch (e) {
                    }
                }
                , error: function (xhr) {
                    datatableErrorHandling(xhr, "");
                }
            }
            , "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $(nRow).css("cursor", "pointer").on("click", function () {
                    viewDetail(aData.id);
                });
            }
        });
        $('#datatables_wrapper .table-caption').text('사용자');
        $('#datatables_wrapper .dataTables_filter input').attr('placeholder', '아이디');
//            table.draw(true);
    });
</script>
<div class="px-content">
    <div class="page-header">
        <h1><span class="text-muted font-weight-light"><i class="page-header-icon ion-ios-keypad"></i>System / </span>사용자 관리
        </h1>
    </div>

    <div id="listDiv" class="panel">
        <div class="panel-heading">
            <div class="panel-title">
                <span>사용자 목록</span>

                <div class="panel-heading-controls width-md-auto width-lg-auto width-xl-auto pull-md-right">
                    <a href="#" onclick="addData('/system/userReg.do');" class="btn btn-primary btn-block"><span class="btn-label-icon left ion-plus-round"></span>Create</a>
                </div>
            </div>
            <div class="panel-heading-controls">

            </div>
        </div>
        <div class="panel-body">
            <div class="table-primary">
                <table width="100%" class="table table-striped table-bordered" id="datatables">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>타입</th>
                        <th>등급</th>
                        <th>휴대폰</th>
                        <th>이메일</th>
                        <th>가입일</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="detailDiv" style="display:none"></div>
</div>
