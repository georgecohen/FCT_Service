using Microsoft.EntityFrameworkCore;

namespace FCT_Service.Models
{
    public class FctContext : DbContext
    {
        public FctContext(DbContextOptions<FctContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Purchase> Purchases { get; set; }

    }
}
