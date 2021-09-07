using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

namespace ASP
{
  public  class DataBase
    {
        private SqlCommand cmd;
        private SqlConnection con;
        private SqlDataAdapter DataAdapt;
        private DataTable dt;

        public void DoCommand(string sql)
        {
            con = new SqlConnection();

            con.ConnectionString = "data source =(local);initial catalog=ASP;integrated security=true";

            cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable MySelect(string sql)
        {
            con = new SqlConnection();
            con.ConnectionString = "data source =(local);initial catalog=ASP;integrated security=true";
            cmd = new SqlCommand();
            cmd.Connection = con;
            DataAdapt = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            cmd.CommandText = sql;
            DataAdapt.Fill(dt);
            con.Close();
            return dt;
        }
    }
}
