using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["ID"].ToString() != null)
                userID.Text = Session["ID"].ToString();
        }
        catch
        {
            Response.Redirect("homePage.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (articleTitle.Text != "" && articleContent.Text != "" && articleClass.Text != "")
        {
            int a;
            a = SqlHelper.SqlCommand("INSERT INTO articles(userID,articleTitle,articleContent,articleClass)VALUES(N'" + userID.Text + "',N'" + articleTitle.Text + "',N'" + articleContent.Text + "',N'" + articleClass.Text + "')");
            if (a == 1)
            {
                Response.Write("<script>window.alert('文章发表成功！');location.href='myBlog.aspx';</script>");//页面跳转加弹窗
            }
            else
            {
                Response.Write("<script>alert('文章发表失败！')</script>");
            }
        }
        else
            Response.Write("<script>alert('请输入信息！')</script>");
    }
    protected void articleClass_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("myBlog.aspx");
    }
}