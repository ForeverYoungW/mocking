using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class changePassword : System.Web.UI.Page
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
            Response.Write("<script>window.alert('请登录！');location.href='homePage.aspx';</script>");//页面跳转加弹窗
        }
    }
    protected void sure_Click(object sender, EventArgs e)
    {
        if (userID.Text != "" && oldPassword.Text != "" && newPassword1.Text != "" && newPassword2.Text != "")
            if (SqlHelper.SqlExecuteScalar("SELECT userID,userPassword FROM users WHERE userID=N'" + userID.Text + "' AND userPassword=N'" + oldPassword.Text + "'") != null)
            {
                if (newPassword1.Text == newPassword2.Text)
                {
                    int a;
                    a = SqlHelper.SqlCommand("UPDATE users SET userPassword='" + newPassword1.Text + "'WHERE userID=N'" + userID.Text + "'");
                    if(a==1)
                        Response.Write("<script>window.alert('密码修改成功！');location.href='personalInformation.aspx';</script>");//页面跳转加弹窗
                    else
                        Response.Write("<script>alert('密码修改失败!')</script>");
                }
                else
                    Response.Write("<script>alert('两个新密码不一致!')</script>");
            }
            else
            {
                Response.Write("<script>alert('密码错误!')</script>");
            }
        else
        {
            Response.Write("<script>alert('请将信息填写完整!')</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("personalInformation.aspx");
    }
}