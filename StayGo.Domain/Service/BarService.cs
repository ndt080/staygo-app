using System.Collections.Generic;
using System.Threading.Tasks;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class BarService : IBarService
    {
        public Task<Bar> GetBarById(int id)
        {
            throw new System.NotImplementedException();
        }

        public Task<List<Bar>> GetBarsByName(string name)
        {
            throw new System.NotImplementedException();
        }

        public Task<List<Bar>> GetBarsByType(string type)
        {
            throw new System.NotImplementedException();
        }

        public Task<List<Bar>> GetBarsByLocation(string location)
        {
            throw new System.NotImplementedException();
        }

        public Task<List<Bar>> GetAllBars()
        {
            throw new System.NotImplementedException();
        }

        public Task AddBar(Bar obj)
        {
            throw new System.NotImplementedException();
        }

        public Task UpdateBar(Bar obj)
        {
            throw new System.NotImplementedException();
        }

        public Task DeleteBar(int id)
        {
            throw new System.NotImplementedException();
        }
    }
}