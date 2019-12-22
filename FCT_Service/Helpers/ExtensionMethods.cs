using FCT_Service.Models;
using System.Collections.Generic;
using System.Linq;

namespace FCT_Service.Helpers
{
    public static class ExtensionMethods
    {
        public static IEnumerable<Customer> WithoutPasswords(this IEnumerable<Customer> users) {
            return users.Select(x => x.WithoutPassword());
        }

        public static Customer WithoutPassword(this Customer user) {
            user.Password = null;
            return user;
        }
    }
}