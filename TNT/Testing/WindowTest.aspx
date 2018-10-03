<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WindowTest.aspx.cs" Inherits="TNT.WindowTest" %>

<%@ Import Namespace="ListItem=Ext.Net.ListItem" %>

<script runat="server">
    
</script>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Window UI Styles - Ext.NET Examples</title>

    <script type="text/javascript">
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
        };

        var onShow = function (toolTip, grid) {
            var view = grid.getView(),
                store = grid.getStore(),
                record = view.getRecord(view.findItemByChild(toolTip.triggerElement)),
                column = view.getHeaderByCell(toolTip.triggerElement),
                data = record.get(column.dataIndex);

            toolTip.update(data);
        };

        var loaded = function (e) {
            //alert(Ext.EventObject.getXY());
            var event = e.event;
            alert(event.clientX);
        }

        function showCoordsx(view, cell, recordIndex, cellIndex, e,event) {
//            var x = event.clientX;
//            var y = event.clientY;
//            var coords = "X coords: " + x + ", Y coords: " + y;
//            alert(coords);

//            var x = 0;
//            var coords = e.xy(x);
//            var coodrsy = e.xy(x++);
//            alert(coords+coodrsy);

            alert(event.getXY());
        }

    </script>

</head>
<body" style="padding:30px;"> <%--onload="loaded()--%>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />

        

        <ext:Panel runat="server" ID="panel1" Region="Center" AutoHeight="true" >
        <Items>
        
        <ext:ComboBox 
            ID="ThemeSelector" 
            runat="server" 
            FieldLabel="Theme" 
            AutoPostBack="true">
            <Items>
                <ext:ListItem Text="Classic" Value="0" />
                <ext:ListItem Text="Gray" Value="1" />
            </Items>
        </ext:ComboBox>
        
        <%--<ext:Window 
            ID="Window1" 
            runat="server" 
            Title="Window" 
            Width="500" 
            Height="300" 
            BodyPadding="10"
            Visible="true"
            >
            <Tools>
                <ext:Tool Type="Toggle" />
                <ext:Tool Type="Close" />
                <ext:Tool Type="Minimize" />
                <ext:Tool Type="Maximize" />
                <ext:Tool Type="Restore" />
                <ext:Tool Type="Gear" />
                <ext:Tool Type="Pin" />
                <ext:Tool Type="Refresh" />
                <ext:Tool Type="Plus" />
                <ext:Tool Type="Help" />
                <ext:Tool Type="Search" />
                <ext:Tool Type="Save" />
                <ext:Tool Type="Print" />
            </Tools>
            <Items>
                <ext:ComboBox ID="ComboBox1" runat="server" FieldLabel="UI" Editable="false">
                    <Items>
                        <ext:ListItem Text="default" />
                        <ext:ListItem Text="primary" />
                    </Items>                    
                    <Listeners>
                        
                    </Listeners>
                </ext:ComboBox>
            </Items>
        </ext:Window>--%>






        <ext:GridPanel 
            ID="GridPanel1" 
            runat="server"
            Title="Array Grid" 
            Width="600" 
            Height="350">

            <%--<Listeners>--%>
            <%--<BeforeShow Handler="this.clickPoint = Ext.EventObject.getXY();">
            </BeforeShow>--%>
            <%--<ItemMouseUp Fn="showCoordsx"></ItemMouseUp>
            </Listeners>--%>

            <DirectEvents>
            <ItemMouseUp OnEvent="showCoords"></ItemMouseUp>
            </DirectEvents>

            <Store>
                <ext:Store ID="Store1" runat="server">
                    <Model>
                        <ext:Model ID="Model1" runat="server">
                            <Fields>
                                <ext:ModelField Name="company" />
                                <ext:ModelField Name="price" Type="Float" />
                                <ext:ModelField Name="change" Type="Float" />
                                <ext:ModelField Name="pctChange" Type="Float" />
                                <ext:ModelField Name="lastChange" Type="Date" DateFormat="M/d hh:mmtt" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <ColumnModel ID="ColumnModel1" runat="server">
                <Columns>
                    <ext:Column ID="Column1" runat="server" Text="Company" DataIndex="company" Flex="1" />
                    <ext:Column ID="Column2" runat="server" Text="Price" DataIndex="price">
                        <Renderer Format="UsMoney" />
                    </ext:Column>
                    <ext:Column ID="Column3" runat="server" Text="Change" DataIndex="change">
                        <Renderer Fn="change" />
                    </ext:Column>
                    <ext:Column ID="Column4" runat="server" Text="Change" DataIndex="pctChange">
                        <Renderer Fn="pctChange" />
                    </ext:Column>
                    <ext:DateColumn ID="DateColumn1" runat="server" Text="Last Updated" DataIndex="lastChange" />

                    <ext:CommandColumn ID="CmdCol_Edit" runat="server" Width="25px" Text="" Align="Center">
                        <Commands>
                            <ext:GridCommand Icon="BulletEdit" CommandName="Edit">
                                <ToolTip Text="Edit Record!" />
                            </ext:GridCommand>
                        </Commands>
                        <DirectEvents>
                            <Command OnEvent="ShowDetails" Timeout="100000">
                                <EventMask ShowMask="true" CustomTarget="={#{GridPanel1}.body}" />
                                <ExtraParams>
                                    <ext:Parameter Name="paracompany" Value="record.data.company" Mode="Raw" />
                                </ExtraParams>
                            </Command>
                        </DirectEvents>
                    </ext:CommandColumn>

                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" Mode="Single" />
            </SelectionModel>
            <View>
                <ext:GridView ID="GridView1" runat="server" StripeRows="true" TrackOver="true" />
            </View>
        </ext:GridPanel>











        </Items>
        </ext:Panel>

    </form>
</body>
</html>
