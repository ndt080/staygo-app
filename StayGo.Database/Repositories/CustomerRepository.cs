using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using StayGo.Database.Context;
using StayGo.Domain.Models;

namespace StayGo.Database.Repositories
{
    public class CustomerRepository: ICustomerRepository
    {
        private BaseContext _db;
        private bool _disposed = false;

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
        }

        public void Update(Customer item)
        {
            _db.Entry(item).State = EntityState.Modified;
        }

        public void Delete(int id)
        {
            Customer customer = _db.Customers.Find(id);
            if (customer != null)
                _db.Customers.Remove(customer);
        }
        
        public void Save()
        {
            _db.SaveChanges();
        }

        public virtual void Dispose(bool disposing)
        {
            if(!_disposed)
            {
                if(disposing)
                {
                    _db.Dispose();
                }
            }
            _disposed = true;
        }
 
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}