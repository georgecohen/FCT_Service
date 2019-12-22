using FCT_Service.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FCT_Service.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PurchasesController : ControllerBase
    {
        private readonly FctContext _context;

        public PurchasesController(FctContext context)
        {
            _context = context;
        }

        //// GET: api/Purchases
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Purchase>>> GetPurchases()
        //{
        //    return await _context.Purchases.ToListAsync();
        //}

        // GET: api/Purchases/5
        [HttpGet("{userid}")]
        public async Task<ActionResult<List<Purchase>>> GetPurchase(long userid)
        {
            var purchases = await _context.Purchases.Where(p => p.UserID == userid).OrderByDescending(o=>o.DateCreated).ToListAsync();

            if (purchases == null)
            {
                return NotFound();
            }

            purchases.ForEach(pc => {
                pc.Product = _context.Products.SingleOrDefault(p=>p.ID == pc.ProductID);
            });

            return purchases;
        }

        // PUT: api/Purchases/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPurchase(long id, Purchase purchase)
        {
            if (id != purchase.ID)
            {
                return BadRequest();
            }

            _context.Entry(purchase).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PurchaseExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Purchases
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<bool>> PostPurchase(List<Purchase> purchases)
        {
            purchases.ForEach(purchase => { 
                _context.Purchases.Add(new Purchase() { 
                    ProductID = purchase.ProductID,
                    UserID = purchase.UserID,
                    price = purchase.price,
                    Quantity = purchase.Quantity,
                    DateCreated = DateTime.Now
                });
            });
            await _context.SaveChangesAsync();

            return true;
        }

        // DELETE: api/Purchases/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Purchase>> DeletePurchase(long id)
        {
            var purchase = await _context.Purchases.FindAsync(id);
            if (purchase == null)
            {
                return NotFound();
            }

            _context.Purchases.Remove(purchase);
            await _context.SaveChangesAsync();

            return purchase;
        }

        private bool PurchaseExists(long id)
        {
            return _context.Purchases.Any(e => e.ID == id);
        }
    }
}
