using System.Collections.Generic;
using System.Threading.Tasks;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface ICustomerService
    {
        public Task<Customer> GetCustomerById(int id);
        public Task<List<Customer>> GetAllCustomers();

        public Task AddCustomer(Customer obj);
        public Task UpdateCustomer(Customer obj);
        public Task DeleteCustomer(int id);
    }
}