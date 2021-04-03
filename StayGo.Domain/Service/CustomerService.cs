using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using StayGo.Domain.IRepository;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class CustomerService : ICustomerService
    {
        private ICustomerRepository _customerRepository;

        public async Task<Customer> GetCustomerById(int id)
        {
            var output = new Customer()
            {
                Id = -1, Name = "Test", DateBirth = new DateTime(2002, 7, 4, 6, 0, 0)
            };
            return await Task.Run(() => output);
        }

        public Task<List<Customer>> GetAllCustomers()
        {
            throw new System.NotImplementedException();
        }

        public Task AddCustomer(Customer customer)
        {
            return Task.CompletedTask;
        }

        public Task UpdateCustomer(Customer customer)
        {
            return Task.CompletedTask;
        }

        public Task DeleteCustomer(int id)
        {
            return Task.CompletedTask;
        }
    }
}