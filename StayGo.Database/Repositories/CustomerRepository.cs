using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using StayGo.Database.Context;
using StayGo.Domain.IRepository;
using StayGo.Domain.Models;

namespace StayGo.Database.Repositories
{
    public class CustomerRepository: ICustomerRepository
    {
        private readonly BaseContext _db;
        public CustomerRepository(BaseContext db)
        {
            _db = db;
        }

        public IEnumerable<Customer> GetCustomerList()
        {
            return _db.Customers;
        }

        public Customer GetCustomer(int id)
        {
            return _db.Customers.Find(id);
        }

        public void Create(Customer item)
        {
            _db.Customers.Add(item);
            Save();
        }

        public void Update(Customer item)
        {
            _db.Entry(item).State = item.Id == 0 ?
                EntityState.Added :
                EntityState.Modified;
            Save();
        }

        public void Delete(int id)
        {
            Customer customer = _db.Customers.Find(id);
            if (customer != null)
            {
                _db.Customers.Remove(customer);
                Save();   
            }
        }

        private void Save()
        {
            _db.SaveChanges();
        }
    }
}