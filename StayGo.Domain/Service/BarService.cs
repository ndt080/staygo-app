using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class BarService : IBarService<Bar>
    {
        private readonly IBarService<Bar> _barServiceImplementation;

        public BarService(IBarService<Bar> barServiceImplementation)
        {
            _barServiceImplementation = barServiceImplementation;
        }

        Bar IBarService<Bar>.GetBarById(int id)
        {
            return _barServiceImplementation.GetBarById(id);
        }

        List<Bar> IBarService<Bar>.GetBarsByName(string name)
        {
            return _barServiceImplementation.GetBarsByName(name);
        }

        List<Bar> IBarService<Bar>.GetBarsByType(string type)
        {
            return _barServiceImplementation.GetBarsByType(type);
        }

        List<Bar> IBarService<Bar>.GetBarsByLocation(string location)
        {
            return _barServiceImplementation.GetBarsByLocation(location);
        }

        List<Bar> IBarService<Bar>.GetAllBars()
        {
            return _barServiceImplementation.GetAllBars();
        }

        void IBarService<Bar>.Save(string[] param)
        {
            _barServiceImplementation.Save(param);
        }

        void IBarService<Bar>.Update(int id, string[] param)
        {
            _barServiceImplementation.Update(id, param);
        }

        void IBarService<Bar>.Delete(int id)
        {
            _barServiceImplementation.Delete(id);
        }
    }
}