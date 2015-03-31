using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// SQLHelper 的摘要说明
/// </summary>
public static class SqlHelper
{
    //static string str = @"server=(localdb)\v11.0;Integrated Security=SSPI;database=Blog;";
    static string str = ConfigurationManager.ConnectionStrings["WebConnectionString"].ConnectionString;

    static public DataSet SelectDS(string select)
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            DataSet ds = new DataSet();
            {
                conn.Open();//打开
                SqlDataAdapter da = new SqlDataAdapter(select, conn);
                da.Fill(ds);//进行填充
            }
            return ds;//返回这个数据集
        }
    }

    static public DataTable SelectDT(string select)
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            DataTable dt = new DataTable();
            {
                conn.Open();//打开
                SqlDataAdapter da = new SqlDataAdapter(select, conn);
                da.Fill(dt);//进行填充
            }
            return dt;//返回这个数据集
        }
    }
    static public int SqlCommand(string c)
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(c, conn);
            return cmd.ExecuteNonQuery();
        }
    }

    static public int SqlExecuteNonQuery(string b)
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(b, conn);
            return cmd.ExecuteNonQuery();//返回受影响的行数
        }
    }

    static public object SqlExecuteScalar(string a)
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(a, conn);
            return cmd.ExecuteScalar();//返回第一行
        }
    }
}

