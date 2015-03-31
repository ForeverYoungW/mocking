using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class personalInformation : System.Web.UI.Page
{
    public string srcc = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            userID.Text = Session["ID"].ToString();
            try
            {
                srcc = (string)SqlHelper.SqlExecuteScalar("SELECT userPicture FROM users WHERE userID=N'" + userID.Text + "'");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        int a, b;
        string savepath,savepath1="";
        try
        {
            a=SqlHelper.SqlCommand("UPDATE users SET userPicture=N'" + userPicture.PostedFile.FileName + "',userSex=N'"+userSex.Text+"',userBirthday='"+userBirthday.Text+"',userEmail='"+userEmail.Text+"' WHERE userID=N'"+userID.Text+"'");
            if (userPicture.PostedFile.FileName != "")
            {
                savepath = Server.MapPath("/photo") + "/" + userPicture.FileName;//photo即图片文件夹
                userPicture.SaveAs(savepath);//图片保存到这个路径
                savepath1 = "/photo" + "/" + userPicture.FileName;
            }
            b = SqlHelper.SqlCommand("UPDATE users SET userPicture=N'" + savepath1 + "' WHERE userID=N'" + userID.Text + "'");
            if (a == 1)
                Response.Write("<script>window.alert('信息修改成功！');location.href='loginHomePage.aspx';</script>");//页面跳转加弹窗
        }
        catch
        {
            Response.Write("<script>alert('日期输入格式有误!')</script>");
        }
        finally
        {

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("loginHomePage.aspx");
    }
}