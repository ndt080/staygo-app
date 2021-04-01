using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class BarService : IBarService
    {
        public BarDto GetBarById(int id)
        {
            return new BarDto();
        }

        public List<BarDto> GetBarsByName(string name)
        {
            return new List<BarDto>();
        }

        public List<BarDto> GetBarsByType(string type)
        {
            return new List<BarDto>();
        }

        public List<BarDto> GetBarsByLocation(string location)
        {
            return new List<BarDto>();
        }

        public List<BarDto> GetAllBars()
        {
            return new List<BarDto>();
        }

        public void AddBar(BarDto obj)
        {

        }

        public void UpdateBar(BarDto obj)
        {
            
        }

        public void DeleteBar(int id)
        {

        }
    }
}