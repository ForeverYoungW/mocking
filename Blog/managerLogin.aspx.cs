using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (managerID.Text != "" && managerPassword.Text != "")
        {
            if (managerID.Text == "王恺鹏" && managerPassword.Text == "1234")
            {
                Response.Redirect("manager.aspx");
            }
            else
                Response.Write("<script>alert('账号或密码有误')</script>");
        }
        else
            Response.Write("<script>alert('请输入账号和密码！')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("homePage.aspx");
    }
}