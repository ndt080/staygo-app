using System.Collections.Generic;

namespace StayGo.Domain.Service
{
    public interface IBarService<T>
    {
        internal T GetBarById(int id);
        internal List<T> GetBarsByName(string name);
        internal List<T> GetBarsByType(string type); 
        internal List<T> GetBarsByLocation(string location); 
        internal List<T> GetAllBars();

        internal void Save(string[] param);
        internal void Update(int id, string[] param);
        internal void Delete(int id);
    }
}