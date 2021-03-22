using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface ICustomerService
    {
        public Customer GetCustomerById(int id);
        public List<Customer> GetAllCustomers();

        public void Save(string[] param);
        public void Update(int id, string[] param);
        public void Delete(int id);
    }
}