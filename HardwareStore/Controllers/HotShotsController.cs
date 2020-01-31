using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;

namespace HardwareStore.Controllers
{
    public class HotShotsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HotShotsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: HotShots
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.HotShots.Include(h => h.Product);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: HotShots/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hotShot = await _context.HotShots
                .Include(h => h.Product)
                .FirstOrDefaultAsync(m => m.HotShotId == id);
            if (hotShot == null)
            {
                return NotFound();
            }

            return View(hotShot);
        }

        // GET: HotShots/Create
        public IActionResult Create()
        {
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Name");
            return View();
        }

        // POST: HotShots/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("HotShotId,ProductId,NewPrice,Quantity,ItemsSold,StartDate,EndDate,HasEnded")] HotShot hotShot)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hotShot);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Name", hotShot.ProductId);
            return View(hotShot);
        }

        // GET: HotShots/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hotShot = await _context.HotShots.FindAsync(id);
            if (hotShot == null)
            {
                return NotFound();
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Name", hotShot.ProductId);
            return View(hotShot);
        }

        // POST: HotShots/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("HotShotId,ProductId,NewPrice,Quantity,ItemsSold,StartDate,EndDate,HasEnded")] HotShot hotShot)
        {
            if (id != hotShot.HotShotId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hotShot);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HotShotExists(hotShot.HotShotId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Name", hotShot.ProductId);
            return View(hotShot);
        }

        // GET: HotShots/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hotShot = await _context.HotShots
                .Include(h => h.Product)
                .FirstOrDefaultAsync(m => m.HotShotId == id);
            if (hotShot == null)
            {
                return NotFound();
            }

            return View(hotShot);
        }

        // POST: HotShots/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var hotShot = await _context.HotShots.FindAsync(id);
            _context.HotShots.Remove(hotShot);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HotShotExists(int id)
        {
            return _context.HotShots.Any(e => e.HotShotId == id);
        }
    }
}
