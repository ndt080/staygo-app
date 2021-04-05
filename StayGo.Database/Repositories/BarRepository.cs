using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using StayGo.Database.Context;
using StayGo.Domain.IRepository;
using StayGo.Domain.Models;

namespace StayGo.Database.Repositories
{
    public class BarRepository : IBarRepository
    {
        private readonly BaseContext _db;
        public BarRepository(BaseContext db) 
        {
            _db = db;
        }

        public IEnumerable<Bar> GetAllBars()
        {
            return _db.Bars;
        }

        public IEnumerable<Bar> GetBarsByName(string name)
        {
            return _db.Bars.Where(b => b.Name == name);
        }

        public IEnumerable<Bar> GetBarsByType(string type)
        {
            return _db.Bars.Where(b => b.Type == type);
        }

        public IEnumerable<Bar> GetBarsByLocation(string location)
        {
            return _db.Bars.Where(b => b.Address == location);
        }

        public Bar GetBar(int id)
        {
            return _db.Bars.Find(id);
        }

        public void Create(Bar item)
        {
            _db.Bars.Add(item);
            Save();
        }

        public void Update(Bar item)
        {
            _db.Entry(item).State = item.Id == 0 ?
                EntityState.Added :
                EntityState.Modified;
            Save();
        }

        public void Delete(int id)
        {
            Bar bar = _db.Bars.Find(id);
            if (bar != null)
                _db.Bars.Remove(bar);
        }

        private void Save()
        {
            _db.SaveChanges();
        }
    }
}