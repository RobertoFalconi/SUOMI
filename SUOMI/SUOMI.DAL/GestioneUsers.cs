using SUOMI.BE;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SUOMI.DAL
{
    public class GestioneUsers
    {
        public static SqlConnection Connetti()
        {
            string connectionString = "Data Source=AC-RFALCONI\\SQLEXPRESS;Initial Catalog=SUOMI;Integrated Security=True";
            return new SqlConnection(connectionString);
        }
        public static void InsertUser(User userDaInserire)
        {
            SqlConnection conn = Connetti();

            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = conn;
                command.Parameters.AddWithValue("@Nickname", userDaInserire.Nickname);
                command.Parameters.AddWithValue("@Password", userDaInserire.Password);

                command.CommandText = "INSERT INTO Users (Nickname, Password) VALUES (@Nickname, @Password)";
                command.ExecuteNonQuery();

                conn.Close();
            }
        }
        public static void InsertUserData(User userDaInserire)
        {
            SqlConnection conn = Connetti();

            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = conn;
                command.Parameters.AddWithValue("@Nickname", userDaInserire.Nickname);
                command.Parameters.AddWithValue("@Gender", userDaInserire.Gender);
                command.Parameters.AddWithValue("@Age", userDaInserire.Age);
                command.Parameters.AddWithValue("@Height", userDaInserire.Height);
                command.Parameters.AddWithValue("@Weight", userDaInserire.Weight);
                command.Parameters.AddWithValue("@Heart_rate", userDaInserire.Heart_rate);

                command.CommandText = "UPDATE Users SET Gender = @Gender, Age = @Age, Height = @Height, Weight = @Weight, " +
                    "Heart_rate = @Heart_rate WHERE Nickname = @Nickname";
                command.ExecuteNonQuery();

                conn.Close();
            }
        }
        public static User GetUser(String Nickname)
        {
            SqlConnection conn = Connetti();

            string query = "SELECT * FROM Users WHERE Users.Nickname = '" + Nickname + "'";

            User userDaRestituire = null;

            SqlDataReader reader;
            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand(query);
                command.Connection = conn;
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    int id = (int)reader["Id"];
                    string nickname = reader["Nickname"]?.ToString();
                    string password = reader["Password"]?.ToString();
                    string gender = reader["Gender"]?.ToString();
                    int age = (int)reader["Age"];
                    double height = (double)reader["Height"];
                    double weight = (double)reader["Weight"];
                    double heart_rate = (double)reader["Heart_rate"];

                    userDaRestituire = new User(id, nickname, password, gender, age, height, weight, heart_rate);
                }
                reader.Close();
                conn.Close();
            }

            return userDaRestituire;
        }
    }

    
}
