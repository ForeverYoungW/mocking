using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class readAuthor : System.Web.UI.Page
{
    public string srcc;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            userID.Text = Request.QueryString["articleAuthor"];
            srcc = (string)SqlHelper.SqlExecuteScalar("SELECT userPicture FROM users WHERE userID=N'" + userID.Text + "'");
            userSex.Text = (string)SqlHelper.SqlExecuteScalar("SELECT userSex FROM users WHERE userID=N'" + userID.Text + "'");
            userBirthday.Text = SqlHelper.SqlExecuteScalar("SELECT userBirthday FROM users WHERE userID=N'" + userID.Text + "'").ToString();
            userEmail.Text = (string)SqlHelper.SqlExecuteScalar("SELECT userEmail FROM users WHERE userID=N'" + userID.Text + "'");
        }
        catch
        {
            Response.Redirect("homePage.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
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