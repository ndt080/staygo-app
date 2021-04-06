using System;
using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.IRepository
{
    public interface IBarRepository
    {
        Bar GetBar(int id);
        IEnumerable<Bar> GetAllBars();
        IEnumerable<Bar> GetBarsByName(string name);
        IEnumerable<Bar> GetBarsByType(string type);
        IEnumerable<Bar> GetBarsByLocation(string location);
        void Create(Bar item);
        void Update(Bar item);
        void Delete(int id);
    }
}