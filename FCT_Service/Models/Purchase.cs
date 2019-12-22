using System;

namespace FCT_Service.Models
{
    public class Purchase
    {
        public long ID { get; set; }
        public long UserID { get; set; }
        public long ProductID { get; set; }
        public int Quantity { get; set; }

        public decimal price { get; set; }
        public Product Product { get; set; }

        public DateTime? DateCreated { get; set; }
    }
}
