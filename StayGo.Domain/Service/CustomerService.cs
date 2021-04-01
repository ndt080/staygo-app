using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class CustomerService : ICustomerService
    {
        public CustomerDto GetCustomerById(int id)
        {
            return new CustomerDto();
        }

        public List<CustomerDto> GetAllCustomers()
        {
            return new List<CustomerDto>();
        }

        public void AddCustomer(CustomerDto obj)
        {
            throw new System.NotImplementedException();
        }

        public void UpdateCustomer(CustomerDto obj)
        {

        }

        public void DeleteCustomer(int id)
        {
            throw new System.NotImplementedException();
        }
        
    }
}