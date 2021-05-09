using System.Collections.Generic;
using System.Device.Location;
using System.Threading.Tasks;
using StayGo.Domain.IRepository;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class BarService : IBarService
    {
        private readonly IBarRepository _barRepository;

        public BarService(IBarRepository barRepository)
        {
            _barRepository = barRepository;
        }

        public Task<Bar> GetBarById(int id)
        {
            return Task.Run(() => _barRepository.GetBar(id));
        }
        
        public Task<IEnumerable<Bar>> GetAllBars()
        {
            return Task.Run(() => _barRepository.GetAllBars());
        }

        public Task<IEnumerable<Bar>> GetBarsByName(string name)
        {
            return Task.Run(() => _barRepository.GetAllBars());
        }

        public Task<IEnumerable<Bar>> GetBarsByType(string type)
        {
            return Task.Run(() => _barRepository.GetBarsByType(type));
        }

        public Task<IEnumerable<Bar>> GetBarsByLocation(GeoCoordinate location)
        {
            return Task.Run(() => _barRepository.GetBarsByLocation(location));
        }

        public Task AddBar(Bar obj)
        {
            _barRepository.Create(obj);
            return Task.CompletedTask;
        }

        public Task UpdateBar(Bar obj)
        {
            _barRepository.Update(obj);
            return Task.CompletedTask;
        }

        public Task DeleteBar(int id)
        {
            _barRepository.Delete(id);
            return Task.CompletedTask;
        }
    }
}