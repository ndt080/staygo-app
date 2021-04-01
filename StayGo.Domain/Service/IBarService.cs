using System.Collections.Generic;
using System.Threading.Tasks;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface IBarService
    {
        public Task<Bar> GetBarById(int id);
        public Task<List<Bar>> GetBarsByName(string name);
        public Task<List<Bar>> GetBarsByType(string type);
        public Task<List<Bar>> GetBarsByLocation(string location);
        public Task<List<Bar>> GetAllBars();

        public Task AddBar(Bar obj);
        public Task UpdateBar(Bar obj);
        public Task DeleteBar(int id);
    }
}