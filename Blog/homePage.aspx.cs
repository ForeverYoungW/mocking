using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class temp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string articleClass = Request.Params["articleClass"];
        PagedDataSource pds1 = new PagedDataSource();
        using (var db = new BlogEntities())
        {
            if (Request.Params["articleClass"] != null)
                pds1.DataSource = (from u in db.articles where u.classes.articleClass == Request.Params["articleClass"] select u).ToList();
            //SqlHelper .SelectDT("Select * from articles where articleClass='"+Request.Params["articleClass"]+"'").DefaultView;
            else
                pds1.DataSource = (from u in db.articles select u).ToList();
            //SqlHelper.SelectDT("Select * from articles").DefaultView;
            pds1.AllowPaging = true; //开启分页
            pds1.PageSize = 6;   //设置每页的行数
            Label2.Text = pds1.PageCount.ToString();
            PagedDataSource pds2 = new PagedDataSource();
            pds2.DataSource = (from u in db.articles select u).ToList();
            //SqlHelper.SelectDT("Select * from articles").DefaultView;
            pds2.AllowPaging = true; //开启分页
            pds2.PageSize = 6;   //设置每页的行数
            Label3.Text = pds2.PageCount.ToString();
            PagedDataSource pds3 = new PagedDataSource();
            pds3.DataSource = (from u in db.articles select u).ToList();
            //SqlHelper.SelectDT("Select * from articles").DefaultView;
            pds3.AllowPaging = true; //开启分页
            pds3.PageSize = 6;   //设置每页的行数
            Label4.Text = pds3.PageCount.ToString();
            if (Request.Params["articleClass"] != null)
            {
                article.DataSource = (from u in db.articles where u.classes.articleClass == Request.Params["articleClass"] select u);
                    //SqlHelper.SelectDT("Select * from articles where articleClass='" + Request.Params["articleClass"] + "'");
                article.DataBind();
            }
            else
            {
                article.DataSource = (from u in db.articles select u).ToList();
                //SqlHelper.SelectDT("Select * from articles");
                article.DataBind();
            }
            classes.DataSource = (from u in db.articles select u).ToList();
                //SqlHelper.SelectDT("Select top 8 *from classes");
            classes.DataBind();
            top.DataSource = (from u in db.articles select u).ToList();
                //SqlHelper.SelectDT("Select top 5 *from articles order by clockCount DESC");
            top.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            try
            {
                PagedDataSource pds1 = new PagedDataSource();
                pds1.DataSource = (from u in db.articles select u).ToList();
                //SqlHelper.SelectDT("Select * from articles").DefaultView;
                pds1.AllowPaging = true; //开启分页
                pds1.PageSize = 6;   //设置每页的行数
                if (Convert.ToInt32(pageIndex1.Text) > 0 && Convert.ToInt32(pageIndex1.Text) <= pds1.PageCount)
                    pds1.CurrentPageIndex = Convert.ToInt32(pageIndex1.Text) - 1; //设置当前页数
                else if (Convert.ToInt32(pageIndex1.Text) <= 0)
                {
                    pageIndex1.Text = "1";
                    pds1.CurrentPageIndex = 0;
                }
                else if (Convert.ToInt32(pageIndex1.Text) > pds1.PageCount)
                {
                    pageIndex1.Text = Convert.ToString(pds1.PageCount);
                    pds1.CurrentPageIndex = pds1.PageCount - 1;
                }
                article.DataSource = pds1;
                article.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('请输入数字!')</script>");
                pageIndex3.Text = "1";
            }
        }
    }
    protected void jump2_Click(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            try
            {
                PagedDataSource pds2 = new PagedDataSource();
                pds2.DataSource = (from u in db.articles select u).ToList();
                //SqlHelper.SelectDT("Select * from articles").DefaultView;
                pds2.AllowPaging = true; //开启分页
                pds2.PageSize = 6;   //设置每页的行数
                if (Convert.ToInt32(pageIndex2.Text) > 0 && Convert.ToInt32(pageIndex2.Text) <= pds2.PageCount)
                    pds2.CurrentPageIndex = Convert.ToInt32(pageIndex2.Text) - 1; //设置当前页数
                else if (Convert.ToInt32(pageIndex2.Text) <= 0)
                {
                    pageIndex2.Text = "1";
                    pds2.CurrentPageIndex = 0;
                }
                else if (Convert.ToInt32(pageIndex2.Text) > pds2.PageCount)
                {
                    pageIndex2.Text = Convert.ToString(pds2.PageCount);
                    pds2.CurrentPageIndex = pds2.PageCount - 1;
                }
                classes.DataSource = pds2;
                classes.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('请输入数字!')</script>");
                pageIndex2.Text = "1";
            }
        }
    }
    protected void jump3_Click(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            try
            {
                PagedDataSource pds3 = new PagedDataSource();
                pds3.DataSource = (from u in db.articles select u).ToList();
                //SqlHelper.SelectDT("Select * from articles").DefaultView;
                pds3.AllowPaging = true; //开启分页
                pds3.PageSize = 6;   //设置每页的行数
                if (Convert.ToInt32(pageIndex3.Text) > 0 && Convert.ToInt32(pageIndex3.Text) <= pds3.PageCount)
                    pds3.CurrentPageIndex = Convert.ToInt32(pageIndex3.Text) - 1; //设置当前页数
                else if (Convert.ToInt32(pageIndex3.Text) <= 0)
                {
                    pageIndex3.Text = "1";
                    pds3.CurrentPageIndex = 0;
                }
                else if (Convert.ToInt32(pageIndex3.Text) > pds3.PageCount)
                {
                    pageIndex3.Text = Convert.ToString(pds3.PageCount);
                    pds3.CurrentPageIndex = pds3.PageCount - 1;
                }
                article.DataSource = pds3;
                article.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('请输入数字!')</script>");
                pageIndex3.Text = "1";
            }
        }
    }
}