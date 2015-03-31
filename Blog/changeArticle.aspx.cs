using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class changeArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                articleID.Text = Request.QueryString["articleID"];
                articleTitle.Text = (string)SqlHelper.SqlExecuteScalar("SELECT articleTitle FROM articles WHERE articleID= " + Request.QueryString["articleID"] + "");
                articleClass.Text = (string)SqlHelper.SqlExecuteScalar("SELECT articleClass FROM articles WHERE articleID= " + Request.QueryString["articleID"] + "");
                articleContent.Text = (string)SqlHelper.SqlExecuteScalar("SELECT articleContent FROM articles WHERE articleID= " + Request.QueryString["articleID"] + "");
            }
        }
        catch
        {
            Response.Write("<script>window.alert('请登录！');location.href='homePage.aspx';</script>");//页面跳转加弹窗
        }
    }
    protected void sure_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            string b = articleClass.Text;
            string c = articleTitle.Text;
            string d = articleContent.Text;
            articles artb = db.articles.SingleOrDefault(x => x.articleClass == b);
            db.articles.Remove(artb);
            articles artc = db.articles.SingleOrDefault(y => y.articleTitle == c);
            db.articles.Remove(artc);
            articles artd = db.articles.SingleOrDefault(z => z.articleContent == d);
            db.articles.Remove(artd);
            db.SaveChanges();
            int a;
            a = SqlHelper.SqlCommand("UPDATE articles SET articleClass=N'" + articleClass.Text + "',articleTitle=N'" + articleTitle.Text + "',articleContent=N'" + articleContent.Text + "' WHERE articleID= " + Request.QueryString["articleID"] + "");
            if (a == 1)
                Response.Write("<script>window.alert('文章修改成功！');location.href='myBlog.aspx';</script>");//页面跳转加弹窗
            else
                Response.Write("<script>alert('文章修改失败')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("myBlog.aspx");
    }
}