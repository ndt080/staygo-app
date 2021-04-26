using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.IRepository
{
    public interface ICustomerRepository
    {
        IEnumerable<Customer> GetCustomerList();
        Customer GetCustomer(int id);
        void Create(Customer item);
        void Update(Customer item);
        void Delete(int id);
    }
}