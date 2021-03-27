using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class BarService : IBarService
    {
        public Bar GetBarById(int id)
        {
            return new Bar();
        }

        public List<Bar> GetBarsByName(string name)
        {
            return new List<Bar>();
        }

        public List<Bar> GetBarsByType(string type)
        {
            return new List<Bar>();
        }

        public List<Bar> GetBarsByLocation(string location)
        {
            return new List<Bar>();
        }

        public List<Bar> GetAllBars()
        {
            return new List<Bar>();
        }

        public void Save(string[] param)
        {

        }

        public void Update(int id, string[] param)
        {
            
        }

        public void Delete(int id)
        {

        }
    }
}