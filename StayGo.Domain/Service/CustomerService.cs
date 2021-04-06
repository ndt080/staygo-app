using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using StayGo.Domain.IRepository;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class CustomerService : ICustomerService
    {
        private readonly ICustomerRepository _customerRepository;

        public CustomerService(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        public async Task<Customer> GetCustomerById(int id)
        {
            return await Task.Run(() => _customerRepository.GetCustomer(id));
        }

        public Task<IEnumerable<Customer>> GetAllCustomers()
        {
            return Task.Run(() => _customerRepository.GetCustomerList());
        }

        public Task AddCustomer(Customer customer)
        {
            _customerRepository.Create(customer);
            return Task.CompletedTask;
        }

        public Task UpdateCustomer(Customer customer)
        {
            _customerRepository.Update(customer);
            return Task.CompletedTask;
        }

        public Task DeleteCustomer(int id)
        {
            _customerRepository.Delete(id);
            return Task.CompletedTask;
        }
    }
}