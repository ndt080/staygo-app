using System.Collections.Generic;

namespace StayGo.Domain.Service
{
    public interface ICustomerService<T>
    {
        internal T GetCustomerById(int id);
        internal List<T> GetAllCustomers();

        internal void Save(string[] param);
        internal void Update(int id, string[] param);
        internal void Delete(int id);
    }
}