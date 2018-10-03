using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace TNT
{
    public partial class MainConsole : System.Web.UI.Page
    {

        ///////
        string[] NodeIDsFinance = { "Definition", "Transaction", "Payroll", "NIReports", "Accounts Reports", "Bank Reports", "Payroll Reports", "System" };
        string[] NodeIDsMis = { "Inventory", "NIReports", "Inventory Reports", "NIDefinition" };
        string[] NodeIDsSecurity = { "Security", "NodeIdUser", "NISecurityGroupMain", "NIdBranch", "ChangePassword", "Logout" };

        string[] NodesToCollapse = { "Security", "Payroll", "Transaction", "System", "NIReports", "Definition", "Inventory", "NIDefinition" };


        string[] NodeIdsOfGroups = { "Security", "NodeIdUser", "NISecurityGroupMain", "NIdBranch", "Definition", "Transaction", "Payroll", "Inventory", "Accounts Reports", "Bank Reports", "Payroll Reports", "Inventory Reports", "System", "NIDefinition" };

        string[] NodeIdsDontRemove = { "Security", "NIReports", "Accounts Reports" };//these contain parnts 
        ///////


        DataTable dTuserTasks;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                this.TreePanelMain.Listeners.ItemClick.Handler = "addTab1(App.Pages, record);";

                /////////////DB ENABLE/DISABLE USING USER TASKS//////////////////
                SqlConnection con; SqlCommand cmd; SqlDataAdapter myAdapter; DataSet ds;

                con = new SqlConnection("server=local;uid=sa;pwd=abc@123;Database=TNT;Connect Timeout=10000;");
                try
                {
                    con.Open();
                    cmd = new SqlCommand("select * from VuAllUsersTasks Where UserID=2 order by TaskGroup", con);

                    cmd.CommandType = CommandType.Text;
                    myAdapter = new SqlDataAdapter();
                    myAdapter.SelectCommand = cmd;
                    cmd.CommandTimeout = 1000;
                    ds = new DataSet();
                    myAdapter.Fill(ds);

                    if (ds.Tables.Count != 0)
                    {
                        dTuserTasks = ds.Tables[0];
                    }
                    else
                    {
                        dTuserTasks = null;
                    }

                }
                catch (Exception EX)
                {

                    throw EX;
                }
                /////////////DB ENABLE/DISABLE USING USER TASKS//////////////////



                //add userName at menubar
                //if (dTuserTasks != null && dTuserTasks.Rows.Count > 0)
                //{
                //    lblUserName.Text = dTuserTasks.Rows[0]["UserName"].ToString();
                //}



                //////////////////Add Nods at runtime
                for (int i = 0; i < dTuserTasks.Rows.Count; i++)
                {
                    creatNodeRuntime(dTuserTasks.Rows[i]["TaskName"].ToString(),
                    dTuserTasks.Rows[i]["TaskKey"].ToString(), dTuserTasks.Rows[i]["TaskGroup"].ToString(),
                    dTuserTasks.Rows[i]["MenuIcon"].ToString(), dTuserTasks.Rows[i]["PageURL"].ToString()
                    );
                }

                //remove group nodes, those who dont have leaf nodes
                foreach (string str in NodeIdsOfGroups)
                {
                    //dont delete Parents nodes those who hava sub parents in them. 
                    if (dTuserTasks.Select("TaskGroup = '" + str + "'").Length < 1 && !NodeIdsDontRemove.Contains(str))
                    {
                        //TreePanelMain.GetNodeById(str).Set("hidden", true);
                        TreePanelMain.GetNodeById(str).Remove();

                        //also remove parents or leafs, influence for front end.
                        var list = new List<string>(NodeIDsFinance);
                        list.Remove(str);
                        NodeIDsFinance = list.ToArray();

                        list = new List<string>(NodeIDsMis);
                        list.Remove(str);
                        NodeIDsMis = list.ToArray();

                        list = new List<string>(NodeIDsSecurity);
                        list.Remove(str);
                        NodeIDsSecurity = list.ToArray();

                        list = new List<string>(NodesToCollapse);
                        list.Remove(str);
                        NodesToCollapse = list.ToArray();
                    }
                }
                //////////////////Add Nods at runtime



                //////allowd tasks str array object for javascript
                string arrayString = string.Empty;

                foreach (DataRow row in dTuserTasks.Rows)
                {
                    arrayString += "new String('" + row["TaskKey"].ToString() + "'),";
                }

                // arrayString = "new String('word1'),new String('word2'), ...etc";
                ClientScript.RegisterArrayDeclaration("AllowedTasksKeys", arrayString);
                //////allowd tasks str array object for javascript

                //////hideForMis str array object for javascript
                arrayString = string.Empty;

                foreach (string str in NodeIDsMis)
                {
                    arrayString += "new String('" + str + "'),";
                }

                ClientScript.RegisterArrayDeclaration("NodeIDsMis", arrayString);
                //////hideForMis str array object for javascript

                //////hideForSec str array object for javascript
                arrayString = string.Empty;

                foreach (string str in NodeIDsSecurity)
                {
                    arrayString += "new String('" + str + "'),";
                }

                ClientScript.RegisterArrayDeclaration("NodeIDsSecurity", arrayString);
                //////hideForSec str array object for javascript

                //////hideForFinance str array object for javascript
                arrayString = string.Empty;

                foreach (string str in NodeIDsFinance)
                {
                    arrayString += "new String('" + str + "'),";
                }

                ClientScript.RegisterArrayDeclaration("NodeIDsFinance", arrayString);
                //////hideForFinance str array object for javascript

                //////// nodesToColapse str array object for javascript
                arrayString = string.Empty;

                foreach (string str in NodesToCollapse)
                {
                    arrayString += "new String('" + str + "'),";
                }

                ClientScript.RegisterArrayDeclaration("NodesToCollapse", arrayString);
                //////// nodesToColapse str array object for javascript



                /////EXPEND THEN COLLAPSE TO MAKE THEM HIDE
                for (int i = 0; i < NodesToCollapse.Length; i++)
                {
                    TreePanelMain.GetNodeById(NodesToCollapse[i]).Expand(true);
                    TreePanelMain.GetNodeById(NodesToCollapse[i]).Collapse(true);
                }
                /////EXPEND THEN COLLAPSE TO MAKE THEM HIDE

                ///////////////////////////////NOW HANDELING AT CLIENT SIDE///// SEARCH FOR <AfterRender>///////////////////////////////
                /////set Active Menu Item until right frontend event is not found
                //MIFinance.AddCls("setActiveTab");
                //MISecurity.RemoveCls("setActiveTab");
                //MIMIS.RemoveCls("setActiveTab");
                /////set Active Menu Item until right frontend event is not found

                //////////handeling at backend until find apropirate client load event
                //MISNodesHide(true);
                //SecurityNodesHide(true);
                //FinanceNodesHide(false);
                //////////handeling at backend until find apropirate client load event
                ///////////////////////////////NOW HANDELING AT CLIENT SIDE///// SEARCH FOR <AfterRender>///////////////////////////////


                this.TreePanelMain.Title = "Welcome Finance";


                //TreePanelMain.GetNodeById("OpeningBalances").Remove();
                //TreePanelMain.GetNodeById("ChartofAccounts").Remove();


                ////////////test
                btnid.Text = dTuserTasks.Rows[0]["UserName"].ToString();
                ////////////test
            }
        }
        
        private void creatNodeRuntime(string text, string nodeId, string parentNode, string icon = "Link", string url = "TestPage.aspx")
        {
            if (icon == "")
            {
                //In DB allow null in checked so handel null value in code
                icon = "Link";
            }
            if (url == "")
            {
                //In DB allow null in checked so handel null value in code
                url = "TestPage.aspx";
            }

            //make a node
            Ext.Net.Node node = new Ext.Net.Node()
            {
                Text = text,
                NodeID = nodeId,
                Icon = (Icon)System.Enum.Parse(typeof(Icon), icon),
                Leaf = true
            };
            ///make One Or More custom attributes.
            var attrs = new[]
                {
                new ConfigItem("url",url,ParameterMode.Value)
                //new ConfigItem("NodeRights","NiNewNode",ParameterMode.Value)
                };

            ///add to node the custom attributes.
            node.CustomAttributes.AddRange(attrs);
            //pull leaf nodes to already made tree.
            this.TreePanelMain.GetNodeById(parentNode).InsertChild(0, node);

        }


        void FinanceNodesHide(bool hidden)
        {
            for (int i = 0; i < NodeIDsFinance.Length; i++)
            {
                //TreePanelMain.GetNodeById(NodeIDsFinance[i]).Set("Hidden", hidden);
                //rana sunday 8-19-18
                if (hidden)
                {
                    TreePanelMain.GetNodeById(NodeIDsFinance[i]).SetCls("x-hidden");
                }
                else
                {
                    TreePanelMain.GetNodeById(NodeIDsFinance[i]).SetCls("");
                }
                //rana sunday 8-19-18 
            }
        }

        void MISNodesHide(bool hidden)
        {
            for (int i = 0; i < NodeIDsMis.Length; i++)
            {
                //TreePanelMain.GetNodeById(NodeIDsMis[i]).Set("Hidden", hidden);
                //rana sunday 8-19-18
                if (hidden)
                {
                    TreePanelMain.GetNodeById(NodeIDsMis[i]).SetCls("x-hidden");
                }
                else
                {
                    TreePanelMain.GetNodeById(NodeIDsMis[i]).SetCls("");
                }
                //rana sunday 8-19-18
            }
        }

        void SecurityNodesHide(bool hidden)
        {
            for (int i = 0; i < NodeIDsSecurity.Length; i++)
            {
                //TreePanelMain.GetNodeById(NodeIDsSecurity[i]).Set("Hidden", hidden);
                //rana sunday 8-19-18
                if (hidden)
                {
                    TreePanelMain.GetNodeById(NodeIDsSecurity[i]).SetCls("x-hidden");
                }
                else
                {
                    TreePanelMain.GetNodeById(NodeIDsSecurity[i]).SetCls("");
                }
                //rana sunday 8-19-18
            }
        }

    }
}