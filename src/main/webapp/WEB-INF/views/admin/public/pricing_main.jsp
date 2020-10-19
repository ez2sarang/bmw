<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 3. 5.
  Time: PM 7:35
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><!-- Custom styling -->
<style>
  .widget-pricing,
  .pricing-page-customers-logos {
    max-width: 800px;
  }

  .pricing-page-header.page-header {
    margin-bottom: 0;
    padding-top: 80px;
    padding-bottom: 160px;

    border: none;
    border-radius: 0;
  }

  .widget-pricing-sample {
    margin-top: -90px;
  }

  .pricing-page-customers {
    margin-top: 50px;
    margin-bottom: 50px;

    background: rgba(0, 0, 0, .04);
  }

  .pricing-page-customers-logos {
    margin: 0 auto;

    opacity: .4;
  }

  .pricing-page-customers-logos img {
    height: 50px;
    margin: 0 10px;
  }
/*widget*/
  .widget-pricing {
    max-width: 800px;
    margin-bottom: 20px;
  }

  .widget-pricing:not(.widget-pricing-expanded) {
    margin-bottom: 40px;
  }
</style>
<!-- / Custom styling -->

<div class="px-content">

  <div class="pricing-page-header page-header panel text-xs-center">
    <h1 class="font-size-24 font-weight-bold m-b-1">Get started with a 14-day no-obligation free trial.</h1>
    <p class="m-b-4 font-size-18 text-muted">Easy setup. See results in minutes. No credit card required.</p>
    <a href="#" class="btn btn-lg btn-primary font-weight-bold">START FOR FREE</a>
  </div>

  <hr class="page-wide-block m-y-0">

  <!-- Plans & pricing -->

  <div class="widget-pricing-sample widget-pricing-expanded">
    <div class="widget-pricing-inner row">
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <h2 class="widget-pricing-plan">Starter</h2>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>12</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>5</strong> users<br>
            <strong>10</strong> projects<br>
            <strong>100GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <h2 class="widget-pricing-plan">Pro</h2>
          <div class="widget-pricing-section p-y-2 bg-primary">
            <div class="font-size-24"><small>$</small>36</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>20</strong> users<br>
            <strong>100</strong> projects<br>
            <strong>300GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <h2 class="widget-pricing-plan">Team</h2>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>200</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>Unlimited</strong> users<br>
            <strong>Unlimited</strong> projects<br>
            <strong>1000GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
        </div>
      </div>
    </div>
  </div>

  <!-- / Plans & pricing -->

  <!-- Customers -->

  <div class="pricing-page-customers page-block p-y-4 text-xs-center">
    <div class="m-t-0 text-muted m-b-2 font-size-18 font-weight-semibold">Thousands of happy customers, including:</div>
    <div class="pricing-page-customers-logos">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/1.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/2.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/3.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/4.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/5.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/6.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/7.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/8.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/9.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/10.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/11.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/12.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/13.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/14.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/15.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/16.png">
      <img src="${ctxRoot}/assets/admin/dist/demo/customers/17.png">
    </div>
  </div>

  <!-- / Customers -->

  <h3 class="m-y-4 text-xs-center">Common questions</h3>

  <!-- FAQ -->

  <div class="row">
    <div class="col-md-6">
      <div class="panel">
        <div class="panel-title">What is included in the free trial?</div>
        <div class="panel-body">
          All plans begin with a 14-day no-obligation trial of our Pro tier.
        </div>
      </div>
      <div class="panel">
        <div class="panel-title">What happens when my free trial expires?</div>
        <div class="panel-body">
          When your trial expires we'll downgrade you to our free tier. Our free tier is limited to a single user and 2 projects.
        </div>
      </div>
      <div class="panel">
        <div class="panel-title">Do you offer yearly plans?</div>
        <div class="panel-body">
          If you pay for a year upfront (optional) you are eligible for a 15% discount.
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="panel">
        <div class="panel-title">Do you restrict features with a free trial?</div>
        <div class="panel-body">
          While trials are more limited than paid accounts, you will be able to try most of our features.
        </div>
      </div>
      <div class="panel">
        <div class="panel-title">What payment methods do you accept?</div>
        <div class="panel-body">
          Visa, MasterCard, and American Express. For annual plans we also accept Paypal, checks, and wire transfers.
        </div>
      </div>
      <div class="panel">
        <div class="panel-title">Do you have a setup cost?</div>
        <div class="panel-body">
          Absolutely not. All plans are month to month with no contracts, no setup fees, and no hidden gimmicks. Cancel anytime.
        </div>
      </div>
    </div>
  </div>

  <!-- / FAQ -->

</div>
<div class="px-content">
  <h4 class="m-y-4 text-md-center">Basic</h4>

  <!-- Basic -->

  <div class="widget-pricing">
    <div class="widget-pricing-inner">

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Starter</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>12</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>5</strong> users<br>
          <strong>10</strong> projects<br>
          <strong>100GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
        <div class="widget-pricing-plan">Pro</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>36</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>20</strong> users<br>
          <strong>100</strong> projects<br>
          <strong>300GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Team</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>200</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>Unlimited</strong> users<br>
          <strong>Unlimited</strong> projects<br>
          <strong>1000GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
      </div>

    </div>
  </div>

  <!-- / Basic -->

  <hr class="page-wide-block">

  <h4 class="m-y-4 text-md-center">Simple</h4>

  <!-- Simple -->

  <div class="widget-pricing widget-pricing-simple">
    <div class="widget-pricing-inner">

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Starter</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>12</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>5</strong> users<br>
          <strong>10</strong> projects<br>
          <strong>100GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Pro</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>36</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>20</strong> users<br>
          <strong>100</strong> projects<br>
          <strong>300GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Team</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>200</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>Unlimited</strong> users<br>
          <strong>Unlimited</strong> projects<br>
          <strong>1000GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
      </div>

    </div>
  </div>

  <!-- / Simple -->

  <hr class="page-wide-block">

  <h4 class="m-y-4 text-md-center">Expanded</h4>

  <!-- Expanded -->

  <div class="widget-pricing widget-pricing-expanded">
    <div class="widget-pricing-inner row">
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Starter</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>12</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>5</strong> users<br>
            <strong>10</strong> projects<br>
            <strong>100GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
          <div class="widget-pricing-plan">Pro</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>36</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>20</strong> users<br>
            <strong>100</strong> projects<br>
            <strong>300GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Team</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>200</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>Unlimited</strong> users<br>
            <strong>Unlimited</strong> projects<br>
            <strong>1000GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
        </div>
      </div>

    </div>
  </div>

  <!-- Expanded + Simple -->
  <div class="widget-pricing widget-pricing-expanded widget-pricing-simple">
    <div class="widget-pricing-inner row">
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Starter</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>12</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>5</strong> users<br>
            <strong>10</strong> projects<br>
            <strong>100GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
          <div class="widget-pricing-plan">Pro</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>36</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>20</strong> users<br>
            <strong>100</strong> projects<br>
            <strong>300GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Team</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>200</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>Unlimited</strong> users<br>
            <strong>Unlimited</strong> projects<br>
            <strong>1000GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
        </div>
      </div>

    </div>
  </div>

  <!-- / Expanded -->

  <hr class="page-wide-block">

  <h4 class="m-y-4 text-md-center">Active + Hover</h4>

  <!-- Active + Hover -->

  <!-- Basic -->
  <div class="widget-pricing widget-pricing-hover">
    <div class="widget-pricing-inner">

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Starter</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>12</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>5</strong> users<br>
          <strong>10</strong> projects<br>
          <strong>100GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4 widget-pricing-active">
        <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
        <div class="widget-pricing-plan">Pro</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>36</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>20</strong> users<br>
          <strong>100</strong> projects<br>
          <strong>300GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Team</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>200</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>Unlimited</strong> users<br>
          <strong>Unlimited</strong> projects<br>
          <strong>1000GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
      </div>

    </div>
  </div>

  <!-- Basic + Simple -->
  <div class="widget-pricing widget-pricing-simple widget-pricing-hover">
    <div class="widget-pricing-inner">

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Starter</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>12</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>5</strong> users<br>
          <strong>10</strong> projects<br>
          <strong>100GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4 widget-pricing-active">
        <div class="widget-pricing-plan">Pro</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>36</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>20</strong> users<br>
          <strong>100</strong> projects<br>
          <strong>300GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Team</div>
        <div class="widget-pricing-section">
          <div class="font-size-24"><small>$</small>200</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>Unlimited</strong> users<br>
          <strong>Unlimited</strong> projects<br>
          <strong>1000GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
      </div>

    </div>
  </div>

  <!-- Expanded -->
  <div class="widget-pricing widget-pricing-expanded widget-pricing-hover">
    <div class="widget-pricing-inner row">
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Starter</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>12</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>5</strong> users<br>
            <strong>10</strong> projects<br>
            <strong>100GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item widget-pricing-active">
          <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
          <div class="widget-pricing-plan">Pro</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>36</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>20</strong> users<br>
            <strong>100</strong> projects<br>
            <strong>300GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Team</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>200</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>Unlimited</strong> users<br>
            <strong>Unlimited</strong> projects<br>
            <strong>1000GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
        </div>
      </div>

    </div>
  </div>

  <!-- Expanded + Simple -->
  <div class="widget-pricing widget-pricing-expanded widget-pricing-simple widget-pricing-hover">
    <div class="widget-pricing-inner row">
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Starter</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>12</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>5</strong> users<br>
            <strong>10</strong> projects<br>
            <strong>100GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item widget-pricing-active">
          <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
          <div class="widget-pricing-plan">Pro</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>36</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>20</strong> users<br>
            <strong>100</strong> projects<br>
            <strong>300GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item">
          <div class="widget-pricing-plan">Team</div>
          <div class="widget-pricing-section p-y-2 bg-white darker">
            <div class="font-size-24"><small>$</small>200</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>Unlimited</strong> users<br>
            <strong>Unlimited</strong> projects<br>
            <strong>1000GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
        </div>
      </div>

    </div>
  </div>

  <!-- / Active + Hover -->

  <hr class="page-wide-block">

  <h4 class="m-y-4 text-md-center">With colors</h4>

  <!-- Colors -->

  <!-- Basic -->
  <div class="widget-pricing">
    <div class="widget-pricing-inner">

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Starter</div>
        <div class="widget-pricing-section p-y-2 bg-info">
          <div class="font-size-24"><small>$</small>12</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>5</strong> users<br>
          <strong>10</strong> projects<br>
          <strong>100GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="label label-ribbon right label-success"><strong>BEST CHOICE</strong></div>
        <div class="widget-pricing-plan">Pro</div>
        <div class="widget-pricing-section p-y-2 bg-success">
          <div class="font-size-24"><small>$</small>36</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>20</strong> users<br>
          <strong>100</strong> projects<br>
          <strong>300GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-primary">Choose</button></div>
      </div>

      <div class="widget-pricing-item col-md-4">
        <div class="widget-pricing-plan">Team</div>
        <div class="widget-pricing-section p-y-2 bg-danger">
          <div class="font-size-24"><small>$</small>200</div>
          <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
        </div>
        <div class="widget-pricing-section">
          <strong>Unlimited</strong> users<br>
          <strong>Unlimited</strong> projects<br>
          <strong>1000GB</strong> space<br>
        </div>
        <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-outline btn-primary btn-outline-colorless">Contact Us</button></div>
      </div>

    </div>
  </div>

  <!-- Expanded -->
  <div class="widget-pricing widget-pricing-expanded">
    <div class="widget-pricing-inner row">
      <div class="col-md-4">
        <div class="widget-pricing-item bg-info">
          <div class="widget-pricing-plan">Starter</div>
          <div class="widget-pricing-section p-y-2 bg-info darker">
            <div class="font-size-24"><small>$</small>12</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>5</strong> users<br>
            <strong>10</strong> projects<br>
            <strong>100GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-info btn-outline btn-outline-colorless-inverted">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item bg-success">
          <div class="label label-ribbon right label-primary"><strong>BEST CHOICE</strong></div>
          <div class="widget-pricing-plan">Pro</div>
          <div class="widget-pricing-section p-y-2 bg-success darker">
            <div class="font-size-24"><small>$</small>36</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>20</strong> users<br>
            <strong>100</strong> projects<br>
            <strong>300GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-success btn-outline btn-outline-colorless-inverted">Choose</button></div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget-pricing-item bg-danger">
          <div class="widget-pricing-plan">Team</div>
          <div class="widget-pricing-section p-y-2 bg-danger darker">
            <div class="font-size-24"><small>$</small>200</div>
            <div class="font-size-11 font-weight-semibold text-muted">PER MONTH</div>
          </div>
          <div class="widget-pricing-section">
            <strong>Unlimited</strong> users<br>
            <strong>Unlimited</strong> projects<br>
            <strong>1000GB</strong> space<br>
          </div>
          <div class="widget-pricing-section"><button type="button" class="btn btn-lg btn-danger btn-outline btn-outline-colorless-inverted">Contact Us</button></div>
        </div>
      </div>

    </div>
  </div>

  <!-- / Colors -->
</div>