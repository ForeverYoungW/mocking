using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class readArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int a;
            if (Session["ID"] != null)
                penName.Text = Session["ID"].ToString();
            else
                penName.Text = "";
            articleTitle.Text = Request.QueryString["articleTitle"];
            authorID.Text = Request.QueryString["authorid"];
            articleID.Text = Request.QueryString["articleid"];
            string id = Request.Params["articleid"];
            if (id == null)
                Response.Redirect("homePage.aspx");
            else
                a = SqlHelper.SqlCommand("UPDATE articles SET clockCount =clockCount+1 WHERE articleID='" + Request.QueryString["articleid"] + "'");
            //Out.DataSource = SqlHelper.SelectDT("Select * from reviews where articleID='"+articleID.Text+"'");
            //Out.DataBind();
        }
        catch
        {
            Response.Redirect("homePage.aspx");
        }
    }
    //内嵌的repeater
    //protected DataTable InnerData(string id)
    //{
        //DataTable dt = SqlHelper.SelectDT("select * from reviews2 where ID=" + id);
        //return dt;
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        int a = 2;
        //int b=2;
        if (penName.Text != "")
        {
            if (review.Text != "")
            {
                a = SqlHelper.SqlCommand("INSERT INTO reviews(articleTitle,userID,articleID,penName,reviewContent)VALUES(N'" + articleTitle + "',N'" + authorID.Text + "',N'" + articleID.Text + "',N'" + penName.Text + "',N'" + review.Text + "')");
                //c = (int)SqlHelper.SqlExecuteScalar("select reviewID from reviews order by reviewID desc");
                //b = SqlHelper.SqlCommand("INSERT INTO reviews2(ID,penName,reviewContent)VALUES('"+c+"',N'" + penName.Text + "',N'" + review.Text + "')");
                if (a == 1)
                {
                    Response.Write("<script>alert('评论成功！')</script>");
                    //Out.DataBind();
                    DataList2.DataBind ();
                    review.Text = "";
                }
            }
            else
                Response.Write("<script>alert('请输入回复内容！')</script>");
        }
        else
            Response.Write("<script>window.alert('请登录！');location.href='userLogin.aspx';</script>");//页面跳转加弹窗
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string ID;
        if (Session["ID"] == null)
            Response.Redirect("homePage.aspx");
        else
        {
            ID = Session["ID"].ToString();
            Response.Redirect("loginHomePage.aspx");
        }
    }
}