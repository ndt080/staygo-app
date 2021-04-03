using System;
using System.Collections.Generic;
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

        public IEnumerable<Bar> GetBarList()
        {
            return _db.Bars;
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
            _db.Entry(item).State = EntityState.Modified;
        }

        public void Delete(int id)
        {
            Bar bar = _db.Bars.Find(id);
            if (bar != null)
                _db.Bars.Remove(bar);
        }
        public void Save()
        {
            _db.SaveChanges();
        }
    }
}