using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class responseReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Request.QueryString["reviewID"] != null)
            {
                reviewID.Text = Request.QueryString["reviewID"];
                reviewContent.Text = (string)SqlHelper.SqlExecuteScalar("SELECT reviewContent FROM reviews WHERE reviewID='" + reviewID.Text + "'");
            }
            else
                Response.Redirect("homePage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int a;
        if (reviewRespond.Text != "")
        {
                a = SqlHelper.SqlCommand("UPDATE reviews SET reviewRespond=N'" + reviewRespond.Text + "' WHERE reviewID= '" + Request.QueryString["reviewID"] + "'");
                if (a == 1)
                {
                    Response.Write("<script>window.alert('评论回复成功！');location.href='myBlog.aspx';</script>");//页面跳转加弹窗
                }
                else
                    Response.Write("<script>alert('回复评论失败!')</script>");
        }
        else
            Response.Write("<script>alert('请输入回复信息!')</script>");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminReview.aspx");
    }
}