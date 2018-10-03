<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainConsole.aspx.cs" Inherits="TNT.MainConsole" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Main Console</title>

    <script type="text/javascript">


        var addTab1 = function (tabPanel, record) {
            var text = record.data.text,
                tab = tabPanel.getComponent(text);

            if (record.data.url == 'Logout') {
                window.open('Login.aspx?LogOut=1', '_self', false)
            }
            else {

                if (!tab && record.data.url) {
                    tab = tabPanel.add({
                        id: text,
                        title: text,
                        height: 700,
                        autoScroll: true,
                        closable: true,
                        loader: {
                            url: record.data.url,
                            renderer: "frame",
                            loadMask: {
                                showMask: true,
                                msg: "Loading " + text + "..."
                            }
                        }
                    });
                }
                tabPanel.setActiveTab(tab);
            }
        };


        var loadPage = function (tabPanel, page, menuid, pname) {
            var tab = tabPanel.getComponent(menuid);

            if (!tab) {
                tab = tabPanel.add({
                    id: menuid,
                    title: pname,
                    closable: true,
                    loader: {
                        url: page,
                        renderer: "frame",
                        loadMask: {
                            showMask: true,
                            msg: "Loading " + "..."
                        }
                    },
                    autoScroll: true
                });
            }

            tabPanel.setActiveTab(tab);
        };


        var onAfterRender = function (menu) {
            menu.el.on(
                'mouseleave',
                function () {
                    if (!Menu1.lockHideMenu) {
                        Menu1.hideMenu();
                    }
                },
                this,
                {
                    delay: 250
                });
            menu.el.on(
                'mouseenter',
                function () {
                    Menu1.lockHideMenu = true;
                    (function () {
                        Menu1.lockHideMenu = false;
                    }).defer(300);
                });
        };

        var click_Finance = function () {

            removeAddCls(['MIMIS', 'MISecurity'], ['MIFinance']);

            nodeIdHide([NodeIDsMis, NodeIDsSecurity], true);
            nodeIdHide(NodeIDsFinance, false);

            chTitleAndCollapse('Welcome Finance');
        };

        var click_Mis = function () {

            removeAddCls(['MIFinance', 'MISecurity'], ['MIMIS']);

            nodeIdHide([NodeIDsFinance, NodeIDsSecurity], true);
            nodeIdHide(NodeIDsMis, false);

            chTitleAndCollapse('Welcome MIS');
        };

        var click_Security = function () {

            removeAddCls(['MIFinance', 'MIMIS'], ['MISecurity']);

            nodeIdHide([NodeIDsFinance, NodeIDsMis], true);
            nodeIdHide(NodeIDsSecurity, false);

            chTitleAndCollapse('Welcome Security');
        };


        function chTitleAndCollapse(title) {
            App.TreePanelMain.setTitle(title);

            for (var i = 0; i < NodesToCollapse.length; i++) {
                try {
                    App.TreePanelMain.store.getNodeById(NodesToCollapse[i]).collapse(true);
                } catch (e) {
                    alert(e.Message);
                }
            }
        };


        var removeAddCls = function (removeCls, addCls) {

            for (var i = 0; i < removeCls.length; i++) {
                try {
                    document.getElementById(removeCls[i]).classList.remove("setActiveTab");
                } catch (e) {
                    alert(e.Message);
                }

            }

            for (var i = 0; i < addCls.length; i++) {
                try {
                    document.getElementById(addCls[i]).classList.add("setActiveTab");
                } catch (e) {
                    alert(e.Message);
                }
            }

        };

        var nodeIdHide = function (nodeId, hide) {

            if (hide) {
                for (var i = 0; i < nodeId.length; i++) {
                    var nodeA = nodeId[i];

                    for (var j = 0; j < nodeA.length; j++) {
                        var nodeB = nodeA[j];
                        try {
                            //App.TreePanelMain.getStore().getNodeById(nodeB).set("hidden", hide);//org

                            //rana sunday 8-19-18
                            //App.TreePanelMain.getStore().getNodeById(nodeB).SetCls("x-hidden");
                            //App.TreePanelMain.getStore().getNodeById(nodeB).Hide();
                            //App.TreePanelMain.getStore().getNodeById(nodeB).set("Hide");
                            //document.getElementById(nodeB).classList.add("x-hidden");
                            App.TreePanelMain.store.getNodeById(nodeB).set("cls", "x-hidden");
                            //rana sunday 8-19-18 

                        } catch (e) {
                            alert(e.Message);
                        }
                    }
                }
            } else {
                for (var i = 0; i < nodeId.length; i++) {
                    var nodeA = nodeId[i];
                    try {
                        //App.TreePanelMain.getStore().getNodeById(nodeA).set("hidden", hide);//org
                        
                        //rana sunday 8-19-18
                        //App.TreePanelMain.getStore().getNodeById(nodeA).SetCls("");
                        //App.TreePanelMain.getStore().getNodeById(nodeA).Hide();
                        //App.TreePanelMain.getStore().getNodeById(nodeA).set("Show");
                        //document.getElementById(nodeA).classList.remove("x-hidden");
                        App.TreePanelMain.store.getNodeById(nodeA).set("cls", "");
                        //rana sunday 8-19-18

                    } catch (e) {
                        alert(e.Message);
                    }
                }
            }

        };


//        var makeBtn = function () {
//            chTitleAndCollapse('Welcome to hell');
//        };

    </script>

    <style type="text/css">
        
        .HomeHeaderImage{
        background-image: url("/Images/HeaderImage.jpg");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 100% 100%;
        }
    
	    .setActiveTab {
	    border-radius: 3px 15px 15px 3px;
	    background-color: #fffacd !important;
		background-image: none;
		
		border: 2px solid coral;
        -webkit-animation: mymove 5s infinite;
        animation: mymove 2s infinite;
	    }
	
        @-webkit-keyframes mymove {
            50% {border-color: lightblue;}
        }

        @keyframes mymove {
            50% {border-color: lightblue;}
        }
        
        #Tab1-body
        {
        background: rgb(245,246,246);
        background: -webkit-linear-gradient(top, rgba(245,246,246,1) 0%,rgba(197, 216, 250, 1) 21%,rgba(171, 199, 236, 1) 49%,rgba(197, 216, 250, 1) 80%,rgba(245,246,246,1) 100%);
        background: linear-gradient(to bottom, rgba(245,246,246,1) 0%,rgba(197, 216, 250, 1) 21%,rgba(171, 199, 236, 1) 49%,rgba(197, 216, 250, 1) 80%,rgba(245,246,246,1) 100%);
        }
            
        .x-item-disabled{opacity: 0.5;}
        
        .hideMe{display: none;}
        
        .btnLogout {
	    border:none;
	    background-color: #D2E1F4 !important;
		background-image: none;
        
    </style>


</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    
    <ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout">
        <Items>

            <ext:Panel ID="pnlHeader" runat="server" Region="North" Border="false" Width="800"
                Height="100" Header="false" Collapsible="false" Split="false" BodyCls="HomeHeaderImage">
            </ext:Panel>
            

            <ext:Panel ID="pnlNorth" runat="server" Region="North" AutoHeight="true" Border="false"
                Header="false" Collapsible="true" Split="true" Cls="pnlNorth">
                <Items>
                            
                    <ext:Menu ID="Menu1" runat="server" Layout="HBoxLayout" Cls="horizontal-menu" Floating="false"
                        ShowSeparator="false" bodyStyle="background-color:#D2E1F4 !important;">
                        <Defaults>
                            <ext:Parameter Name="MenuAlign" Value="tl-bl?" Mode="Value" />
                        </Defaults>
                        <Items>
                        
                            <ext:MenuItem Text="Finance" ID="MIFinance" Icon="Money" MarginSpec="2 2 5 2">
                                 <Listeners>
                                <Click Fn="click_Finance" />
                                </Listeners>
                            </ext:MenuItem>

                            <ext:MenuItem Text="MIS" ID="MIMIS" Icon="Plugin" MarginSpec="2 2 5 2">
                                <Listeners>
                                <Click Fn="click_Mis" />
                                </Listeners>
                            </ext:MenuItem>

                            <ext:MenuItem Text="Security" ID="MISecurity" Icon="Shield" MarginSpec="2 2 5 2">
                                <Listeners>
                                <Click Fn="click_Security" />
                                </Listeners>
                            </ext:MenuItem>


                            <%--TESTING--%>

                            <ext:Button ID="btnid" runat="server" Text="Hello" Icon="User" IconAlign="Left" MarginSpec="5 200 2 400"
                                ToolTip="<b>Wellcome</b> This is Your UserName Click here to Logout"
                                Cls="btnLogout" Target=""> <%--Href="TestPage.aspx"--%>
                                <Listeners>
                                <%--<Click Handler="Window1.load('http://google.com'); Window1.show();"/>--%>
                                <Click Handler="window.open('TestPage.aspx', '_self', false)"/>
                                    <%--<Click Fn="makeBtn" />--%>
                                </Listeners>
                            </ext:Button>


                            <%--<ext:Label runat="server" ID="lblUserName" Text="Hello" Icon="User" IconAlign="Left"
                                MarginSpec="5 0 2 200">
                                <Listeners>
                                    <Render Handler="new Ext.ToolTip({ target: #{lblUserName}.el.dom, html: 'Wellcome <strong>This is Your UserName</strong>', dismissDelay: 15000, shadow: true, trackMouse:true});" />
                                    <Render Fn="makeBtn"/>
                                </Listeners>
                            </ext:Label>--%>
                            
                            <%--TESTING--%>


                        </Items>
                        </ext:Menu>
                        
                        </Items></ext:Panel>


            <%--West Panel Starts--%>
            <ext:Panel ID="MnuSite"
                Region="West" runat="server"                  
                BodyStyle="background-color: #284051;"
                Collapsible="true"
                Header="false"
                Split="true"                  
                Width="200" 
                MinWidth="170" 
                MaxWidth="400"                  
                Layout="FitLayout">
                    <Items>

                    <ext:TreePanel 
                        ID="TreePanelMain"                            
                        runat="server" 
                        Width="175"                                                         
                        AutoScroll="true"
                        Lines="false"
                        Header="true"
                        Title="Welcome Finance"
                        UseArrows="true"
                        CollapseFirst="false" 
                        ContainerScroll="true"
                        RootVisible="false">
                         
                        <Fields>
                        <ext:ModelField Name="url" />
                        <ext:ModelField Name="NodeRights" Type="String" />
                        </Fields>

                        <Listeners>                                                       
                            <ItemClick Handler="if (record.data.href) { e.stopEvent(); loadPage(#{Pages}, record); }" />
                            <AfterRender Fn="click_Finance"/>
                        </Listeners>
                            <Root>
                                <ext:Node Expanded="true">
                                    <Children>

                                    <%--                p1                --%>

                                        <ext:Node Text="Security" Icon="Shield" NodeID="Security">
                                        
                                            <Children>
                                               <%--             c1 of p1              --%>
                                                        <ext:Node Text="User" NodeID="NodeIdUser" Icon="User">
                                                            <Children>
                                                            <%--             c1 of c1 of p1              --%>
                                                                <%--<ext:Node Text="Users" NodeID="Users" Leaf="true" Icon="Group">
                                                                    <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Users" Mode="Value" />
                                                            </CustomAttributes>
                                                                </ext:Node>--%>
                                                                <%--             c2 of c1 of p1              --%>
                                                                <%--<ext:Node Text="User Tasks" Leaf="true" NodeID="SetUserTasks" Icon="StatusBeRightBack">
                                                                    <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SetUserTasks" Mode="Value" />
                                                            </CustomAttributes>
                                                                </ext:Node>--%>
                                                                <%--             c3 of c1 of p1              --%>
                                                                <%--<ext:Node Text="User Modules" Leaf="true" NodeID="SetUserModules" Icon="UserComment2">
                                                                    <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SetUserModules" Mode="Value" />
                                                            </CustomAttributes>
                                                                </ext:Node>--%>

                                                            </Children>
                                                        </ext:Node>

                                                        <%--             c2 of p1             --%>
                                                        <ext:Node Text="Security Group" NodeID="NISecurityGroupMain" Icon="GroupGear">
                                                            
                                                            <Children>
                                                            <%--            c1 of c2 of p1             --%>
                                                            <%--<ext:Node Text="Security Group" NodeID="SecurityGroups" Leaf="true" Icon="GroupGear">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SecurityGroups" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        <%--            c2 of c2 of p1             --%>
                                                        <%--<ext:Node Text="User Groups" NodeID="SetUserGroups" Leaf="true" Icon="GroupAdd">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SetUserGroups" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        <%--            c3 of c2 of p1             --%>
                                                        <%--<ext:Node Text="Task Groups" NodeID="SetTaskGroups" Leaf="true" Icon="GroupLink">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SetTaskGroups" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                            </Children>

                                                        </ext:Node>

                                                        <%--             c3 of p1             --%>
                                                        <ext:Node Text="Branch" NodeID="NIdBranch" Icon="ArrowBranch">
                                                            <Children>
                                                            <%--            c1 of c3 of p1             --%>
                                                            <%--<ext:Node Text="Branches" NodeID="Branches" Leaf="true" Icon="ArrowBranch">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Branches" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        <%--            c2 of c3 of p1             --%>

                                                        <%--<ext:Node Text="User Branches" NodeID="SetUserBranches" Leaf="true" Icon="Share">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SetUserBranches" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                            </Children>
                                                        </ext:Node>

                                                        <%--             c4 of p1             --%>
                                                        <ext:Node Text="Change Password" NodeID="ChangePassword" Leaf="true" Icon="LockEdit">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="ChangePassword" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>
                                                        <%--             c5 of p1             --%>
                                                        <ext:Node Text="Log Out" Leaf="true" NodeID="Logout" Icon="DoorOut">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Logout" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>

                                            </Children>
                                        </ext:Node>

                                   <%--                       p2                   --%>


                                        <ext:Node Text="Definition" Icon="ControlEqualizer" NodeID="Definition">
                                            <Children>

                                            <%--<ext:Node Text="Chart Of Accounts" NodeID="ChartofAccounts" Leaf="true" Icon="Table">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="ChartofAccounts" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>

                                                        <ext:Node Text="Parties" NodeID="Parties" Leaf="true" Icon="GroupEdit">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Parties" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>

                                                        <ext:Node Text="Opening Balance" NodeID="OpeningBalances" Leaf="true" Icon="Creditcards">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="OpeningBalances" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>

                                                        <ext:Node Text="Employee Opening" NodeID="EmployeeOpening" Leaf="true" Icon="UserAdd">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="EmployeeOpening" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>

                                                        <ext:Node Text="Enquiry Types" NodeID="EuquiryTypes" Leaf="true" Icon="TimelineMarker">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="EuquiryTypes" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>


                                        <%--                   3                 --%>


                                        <ext:Node Text="Transactions" Icon="PackageSe" NodeID="Transaction">
                                            <Children>

                                            <%--<ext:Node Text="Cash Receiving Voucher" NodeID="CreditVouchers" Leaf="true" Icon="PageBack">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="CreditVouchers" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        
                                                        <%--<ext:Node Text="Cash Payment Voucher" NodeID="DebitVouchers" Leaf="true" Icon="PageLandscape">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="DebitVouchers" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        
                                                        <%--<ext:Node Text="Journal Voucher" NodeID="JournalVouchers" Leaf="true" Icon="ApplicationGo">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="JournalVouchers" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Cash Deposit In Bank" NodeID="CashDeposit" Leaf="true" Icon="MoneyAdd">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="CashDeposit" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Cheque Deposit In Bank" NodeID="ChequeDeposit" Leaf="true" Icon="MoneyDollar">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="ChequeDeposit" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        
                                                        <%--<ext:Node Text="Bank Cheque Issue Voucher" NodeID="BankChequesIssue" Leaf="true" Icon="PageWhiteTextWidth">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="BankChequesIssue" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Salary Voucher (By Cheque)" NodeID="SalaryVoucherByCheque" Leaf="true" Icon="PageWhiteGo">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SalaryVoucherByCheque" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        
                                                        <%--<ext:Node Text="Voucher Posting" NodeID="VouchersPosting" Leaf="true" Icon="PageWhiteStack">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="VouchersPosting" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Voucher Reconciliaion" NodeID="VoucherReconciliaion" Leaf="true" Icon="PageMagnify">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="VoucherReconciliaion" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>

                                            </ext:Node>

                                          <%--                4                  --%>


                                            <ext:Node Text="Payroll" Icon="PageWhiteMedal" NodeID="Payroll">
                                            <Children>

                                                        <%--<ext:Node Text="Departments" NodeID="Departments" Leaf="true" Icon="Building">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Departments" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Shifts" NodeID="Shifts" Leaf="true" Icon="ClockRed">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Shifts" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Employee Types" NodeID="EmployeeTypes" Leaf="true" Icon="Vcard">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="EmployeeTypes" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Employees" NodeID="Employees" Leaf="true" Icon="UserRed">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Employees" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Leave Type" NodeID="LeaveTypes" Leaf="true" Icon="Script">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="LeaveTypes" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Leaves" NodeID="Leaves" Leaf="true" Icon="ReportUser">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Leaves" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Holidays" NodeID="Holidays" Leaf="true" Icon="Controller">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Holidays" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="DailyAttendance" NodeID="DailyAttendance" Leaf="true" Icon="PagePortraitShot">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="DailyAttendance" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Salaries" NodeID="Salaries" Leaf="true" Icon="MoneyDelete">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="Salaries" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Attendance Generator" NodeID="AttendanceGenerator" Leaf="true" Icon="PagePaintbrush">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="AttendanceGenerator" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>


                                                        <%--<ext:Node Text="Employee Increments" NodeID="EmployeeIncrements" Leaf="true" Icon="MoneyAdd">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="EmployeeIncrements" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        
                                                        <%--<ext:Node Text="Employee Transfer" NodeID="EmployeeTransfer" Leaf="true" Icon="Lorry">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="EmployeeTransfer" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                

                                            </Children>
                                        </ext:Node>


                                        <%--                new                --%>



                                        <ext:Node Text="Definition" NodeID="NIDefinition" Icon="GroupGear">
                                            <Children>
                                            </Children>
                                        </ext:Node>







                                        <%--                5                --%>

                                        <ext:Node Text="Inventory" Icon="ShapeShadowToggle" NodeID="Inventory">
                                            <Children>
                                            
                                            <%--<ext:Node Text="Purchase Order" NodeID="PurchaseOrder" Leaf="true" Icon="ShapeSquareAdd">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="PurchaseOrder" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Purchase Invoice" NodeID="PurchaseInvoice" Leaf="true" Icon="ShapeMoveBackwards">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="PurchaseInvoice" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Sale Order" NodeID="SaleOrder" Leaf="true" Icon="ShapeSquareDelete">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SaleOrder" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Sale Invoice" NodeID="SaleInvoice" Leaf="true" Icon="ShapeMoveForwards">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SaleInvoice" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>

                                            <%--             6               --%>

                                            <ext:Node Text="Reports" Icon="Clipboard" NodeID="NIReports">
                                            <Children>

                                            <ext:Node Text="Account Reports" Icon="Clipboard" NodeID="Accounts Reports">
                                            <Children>
                                            
                                            <ext:Node Text="Bank Reports" Icon="Clipboard" NodeID="Bank Reports">
                                            <Children>

                                            <%--<ext:Node Text="Bank Markup" NodeID="BankMarkup" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="BankMarkup" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>
                                                        <%-- here we go--%>
                                                        <%--<ext:Node Text="Bank Statement" NodeID="RptBankStatement" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptBankStatement" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Bounced Cheques" NodeID="RptBouncedCheques" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptBouncedCheques" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Unclear Cheques" NodeID="RptUnclearedCheques" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptUnclearedCheques" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Lost Cheques" NodeID="RptLostCheques" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptLostCheques" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>


                                            <%--<ext:Node Text="Chart Of Accounts" NodeID="RptChartofAccounts" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptChartofAccounts" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Voucher Details" NodeID="VoucherDetails" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="VoucherDetails" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Day Book" NodeID="RptDayBook" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptDayBook" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Enquiry Ledger" NodeID="RptEnquiryLedger" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptEnquiryLedger" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Account Ledger" NodeID="RptAccountLedger" Leaf="true" Icon="PageHeaderFooter" >
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptAccountLedger" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Accounts Balance" NodeID="RptAccountsBalances" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptAccountsBalances" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Accounts Payable" NodeID="RptAccountsPayable" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptAccountsPayable" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Accounts Receivables" NodeID="RptAccountsReceiveable" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptAccountsReceiveable" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Balance Sheet" NodeID="RptBalanceSheet" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptBalanceSheet" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Cash Book" NodeID="RptCashBook" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptCashBook" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="G/L Journal" NodeID="RptGLJournal" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptGLJournal" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Monthly Expenses Report" NodeID="RptMonthlyExpenseChart" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptMonthlyExpenseChart" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Opening Balances" NodeID="RptOpeningBalances" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptOpeningBalances" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Profit And Loss Statement" NodeID="RptProfitLossStatement" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptProfitLossStatement" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Trial Balance" NodeID="RptTrialBalance" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptTrialBalance" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Income Statment" NodeID="RptIncomeStatment" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptIncomeStatment" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Single Column Salary" NodeID="RptSingleColumnSalary" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptSingleColumnSalary" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Consolidation Report" NodeID="RptConsolidation" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptConsolidation" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>

                                            <ext:Node Text="Payroll Reports" Icon="Clipboard" NodeID="Payroll Reports">
                                            <Children>
                                            
                                            <%--<ext:Node Text="Attendance Report" NodeID="RptAttendanceReport" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptAttendanceReport" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Attendance Summery" NodeID="RptAttendanceSummery" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptAttendanceSummery" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Employee Leaves Status" NodeID="RptEmployeeLeavesStatus" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptEmployeeLeavesStatus" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Employee List" NodeID="RptEmployeeList" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptEmployeeList" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Employee Transfer" NodeID="RptEmployeeTransfer" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptEmployeeTransfer" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Employee Opening" NodeID="RptEmployeeOpening" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptEmployeeOpening" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Salary Register" NodeID="RptSalaryRegister" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptSalaryRegister" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Employee Ledger" NodeID="RptEmployeeLedger" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="RptEmployeeLedger" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>

                                            <ext:Node Text="Inventory Reports" Icon="BookOpenMark" NodeID="Inventory Reports">
                                            <Children>
                                            
                                            <%--<ext:Node Text="Product List" NodeID="ProductList" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="ProductList" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Current Stock" NodeID="CurrentStock" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="CurrentStock" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Purchase Report" NodeID="PurchaseRegister" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="PurchaseRegister" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Sale Report" NodeID="SaleRegister" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SaleRegister" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Daily Sale and Stock Report" NodeID="DailySalesAndStockReport" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="DailySalesAndStockReport" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>

                                            <%--<ext:Node Text="Purchase" NodeID="NIPurchaseReport" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="NIPurchaseReport" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Sale" NodeID="NISaleReport" Leaf="true" Icon="PageHeaderFooter">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="NISaleReport" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                            </Children>
                                            </ext:Node>

                                          <%--              7            --%>
                                                                                


                                        <ext:Node Text="System" Icon="CogEdit" NodeID="System">
                                            <Children>

                                            <%--<ext:Node Text="Balance Sheet Setting" NodeID="BalanceSheetSettings" Leaf="true" Icon="ApplicationDouble">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="BalanceSheetSettings" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Expense Report Setting" NodeID="ExpenseReportSettings" Leaf="true" Icon="ApplicationOsxGo">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="ExpenseReportSettings" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Profit And Loss Setting" NodeID="ProfitAndLossSettings" Leaf="true" Icon="ApplicationCascade">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="ProfitAndLossSettings" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="System Configuration" NodeID="SystemConfiguration" Leaf="true" Icon="BulletWrench">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="SystemConfiguration" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        <%--<ext:Node Text="Accounts Settings" NodeID="AccountsSetting" Leaf="true" Icon="ReportPicture">
                                                            <CustomAttributes>
                                                                <ext:ConfigItem Name="url" Value="TestPage.aspx" Mode="Value" />
                                                                <ext:ConfigItem Name="NodeRights" Value="AccountsSetting" Mode="Value" />
                                                            </CustomAttributes>
                                                        </ext:Node>--%>

                                                        
                                            </Children>
                                        </ext:Node>

                                      <%--              7end            --%>

                                    </Children>
                                   </ext:Node>
                            </Root>
                                                   



                        </ext:TreePanel>
                    </Items>
                </ext:Panel>
                <%--west Panel Ends--%>




            <ext:Panel ID="mainBody" Region="Center" runat="server" Layout="BorderLayout">
                <Items>
                    <ext:TabPanel ID="Pages" runat="server" Region="Center" Layout="FitLayout" LayoutOnTabChange="true"
                        Height="700">
                        <Items>
                            <ext:Panel ID="Tab1" Title="Dashboard" runat="server" Closable="false">
                                <Content>
                                    <center>
                                        <h3>
                                            Welcome to MainConsole page.</h3>
                                    </center>
                                </Content>
                            </ext:Panel>
                        </Items>
                        <Plugins>
                            <ext:TabCloseMenu ID="TabCloseMenu1" runat="server" />
                        </Plugins>
                    </ext:TabPanel>
                </Items>
            </ext:Panel>
            
        </Items>
        </ext:Viewport>

    </form>
</body>
</html>
