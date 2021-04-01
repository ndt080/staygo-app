using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication.Models;

namespace WebApplication.Services
{
    public class CCustomerService : ICCustomerService
    {
        private ICCustomerService _icCustomerServiceImplementation;

        public async Task<CustomerDTO> GetCustomerById(int id)
        {
            CustomerDTO output = new CustomerDTO()
            {
                Id = -1, Name = "Test", DateBirth = new DateTime(2002, 7, 4, 6, 0, 0)
            };
            return output;
        }

        public Task<List<CustomerDTO>> GetAllCustomers()
        {
            return _icCustomerServiceImplementation.GetAllCustomers();
        }

        public Task Save(string[] param)
        {
            _icCustomerServiceImplementation.Save(param);
            return Task.CompletedTask;
        }

        public Task Update(int id, string[] param)
        {
            _icCustomerServiceImplementation.Update(id, param);
            return Task.CompletedTask;
        }

        public Task Delete(int id)
        {
            _icCustomerServiceImplementation.Delete(id);
            return Task.CompletedTask;
        }
    }
}