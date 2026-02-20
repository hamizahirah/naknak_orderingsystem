using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAKNAK
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private bool IsUserExists(string username)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string checkSql = "SELECT COUNT(*) FROM UserAccounts WHERE username = @username";
                using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                {
                    checkCmd.Parameters.AddWithValue("@username", username);
                    try
                    {
                        conn.Open();
                        int count = (int)checkCmd.ExecuteScalar();
                        return count > 0;
                    }
                    catch (SqlException)
                    {
                        return false;
                    }
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // First check if user exists
            if (IsUserExists(txtUsername.Text))
            {
                lblStatus.Text = "Status: This email is already registered. Please use a different email.";
                return;
            }

            string password = txtPassword.Text;
            PBKDF2Hash hash = new PBKDF2Hash(password);
            string passwordHash = hash.HashedPassword;
            bool enabled = true;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string sql = @"INSERT INTO UserAccounts VALUES (@username, @passwordhash, @role, @enabled)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@passwordhash", passwordHash);
            cmd.Parameters.AddWithValue("@role", "user");
            cmd.Parameters.AddWithValue("@enabled", enabled);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblStatus.Text = "Status: Data successfully saved.";
            }
            catch (SqlException ex)
            {
                lblStatus.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}