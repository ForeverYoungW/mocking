using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void return_Click(object sender, EventArgs e)
    {
        Response.Redirect("homePage.aspx");
    }
    protected void login_Click(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            Session["ID"] = null;
            string a = userID.Text;
            string b = userPassword.Text;
            if (a==db.users.SingleOrDefault(u=>u.userID==a).userID&&b==db.users.SingleOrDefault(u=>u.userID==b).userPassword)
                //(SqlHelper.SqlExecuteScalar("SELECT *FROM users WHERE userID=N'" + userID.Text + "' AND userPassword ='" + userPassword.Text + "'") != null)
            {
                Session["ID"] = userID.Text;
                Response.Redirect("loginHomePage.aspx");
            }
            else
                Response.Write("<script>alert('用户名不存在或密码错误')</script>");
        }
    }
}