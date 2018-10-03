<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testWinAtHover.aspx.cs" Inherits="TNT.WebForm1" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            this.Store1.DataSource = new object[]
            {
                new object[] { 1, 0.2 },
                new object[] { 2, 0.4 },
                new object[] { 3, 0.6 },
                new object[] { 4, 0.8 },
                new object[] { 5, 1.0 },
                new object[] { 2, 0.4 },
                new object[] { 3, 0.6 },
                new object[] { 4, 0.8 },
                new object[] { 5, 1.0 },
                new object[] { 3, 0.6 },
                new object[] { 4, 0.8 },
                new object[] { 5, 1.0 }
            };

            this.Store1.DataBind();

            this.Store2.DataSource = new object[]
            {
                new object[] { 0, "Task 1", 0, 0 },
                new object[] { 1, "Task 2", 0, 0 },
                new object[] { 2, "Task 3", 0, 0 },
                new object[] { 3, "Task 4", 0, 0 },
                new object[] { 4, "Task 5", 0, 0 }
            };

            this.Store2.DataBind();
        }
    }

    protected void DoTasks(object sender, DirectEventArgs e)
    {
        string json = e.ExtraParams["tasks"];
        Dictionary<string, string>[] tasks = JSON.Deserialize<Dictionary<string, string>[]>(json);

        foreach (Dictionary<string, string> task in tasks)
        {
            int id = JSON.Deserialize<int>(task["TaskID"]);
            float progress = JSON.Deserialize<float>(task["Progress"]);
            int status = JSON.Deserialize<int>(task["Status"]);
            
            ModelProxy record = Store2.GetById(id);
            record.BeginEdit();
            
            if (status == 1) {
                record.Set("Status", 2);
            }

            progress += 0.2f;
            
            record.Set("Progress", progress);

            if (progress >= 1)
            {
                record.Set("Status", 3);                
            }
            
            record.EndEdit();
        }
    }
</script>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>ComponentColumn Overview - Ext.NET Examples</title>  

    <script type="text/javascript">
        var bindWidgets = function (column, cmp, record) {
            var status = record.get('Status'),
                statusLbl = cmp.down('#Status'),
                progressWidget = cmp.down('#Progress'),
                triggerButton = cmp.down('#Trigger');

            // 0 - Ready to run
            // 1 - Starting
            // 2 - Executing
            // 3 - Complete

            cmp.suspendLayout = true;

            statusLbl.setVisible(status == 1 || status == 3);
            triggerButton.setVisible(status == 0);
            progressWidget.setVisible(status == 2);

            if (status == 2) {
                progressWidget.updateProgress(record.get('Progress'), "Executing...", false);
            }

            if (status == 1 || status == 3) {
                statusLbl.setText(status == 1 ? "Starting..." : "Complete");
            }

            cmp.suspendLayout = false;
            cmp.doLayout();
        };

        var hasPendingTasks = function (store) {
            var has = false;

            store.each(function (record) {
                var status = record.get('Status');
                if (status == 1 || status == 2) {
                    has = true;
                    return false;
                }
            });

            return has;
        };

        var filterTask = function (record) {
            return record.get('Status') == 1 || record.get('Status') == 2;
        };
    </script>

    <style>
        .x-over-editor-grid tr.x-grid-row
        {
            height: 25px;
        }
    </style>   
</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        
        <h1>ComponentColumn Overview</h1>        

        <ext:GridPanel ID="GridPanel1" 
            runat="server" 
            Title="ComponentColumn Overview" 
            Cls="x-over-editor-grid"
            Width="320" 
            Height="180">
            <Store>
                <ext:Store ID="Store1" runat="server">
                    <Model>
                        <ext:Model ID="Model1" runat="server">
                            <Fields>
                                <ext:ModelField Name="Index" Type="Int" />
                                <ext:ModelField Name="Percentage" Type="Float" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <ColumnModel ID="ColumnModel1" runat="server">
                <Columns>
                     <ext:RowNumbererColumn ID="RowNumbererColumn1" runat="server" />

                     <ext:ComponentColumn ID="ComponentColumn1" runat="server">
                        <Component>
                            <ext:ProgressBar ID="ProgressBar1" runat="server" Text="Progress" />
                        </Component>
                        <Listeners>
                            <Bind Handler="cmp.updateProgress(record.get('Percentage'))" />
                        </Listeners>
                     </ext:ComponentColumn>

                     <ext:ComponentColumn ID="ComponentColumn2" runat="server" OverOnly="true" Width="180">
                        <Component>
                            <ext:Container ID="Container1" runat="server" Layout="HBoxLayout">
                                <Items>
                                    <ext:Button ID="Button1" runat="server" Text="Button 1" Icon="Add" />
                                    <ext:Window ID="win1" Title="title" runat="server" Closable="false" Selectable="false" BodyPadding="10" Width="100" Height="150" X="150" Y="10"></ext:Window>
                                </Items>
                            </ext:Container>
                        </Component>
                        <Renderer Handler="metadata.style='color:gray;'; return 'Move mouse here';" />
                     </ext:ComponentColumn>
                </Columns>
            </ColumnModel>
        </ext:GridPanel>  

        <br />
        <h3>Tasks Emulation</h3>
        <br />

        <ext:GridPanel ID="GridPanel2" 
            runat="server" 
            Title="Tasks" 
            Width="320">
            <Bin>
                <ext:TaskManager ID="TaskManager1" runat="server">
                    <Tasks>
                        <ext:Task WaitPreviousRequest="true" Interval="1000">
                            <Listeners>
                                <Update Handler="return hasPendingTasks(#{Store2}) ? true : Ext.net.TaskResponse.stopAjax;" />
                            </Listeners>
                            <DirectEvents>
                                <Update OnEvent="DoTasks">
                                    <ExtraParams>
                                        <ext:Parameter Name="tasks" Value="#{Store2}.getRecordsValues({filterRecord:filterTask})" Mode="Raw" />
                                    </ExtraParams>
                                </Update>
                            </DirectEvents>
                        </ext:Task>
                    </Tasks>
                </ext:TaskManager>
            </Bin>
            <Store>
                <ext:Store ID="Store2" runat="server">
                    <Model>
                        <ext:Model ID="Model2" runat="server" IDProperty="TaskID">
                            <Fields>
                                <ext:ModelField Name="TaskID" Type="Int" />
                                <ext:ModelField Name="TaskName" Type="String" />
                                <ext:ModelField Name="Progress" Type="Float" />
                                <ext:ModelField Name="Status" Type="Int" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <ColumnModel ID="ColumnModel2" runat="server">
                <Columns>
                     <ext:RowNumbererColumn ID="RowNumbererColumn2" runat="server" />

                     <ext:Column ID="Column1" runat="server" Text="Task" DataIndex="TaskName" />

                     <ext:ComponentColumn ID="ComponentColumn3" runat="server" Flex="1">
                        <Component>
                            <ext:Container ID="Container2" runat="server" Height="22">
                                <Items>
                                    <ext:Label ID="Label1" runat="server" ItemID="Status" />
                                    <ext:ProgressBar ID="ProgressBar2" runat="server" ItemID="Progress" />
                                    <ext:Button ID="Button3" runat="server" ItemID="Trigger" Text="Run">
                                        <Listeners>
                                            <Click Handler="this.ownerCt.record.set('Status', 1);" />
                                        </Listeners>
                                    </ext:Button>
                                </Items>
                            </ext:Container>
                        </Component>
                        <Listeners>
                            <Bind Fn="bindWidgets" />
                        </Listeners>
                     </ext:ComponentColumn>
                </Columns>
            </ColumnModel>
        </ext:GridPanel>
    </form>
</body>
</html>