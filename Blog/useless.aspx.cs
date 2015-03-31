using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class homePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["articleClass"] != null)
        {
            string articleClass = Request.Params["articleClass"];
            main.SelectCommand = "SELECT articles.articleClass,articles.articleTitle,articles.articleContent,articles.pushTime,articles.clockCount,articles.userID,articles.articleID FROM articles WHERE articles.articleClass=N'" + articleClass + "'";
        }
    }
    protected void DataList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}