<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 3. 5.
  Time: PM 7:18
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><c:import url="/WEB-INF/views/admin/components/datatables.jsp" charEncoding="UTF-8">
    <c:param name="viewUrl" value="/system/groupDetail.do?id="/>
    <c:param name="regUrl" value="/system/groupRegForm.do"/>
    <c:param name="editUrl" value="/system/groupModifyForm.do?id="/>
    <c:param name="delUrl" value="/system/groupRemove.do"/>
</c:import>
<script>
    var table;
    $(document).ready(function () {
        table = $('#datatables').DataTable({
            "processing": true
            , "columns": [
                {"data": "id", "name": "id", "orderable": false, "visible": false}
                , {"data": "name", "name": "name", "orderable": true, "visible": true}
                , {"data": "type", "name": "type", "orderable": true}
                , {"data": "startTime", "name": "startTime", "orderable": true}
                , {"data": "endTime", "name": "endTime", "orderable": true}
                , {"data": "owner", "name": "owner", "orderable": true}
                , {"data": "createTime", "name": "createTime", "orderable": true}
            ]
            , "order": [[0, "desc"]]
            , "sort": true
            , "serverSide": true
            , "ajax": {
                "url": "${ctxRoot}/system/groupList.json"
                , "type": "POST"
                , "data": function (d) {
                    return $.extend({}, d, {
                        "name": $("#datatables_wrapper .dataTables_filter input").val()
                    });
                }
                , "beforeSend": function (jqXHR, settings) {
                    jqXHR.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                    try {
//                            $("#eventListForm #searchButton").prop("disabled", true);
                        setCursor("eventListForm", "wait");
                    } catch (e) {
                    }
                }
                , "complete": function (jqXHR, textStatus) {
                    try {
//                            $("#eventListForm #searchButton").prop("disabled", false);
                        setCursor("eventListForm", "default");
                    } catch (e) {
                    }
                }
                , error: function(xhr){
                    datatableErrorHandling(xhr, "");
                }
            }
            , "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $(nRow).css("cursor", "pointer").on("click", function () {
                    viewDetail(aData.id);
                });
            }
        });
        $('#datatables_wrapper .table-caption').text('그룹');
        $('#datatables_wrapper .dataTables_filter input').attr('placeholder', '그룹명');
//            table.draw(true);
    });
</script>
<div class="px-content">
    <div class="page-header">
        <h1><span class="text-muted font-weight-light"><i class="page-header-icon ion-ios-keypad"></i>System / </span>그룹관리
        </h1>
    </div>

    <div id="listDiv" class="panel">
        <div class="panel-heading">
            <div class="panel-title">
                <span>그룹목록</span>
                <div class="panel-heading-controls width-md-auto width-lg-auto width-xl-auto pull-md-right">
                    <a href="#" onclick="addData('/system/groupReg.do');" class="btn btn-primary btn-block"><span class="btn-label-icon left ion-plus-round"></span>Create</a>
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
                        <th>그룹명</th>
                        <th>종류</th>
                        <th>시작</th>
                        <th>종료</th>
                        <th>등록자</th>
                        <th>등록일</th>
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
