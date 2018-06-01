using SUOMI.BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SUOMI.UIConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            User Gino = new User("Male", 25, 180, 72, 80);
            BLL.GestioneUsers.InsertUserData(Gino);
        }
    }
}
