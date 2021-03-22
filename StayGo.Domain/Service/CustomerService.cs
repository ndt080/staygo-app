using System.Collections.Generic;
using StayGo.Domain.Models;

namespace StayGo.Domain.Service
{
    public class CustomerService : ICustomerService
    {

        Customer ICustomerService.GetCustomerById(int id)
        {
            return new Customer();
        }

        List<Customer> ICustomerService.GetAllCustomers()
        {
            return new List<Customer>();
        }

        void ICustomerService.Save(string[] param)
        {

        }

        void ICustomerService.Update(int id, string[] param)
        {

        }

        void ICustomerService.Delete(int id)
        {

        }
    }
}