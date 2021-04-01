using System.Collections.Generic;
using System.Threading.Tasks;
using WebApplication.Models;

namespace WebApplication.Services
{
    public class CBarService : ICBarService
    {
        private ICBarService _icBarServiceImplementation;

        public Task<BarDTO> GetBarById(int id)
        {
            return _icBarServiceImplementation.GetBarById(id);
        }

        public Task<List<BarDTO>> GetBarsByName(string name)
        {
            return _icBarServiceImplementation.GetBarsByName(name);
        }

        public Task<List<BarDTO>> GetBarsByType(string type)
        {
            return _icBarServiceImplementation.GetBarsByType(type);
        }

        public Task<List<BarDTO>> GetBarsByLocation(string location)
        {
            return _icBarServiceImplementation.GetBarsByLocation(location);
        }

        public Task<List<BarDTO>> GetAllBars()
        {
            return _icBarServiceImplementation.GetAllBars();
        }

        public Task Save(string[] param)
        {
            _icBarServiceImplementation.Save(param);
            return Task.CompletedTask;
        }

        public Task Update(int id, string[] param)
        {
            _icBarServiceImplementation.Update(id, param);
            return Task.CompletedTask;
        }

        public Task Delete(int id)
        {
            _icBarServiceImplementation.Delete(id);
            return Task.CompletedTask;
        }
    }
}