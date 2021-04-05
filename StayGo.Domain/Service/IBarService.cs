using System.Collections.Generic;
using System.Threading.Tasks;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface IBarService
    {
        public Task<Bar> GetBarById(int id);
        public Task<IEnumerable<Bar>> GetBarsByName(string name);
        public Task<IEnumerable<Bar>> GetBarsByType(string type);
        public Task<IEnumerable<Bar>> GetBarsByLocation(string location);
        public Task<IEnumerable<Bar>> GetAllBars();

        public Task AddBar(Bar obj);
        public Task UpdateBar(Bar obj);
        public Task DeleteBar(int id);
    }
}