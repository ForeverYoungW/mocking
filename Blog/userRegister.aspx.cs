using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("homePage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (var db = new BlogEntities())
        {
            string savepath = null;
            string savepath1 = null;
            try
            {
                if (userID.Text != "" && userPassword1.Text != "" && userPassword2.Text != "")
                {
                    string b=userID.Text;
                    //object c;
                    //c = SqlHelper.SqlExecuteScalar("SELECT userID FROM users WHERE userID=N'" + userID.Text + "'");
                    ////a==db.users.SingleOrDefault(u=>u.userID==a).userID
                    if (db.users.SingleOrDefault(u=>u.userID==b)== null)
                    {
                        if (userPassword1.Text == userPassword2.Text)
                        {
                            if (userPicture.FileName != "")
                            {
                                savepath = Server.MapPath("/photo") + "/";//photo即图片文件夹
                                savepath += userPicture.FileName;//图片路径
                                userPicture.SaveAs(savepath);//图片保存到这个路径
                                savepath1 = "/photo" + "/" + userPicture.FileName;
                                //int b = SqlHelper.SqlCommand("INSERT INTO users (userPicture) VALUES (N'" + savepath + "')");//路径保存到数据库
                            }
                            var us = new users();
                            us.userID = userID.Text;
                            us.userPassword = userPassword1.Text;
                            us.userPicture = savepath1;
                            us.userSex = userSex.Text;
                            us.userBirthday = Convert.ToDateTime(userBirthday.Text);
                            us.userEmail = userEmail.Text;
                            db.users.Add(us);
                            db.SaveChanges();
                            Response.Write("<script>window.alert('注册成功！');location.href='homePage.aspx';</script>");//页面跳转加弹窗
                            //int a = SqlHelper.SqlCommand("INSERT INTO users(userID,userPassword,userPicture,userSex,userBirthday,userEmail)VALUES(N'" + userID.Text + "',N'" + userPassword1.Text + "',N'" + savepath1 + "',N'" + userSex.Text + "',N'" + userBirthday.Text + "',N'" + userEmail.Text + "')");
                            //if (a == 1)
                            //{
                               // Response.Write("<script>window.alert('注册成功！');location.href='homePage.aspx';</script>");//页面跳转加弹窗
                            //}
                            //else
                            //{
                                //Response.Write("<script>alert('注册失败!')</script>");
                            //}
                        }
                        else
                        {
                            Response.Write("<script>alert('两次输入的密码不一致!')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('该用户名已被使用!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('请完成必填项的填写!')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('日期输入格式有误!')</script>");
            }
            finally
            {

            }
        }
    }
    protected void userID_TextChanged(object sender, EventArgs e)
    {

    }
}