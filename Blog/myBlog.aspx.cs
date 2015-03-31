using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myBlog : System.Web.UI.Page
{
    public string srcc = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            try
            {
                userID.Text = Session["ID"].ToString();
                SqlDataSource1.SelectCommand = "SELECT articleTitle, articleContent, articleClass, articleID,pushTime, clockCount FROM articles WHERE userID = N'" + userID.Text + "'";
                try
                {
                    srcc = (string)SqlHelper.SqlExecuteScalar("SELECT userPicture FROM users WHERE userID =N'" + userID.Text + "'");
                }
                catch
                {
                    srcc = "";
                }
            }
            catch
            {
                Response.Write("<script>window.alert('请登录！');location.href='homePage.aspx';</script>");//页面跳转加弹窗
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("loginHomePage.aspx");
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}