<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 3. 5.
  Time: PM 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%>
  <nav class="px-nav px-nav-left" id="px-demo-nav">
    <button type="button" class="px-nav-toggle" data-toggle="px-nav">
      <span class="px-nav-toggle-arrow"></span>
      <span class="navbar-toggle-icon"></span>
      <span class="px-nav-toggle-label font-size-11">HIDE MENU</span>
    </button>

    <ul class="px-nav-content">
      <li class="px-nav-box p-a-3 b-b-1" id="demo-px-nav-box">
        <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <img src="${ctxRoot}/assets/admin/dist/demo/avatars/1.jpg" alt="" class="pull-xs-left m-r-2 border-round" style="width: 54px; height: 54px;">
        <div class="font-size-16"><span class="font-weight-light">Welcome, </span><strong>John</strong></div>
        <div class="btn-group" style="margin-top: 4px;">
          <a href="#" class="btn btn-xs btn-primary btn-outline"><i class="fa fa-envelope"></i></a>
          <a href="#" class="btn btn-xs btn-primary btn-outline"><i class="fa fa-user"></i></a>
          <a href="#" class="btn btn-xs btn-primary btn-outline"><i class="fa fa-cog"></i></a>
          <a href="#" class="btn btn-xs btn-danger btn-outline"><i class="fa fa-power-off"></i></a>
        </div>
      </li>

      <li class="px-nav-item px-nav-dropdown">
        <a href="#"><i class="px-nav-icon ion-ios-pulse-strong"></i><span class="px-nav-label">Dashboards<span class="label label-danger">5</span></span></a>

        <ul class="px-nav-dropdown-menu">
          <li class="px-nav-item"><a href="${ctxRoot}/admin/index.do"><span class="px-nav-label">Default</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/admin/company.do"><span class="px-nav-label">Company</span></a></li>
        </ul>
      </li>
      <li class="px-nav-item px-nav-dropdown">
        <a href="#"><i class="px-nav-icon ion-ios-color-filter"></i><span class="px-nav-label">Company</span></a>

        <ul class="px-nav-dropdown-menu">
          <li class="px-nav-item"><a href="${ctxRoot}/admin/infomation.do"><span class="px-nav-label">Info</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/admin/schedule.do"><span class="px-nav-label">Schedule</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/admin/staff.do"><span class="px-nav-label">Staff</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/admin/purchase-history.do"><span class="px-nav-label">Purchase</span></a></li>
        </ul>
      </li>
      <li class="px-nav-item px-nav-dropdown">
        <a href="#"><i class="px-nav-icon ion-monitor"></i><span class="px-nav-label">Contents</span></a>

        <ul class="px-nav-dropdown-menu">
          <li class="px-nav-item"><a href="${ctxRoot}/admin/coupon.do"><span class="px-nav-label">Coupon</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/admin/style.do"><span class="px-nav-label">Style</span></a></li>
        </ul>
      </li>
      <li class="px-nav-item px-nav-dropdown">
        <a href="#"><i class="px-nav-icon ion-android-checkbox-outline"></i><span class="px-nav-label">Support</span></a>

        <ul class="px-nav-dropdown-menu">
          <li class="px-nav-item"><a href="${ctxRoot}/admin/support-center.do"><span class="px-nav-label">Support-Center</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/admin/pricing.do"><span class="px-nav-label">Pricing</span></a></li>
        </ul>
      </li>
      <li class="px-nav-item px-nav-dropdown">
        <a href="#"><i class="px-nav-icon ion-stats-bars"></i><span class="px-nav-label">System</span></a>

        <ul class="px-nav-dropdown-menu">
          <li class="px-nav-item"><a href="${ctxRoot}/system/group.do"><span class="px-nav-label">Group</span></a></li>
          <li class="px-nav-item"><a href="${ctxRoot}/system/user.do"><span class="px-nav-label">User</span></a></li>
        </ul>
      </li>
      <li class="px-nav-item">
        <a href="${ctxRoot}/assets/admin/color-generator/index.html"><i class="px-nav-icon ion-aperture"></i><span class="px-nav-label">Color Generator</span></a>
      </li>
      <li class="px-nav-item">
        <a href="${ctxRoot}/assets/admin/html/static/index.html" target="_blank" class="text-white b-a-0"><i class="px-nav-icon ion-social-windows"></i><span class="px-nav-label">PixelAdmin</span></a>
      </li>
      <li class="px-nav-item">
        <a href="${ctxRoot}/assets/admin/docs/index.html" target="_blank" class="bg-success text-white b-a-0"><i class="px-nav-icon ion-social-buffer"></i><span class="px-nav-label">Docs</span></a>
      </li>
      <li class="px-nav-box b-t-1 p-a-2">
        <a href="${ctxRoot}/admin/pricing.do" class="btn btn-primary btn-block btn-outline">Create Invoice</a>
      </li>
    </ul>
  </nav>