using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class BarService : IBarService
    {
        Bar IBarService.GetBarById(int id)
        {
            return new Bar();
        }

        List<Bar> IBarService.GetBarsByName(string name)
        {
            return new List<Bar>();
        }

        List<Bar> IBarService.GetBarsByType(string type)
        {
            return new List<Bar>();
        }

        List<Bar> IBarService.GetBarsByLocation(string location)
        {
            return new List<Bar>();
        }

        List<Bar> IBarService.GetAllBars()
        {
            return new List<Bar>();
        }

        void IBarService.Save(string[] param)
        {

        }

        void IBarService.Update(int id, string[] param)
        {
            
        }

        void IBarService.Delete(int id)
        {

        }
    }
}