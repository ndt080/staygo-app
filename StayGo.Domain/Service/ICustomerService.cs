using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public interface ICustomerService
    {
        public CustomerDto GetCustomerById(int id);
        public List<CustomerDto> GetAllCustomers();

        public void AddCustomer(CustomerDto obj);
        public void UpdateCustomer(CustomerDto obj);
        public void DeleteCustomer(int id);
    }
}