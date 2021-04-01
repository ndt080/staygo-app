using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface IBarService
    {
        public BarDto GetBarById(int id);
        public List<BarDto> GetBarsByName(string name);
        public List<BarDto> GetBarsByType(string type); 
        public List<BarDto> GetBarsByLocation(string location); 
        public List<BarDto> GetAllBars();

        public void AddBar(BarDto obj);
        public void UpdateBar(BarDto obj);
        public void DeleteBar(int id);
    }
}