using System.Collections.Generic;
using System.Threading.Tasks;
using WebApplication.Models;

namespace WebApplication.Services
{
    public interface ICBarService
    {
        public Task<BarDTO> GetBarById(int id);
        public Task<List<BarDTO>> GetBarsByName(string name);
        public Task<List<BarDTO>> GetBarsByType(string type);
        public Task<List<BarDTO>> GetBarsByLocation(string location);
        public Task<List<BarDTO>> GetAllBars();

        public Task Save(string[] param);
        public Task Update(int id, string[] param);
        public Task Delete(int id);
    }
}