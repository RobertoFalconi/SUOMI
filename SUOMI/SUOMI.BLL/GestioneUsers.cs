using SUOMI.BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SUOMI.BLL
{
    public class GestioneUsers
    {
        public static void InsertUser(User userDaInserire)
        {
            DAL.GestioneUsers.InsertUser(userDaInserire);
        }
        public static void InsertUserData(User userDaInserire)
        {
            DAL.GestioneUsers.InsertUserData(userDaInserire);
        }
        public static User GetUser(String nickname)
        {
            return DAL.GestioneUsers.GetUser(nickname);
        }
    }
}
