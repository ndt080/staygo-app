using System;
using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Database.Repositories
{
    interface IBarRepository : IDisposable
    {
        IEnumerable<Bar> GetBarList();
        Bar GetBar(int id);
        void Create(Bar item);
        void Update(Bar item);
        void Delete(int id);
    }
}