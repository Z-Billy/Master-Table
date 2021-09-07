using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;

namespace ASP
{
    public partial class _Default : Page
    {
        SqlConnection con = new SqlConnection("data source = (local); initial catalog = ASP; Integrated security = true");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataTable dt = new DataTable();
        void display()
        {
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            adp.SelectCommand = new SqlCommand();
            adp.SelectCommand.Connection = con;
            adp.SelectCommand.CommandText = " select * from VoteMaster";
            adp.Fill(ds, "VoteMaster");
            GV.DataSource = ds;
            GV.DataBind();

            //dt.Columns.AddRange(new DataColumn[3] { new DataColumn("VoteNum", typeof(int)),
            //new DataColumn("FileNum", typeof(string)), new DataColumn("VoteData", typeof(string)) });
            //dt.Rows.Add("123", "11213", "2021-07-28");
            //GV.DataSource = dt;
            //GV.DataBind();

            //DataTable dt = new DataTable();
            //DataBase db = new DataBase();
            //dt = db.MySelect("select * from VoteMaster ");
            //GV.DataSource = dt;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            GV.Columns[0].HeaderText = "شماره رای";
            GV.Columns[1].HeaderText = "شماره پرونده";
            GV.Columns[2].HeaderText = "تاریخ رای";
            GV.Columns[3].HeaderText = "انتخاب کنید";
            display();
        }


        protected void GV_PageIndexChanging (object sender, GridViewPageEventArgs e)
        {
            GV.PageIndex = e.NewPageIndex;
            GV.DataBind();
        }

        void update ()
        {
            string Vote_Num = GV.SelectedRow.Cells[0].Text;
            string File_Num = GV.SelectedRow.Cells[1].Text;
            string Vote_Date = GV.SelectedRow.Cells[2].Text;
            dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("VoteNum", typeof(int)),
                    new DataColumn("FileNum", typeof(int)), new DataColumn("VoteDate", typeof(string)) });
            dt.Rows.Add(Vote_Num, File_Num, Vote_Date);
            FormView0.DataSource = dt;
            FormView0.DataBind();

            adp = new SqlDataAdapter("select * from Vote1 where VoteNum= '" + Vote_Num + "'  ", con);
            dt = new DataTable();
            adp.Fill(dt);
            FormView1.DataSource = dt;
            FormView1.DataBind();

            adp = new SqlDataAdapter("select * from Vote2 where VoteNum= '" + Vote_Num + "'  ", con);
            dt = new DataTable();
            adp.Fill(dt);
            FormView2.DataSource = dt;
            FormView2.DataBind();
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            update();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "insert into VoteMaster (VoteNum,FileNum, VoteDate) values (@a, @b,@c)";
            cmd.Parameters.AddWithValue("@a", TextBox1.Text);
            cmd.Parameters.AddWithValue("@b", TextBox2.Text);
            cmd.Parameters.AddWithValue("@c", TextBox3.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //dt.Rows.Add(TextBox1.Text, TextBox2.Text, TextBox3.Text);
            //GV.DataSource = dt;
            //GV.DataBind();

            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "insert into Vote1 (VoteNum, Area, Fine) values (@d, @e,@f)";
            cmd.Parameters.AddWithValue("@d", TextBox1.Text);
            cmd.Parameters.AddWithValue("@e", TextBox4.Text);
            cmd.Parameters.AddWithValue("@f", TextBox5.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "insert into Vote2 (VoteNum, ID, Explanation) values (@g, @h,@i)";
            cmd.Parameters.AddWithValue("@g", TextBox1.Text);
            cmd.Parameters.AddWithValue("@h", TextBox6.Text);
            cmd.Parameters.AddWithValue("@i", TextBox7.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            display();
            update();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "update VoteMaster set VoteNum = ' " + TextBox1.Text + " ' , FileNum = ' " + TextBox2.Text + " ' , VoteDate = '" + TextBox3.Text + "' where VoteNum = '" + TextBox1.Text+ "' ";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //dt.Rows.RemoveAt(GV.SelectedRow.RowIndex);
            //GV.DataSource = dt;
            //GV.DataBind();
            //dt.Rows.Add(TextBox1.Text, TextBox2.Text, TextBox3.Text);
            //GV.DataSource = dt;
            //GV.DataBind();

            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "update Vote1 set VoteNum = ' " + TextBox1.Text + " ' , Area= ' " + TextBox4.Text + " ' , Fine = '" + TextBox5.Text + "' where VoteNum = '" + TextBox1.Text + "' ";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "update Vote2 set VoteNum = ' " + TextBox1.Text + " ' , ID= ' " + TextBox6.Text + " ' , Explanation = '" + TextBox7.Text + "' where VoteNum = '" + TextBox1.Text + "' ";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            display();
            update();

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            
            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "delete from VoteMaster where VoteNum = @j ";
            cmd.Parameters.AddWithValue("@j", GV.SelectedRow.Cells[0].Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //dt.Rows.RemoveAt(GV.SelectedRow.RowIndex);
            //GV.DataSource = dt;
            //GV.DataBind();

            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "delete from Vote1 where VoteNum = @k ";
            cmd.Parameters.AddWithValue("@k", GV.SelectedRow.Cells[0].Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "delete from Vote2 where VoteNum = @l ";
            cmd.Parameters.AddWithValue("@l", GV.SelectedRow.Cells[0].Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            display();
            update();

        }

    }
}
