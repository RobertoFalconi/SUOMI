using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SUOMI.BE
{
    public class User
    {
        public static int STM32 { get; set; }

        public int Id { get; set; }
        public String Nickname { get; set; }
        public String Password { get; set; }
        public String Gender { get; set; }
        public int Age { get; set; }
        public double Weight { get; set; }
        public double Height { get; set; }
        public double Heart_rate { get; set; }
        public double BMI { get; set; }
        public static User UtenteCorrente { get; set; }

        

        public User()
        {

        }

        public User(String Nickname, String Password)
        {
            this.Nickname = Nickname;
            this.Password = Password;
        }

        public User(String gender, int age, double height, double weight, double heart_rate)
        {
            this.Gender = gender;
            this.Age = age;
            this.Height = height;
            this.Weight = weight;
            this.Heart_rate = heart_rate;
        }

        public User(int id, String nickname, String password, String gender, int age, double height, double weight, double heart_rate)
        {
            this.Id = id;
            this.Nickname = nickname;
            this.Password = password;
            this.Gender = gender;
            this.Age = age;
            this.Height = height;
            this.Weight = weight;
            this.Heart_rate = heart_rate;
        }

    }
}
