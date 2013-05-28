using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace eProject_SEM3_G1.Utilities.Cryptography
{
    public class MD5Encrypt
    {

        public static string GetMd5(string str)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));
            StringBuilder sbuider = new StringBuilder();
            foreach (byte b in bHash)
            {
                sbuider.Append(String.Format("{0:x2}",b));
            }
            return sbuider.ToString();
        }
    }
}