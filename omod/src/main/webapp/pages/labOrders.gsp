<%
    ui.decorateWith("kenyaemr", "standardPage", [patient: patient])
    ui.includeJavascript("uicommons", "emr.js")
    ui.includeJavascript("uicommons", "angular.min.js")
    ui.includeJavascript("uicommons", "angular-app.js")
    ui.includeJavascript("uicommons", "angular-resource.min.js")
    ui.includeJavascript("uicommons", "angular-common.js")
    ui.includeJavascript("uicommons", "angular-ui/ui-bootstrap-tpls-0.11.2.js")
    ui.includeJavascript("uicommons", "ngDialog/ngDialog.js")
    ui.includeJavascript("orderentryui", "bootstrap.min.js")


    ui.includeJavascript("uicommons", "filters/display.js")
    ui.includeJavascript("uicommons", "filters/serverDate.js")
    ui.includeJavascript("uicommons", "services/conceptService.js")
    ui.includeJavascript("uicommons", "services/drugService.js")
    ui.includeJavascript("uicommons", "services/encounterService.js")
    ui.includeJavascript("uicommons", "services/orderService.js")
    ui.includeJavascript("uicommons", "services/session.js")

    ui.includeJavascript("uicommons", "directives/select-concept-from-list.js")
    ui.includeJavascript("uicommons", "directives/select-order-frequency.js")
    ui.includeJavascript("uicommons", "directives/select-drug.js")
    ui.includeJavascript("orderentryui", "order-model.js")
    ui.includeJavascript("orderentryui", "order-entry.js")
    ui.includeJavascript("orderentryui", "labOrders.js")

    ui.includeCss("uicommons", "ngDialog/ngDialog.min.css")
    ui.includeCss("orderentryui", "drugOrders.css")
    ui.includeCss("uicommons", "styleguide/jquery-ui-1.9.2.custom.min.css")
    ui.includeCss("orderentryui", "index.css")


    ui.includeCss("orderentryui", "bootstrap.min.css")
    ui.includeCss("orderentryui", "labOrders.css")
    ui.includeCss("orderentryui", "font-awesome.css")
    ui.includeCss("orderentryui", "font-awesome.min.css")
    ui.includeCss("orderentryui", "font-awesome.css.map")
    ui.includeCss("orderentryui", "fontawesome-webfont.svg")
%>
<style type="text/css">
#new-order input {
    margin: 5px;
}

th, td {
    text-align: left;
}
</style>
<script type="text/javascript">

    window.OpenMRS = window.OpenMRS || {};
    window.OpenMRS.drugOrdersConfig = ${ jsonConfig };
    window.sessionContext = {'locale': 'en_GB'}
    window.OpenMRS.labTestJsonPayload = ${labTestJsonPayload}
        window.OpenMRS.panelList =
    ${panelList}

</script>

${ui.includeFragment("appui", "messages", [codes: [
        "orderentryui.pastAction.REVISE",
        "orderentryui.pastAction.DISCONTINUE"
]])}

<div class="ke-page-content">
    <div id="lab-orders-app" ng-controller="LabOrdersCtrl" ng-init='init()'>
        <div class="ui-tabs">
            <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header">
                <li ng-repeat="setting in careSettings" class="ui-state-default ui-corner-top"
                    ng-class="{ 'ui-tabs-active': setting == careSetting, 'ui-state-active': setting == careSetting }">
                    <a class="ui-tabs-anchor" ng-click="setCareSetting(setting)">
                        {{ setting | omrsDisplay }}
                    </a>
                </li>
            </ul>


            <div class="ui-tabs-panel ui-widget-content">
                <h3>Lab Orders</h3>

                <div id="program-tabs" class="ke-tabs">
                    <div class="ke-tabmenu">
                        <div class="ke-tabmenu-item" data-tabid="active_orders">Active Orders</div>

                        <div class="ke-tabmenu-item" data-tabid="new_orders">Create New Order</div>

                        <div class="ke-tabmenu-item" data-tabid="lab_results">Enter Lab Results</div>
                        <div class="ke-tabmenu-item" data-tabid="past_orders">Past Lab Orders</div>

                    </div>

                    <div class="ke-tab" data-tabid="new_orders" style="padding-top:10px">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    Create New Order(s)
                                </h4>
                            </div>

                            <div class="card-body">
                                <form>
                                    <table class="table col-lg-12">
                                        <tbody>
                                        <tr>
                                            <td class="col-lg-3">
                                                <div class="list-group">
                                                    <div class="list-group-item" ng-repeat="lab in labOrders"
                                                         ng-click="loadLabPanels(lab)">
                                                        <div class="link-item">
                                                            <a class="formLink">
                                                                {{lab.name}}
                                                            </a>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div style="padding-top:10px">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5 class="card-title">
                                                                Selected Order(s)
                                                            </h5>
                                                        </div>

                                                        <div class="card-body">
                                                            <div ng-show="selectedOrders.length === 0">{{noOrderSelected}}</div>

                                                            <div class="list-group">
                                                                <div class="list-group-item"
                                                                     ng-repeat="order in filteredOrders">
                                                                    <div class="link-item">
                                                                        <div class="btn-group" role="group" aria-label="Basic example">
                                                                            <button type="button">{{order.name}}</button>
                                                                            <button type="button" class="fa fa-calendar fa-1x"
                                                                                    data-toggle="modal" data-target="#dateOrder"
                                                                                    ng-click="orderDateSelected(order)"></button>
                                                                            <button type="button" class="fa fa-warning fa-1x"></button>
                                                                            <button type="button" class="fa fa-remove fa-1x"
                                                                                    ng-click="deselectedOrder(order)" style="color:#9D0101;cursor: pointer"></button>
                                                                        </div>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="col-lg-12">
                                                <div class="col-lg-12">
                                                    <fieldset class="col-lg-12 scheduler-border">
                                                        <legend class="col-lg-12 scheduler-border">Panels | <mark>{{sampleTypeName}}</mark></legend>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <ul>
                                                                    <li ng-repeat="panel in labPanels"
                                                                        ng-click="loadLabPanelTests(panel)">
                                                                        <button type="button" class="column"
                                                                                ng-click="toggle = !toggle"
                                                                                ng-class="{'blue' : toggle}">
                                                                            {{panel.name}}</button>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                        </div>

                                                    </fieldset>
                                                </div>

                                                <div class="col-lg-12">
                                                    <fieldset class="col-lg-12 scheduler-border">
                                                        <legend class="col-lg-12 scheduler-border">Tests | <mark>{{panelTypeName}}</mark></legend>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div ng-repeat="test in panelTests"
                                                                     ng-click="getSelectedTests(test)">
                                                                    <div class="column">
                                                                        <div class="form-group form-check">
                                                                            <input class="form-check-input"
                                                                                   type="checkbox" id="scales"
                                                                                   name="feature"
                                                                                   ng-model='test.selected'
                                                                                   value="test.concept_id">
                                                                            <label class="form-check-label">{{test.name}}</label>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                            </td>

                                        </tr>

                                        </tbody>
                                    </table>

                                    <div style="padding-left: 50%">
                                        <button type="button" ng-click="postLabOrdersEncounters()"
                                                ng-disabled="selectedOrders.length === 0"><img src="${ ui.resourceLink("kenyaui", "images/glyphs/ok.png") }" />
                                            Save orders</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="ke-tab" data-tabid="lab_results">

                        <div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <form class="form-horizontal">
                                        <div style="padding-top: 10px">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4 class="card-title">
                                                        Enter Lab Results
                                                    </h4>
                                                </div>

                                                <div class="card-body">
                                                    <div ng-repeat="control in panelListResults">
                                                        <div class="column">

                                                            <div ng-if="control.rendering === 'select'">
                                                                <div class="form-group row">
                                                                    <label class="col-lg-3"><b>{{control.label}}:</b></label>

                                                                    <div class="col-lg-4">
                                                                        <select class="form-control"
                                                                                ng-model="typeValues[control.orderId]">
                                                                            <option ng-repeat=" o in control.answers"
                                                                                    ng-value="o.concept">{{o.label}}
                                                                            </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div ng-if="control.rendering === 'inputtext'">
                                                                <div class="form-group row">
                                                                    <label class="col-lg-3"><b>{{control.label}}:</b></label>

                                                                    <div class="col-lg-4">
                                                                        <input class="form-control" type="text"
                                                                               ng-model="typeValues[control.orderId]">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div ng-if="control.rendering === 'inputnumeric'">
                                                                <div class="form-group row">
                                                                    <label class="col-lg-3"><b>{{control.label}}:</b></label>

                                                                    <div class="col-lg-4">
                                                                        <input class="form-control" type="number"
                                                                               ng-model="typeValues[control.orderId]">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div ng-if="control.rendering === 'textarea'">
                                                                <div class="form-group row">
                                                                    <label class="col-lg-3"><b>{{control.label}}:</b></label>

                                                                    <div class="col-lg-4">
                                                                        <textarea class="form-control" ng-model="typeValues[control.orderId]">
                                                                        </textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div style="padding-left: 50%; padding-bottom: 20px"
                                                     ng-show="panelListResults.length !== 0">
                                                    <button type="button" ng-click="postLabOrderResults()">
                                                        <img src="${ ui.resourceLink("kenyaui", "images/glyphs/ok.png") }" />  Save</button>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="ke-tab" data-tabid="active_orders" style="padding-top: 10px">
                        <form>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        Active Lab Orders
                                    </h4>
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table ng-hide="activeTestOrders.loading" class="table table-striped">
                                            <tr>
                                                <th>Order Date</th>
                                                <th>Order No</th>
                                                <th>Test Name</th>
                                                <th>Ordered By</th>
                                                <th>Actions</th>
                                            </tr>
                                            <tr ng-repeat="test in activeTestOrders">
                                                <td>
                                                    {{ test.dateActivated | date:'dd-MM-yyyy' }}
                                                </td>
                                                <td>
                                                    {{ test.orderNumber }}
                                                </td>
                                                <td>
                                                    {{test.display}}

                                                </td>
                                                <td>
                                                    {{test.orderer.display}}

                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#voidOrdersModal" ng-click="getOrderUuid(test)">
                                                        Cancel
                                                    </button>
                                                </td>

                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="ke-tab" data-tabid="past_orders" style="padding-top: 10px">
                        <form>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        Past Lab Orders
                                    </h4>
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table ng-hide="activeTestOrders.loading" class="table table-striped">
                                            <tr>
                                                <th>Date</th>
                                                <th>Tests Ordered</th>
                                                <th>Results</th>
                                            </tr>
                                            <tr ng-repeat="past in pastLabOrders">
                                                <td>
                                                    {{ past.dateActivated | date:'dd-MM-yyyy' }}
                                                </td>
                                                <td>
                                                    {{past.display}}
                                                </td>
                                                <td>
                                                    {{past.display}}

                                                </td>

                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

        </div>
        <!-- Modal voiding lab orders -->
        <div class="modal fade" id="voidOrdersModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Void Orders</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <label >Reason(s) for voiding orders</label>
                        <div>
                            <textarea class="form-control" ng-model="voidOrders">
                            </textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button"  data-dismiss="modal" ng-click="closeModal()">Close</button>
                        <button type="button" ng-click="voidActiveLabOrders()">
                            <img src="${ ui.resourceLink("kenyaui", "images/glyphs/ok.png") }" /> Save</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal date for lab orders -->
        <div class="modal fade" id="dateOrder" tabindex="-1" role="dialog" aria-labelledby="dateModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <label >Enter Date Order was made</label>
                        <div>
                            Date: ${ ui.includeFragment("kenyaui", "field/java.util.Date", [ id: "orderDate", formFieldName: "orderDate"]) }
                            Date2 <input type="date" ng-model="orderDate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button"  data-dismiss="modal" ng-click="closeModal()">Close</button>
                        <button type="button" ng-click="setOrderDate()">
                            <img src="${ ui.resourceLink("kenyaui", "images/glyphs/ok.png") }" /> Save</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<script type="text/javascript">
    // manually bootstrap angular app, in case there are multiple angular apps on a page
    angular.bootstrap('#lab-orders-app', ['labOrders']);

</script>
