using System;
using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.IRepository
{
    public interface IBarRepository
    {
        IEnumerable<Bar> GetBarList();
        Bar GetBar(int id);
        void Create(Bar item);
        void Update(Bar item);
        void Delete(int id);
    }
}