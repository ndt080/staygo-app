using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class CustomerService : ICustomerService<Customer>
    {
        private readonly ICustomerService<Customer> _customerServiceImplementation;

        public CustomerService(ICustomerService<Customer> customerServiceImplementation)
        {
            _customerServiceImplementation = customerServiceImplementation;
        }

        Customer ICustomerService<Customer>.GetCustomerById(int id)
        {
            return _customerServiceImplementation.GetCustomerById(id);
        }

        List<Customer> ICustomerService<Customer>.GetAllCustomers()
        {
            return _customerServiceImplementation.GetAllCustomers();
        }

        void ICustomerService<Customer>.Save(string[] param)
        {
            _customerServiceImplementation.Save(param);
        }

        void ICustomerService<Customer>.Update(int id, string[] param)
        {
            _customerServiceImplementation.Update(id, param);
        }

        void ICustomerService<Customer>.Delete(int id)
        {
            _customerServiceImplementation.Delete(id);
        }
    }
}