using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class CustomerService : ICustomerService
    {
        public Customer GetCustomerById(int id)
        {
            return new Customer();
        }

        public List<Customer> GetAllCustomers()
        {
            return new List<Customer>();
        }

        public void Save(string[] param)
        {

        }

        public void Update(int id, string[] param)
        {

        }

        public void Delete(int id)
        {

        }
    }
}