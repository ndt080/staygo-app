using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface IBarService
    {
        public Bar GetBarById(int id);
        public List<Bar> GetBarsByName(string name);
        public List<Bar> GetBarsByType(string type); 
        public List<Bar> GetBarsByLocation(string location); 
        public List<Bar> GetAllBars();

        public void Save(string[] param);
        public void Update(int id, string[] param);
        public void Delete(int id);
    }
}