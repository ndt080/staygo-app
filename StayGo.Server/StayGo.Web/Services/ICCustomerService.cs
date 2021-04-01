using System.Collections.Generic;
using System.Threading.Tasks;
using WebApplication.Models;

namespace WebApplication.Services
{
    public interface ICCustomerService
    {
        public Task<CustomerDTO> GetCustomerById(int id);
        public Task<List<CustomerDTO>> GetAllCustomers();

        public Task Save(string[] param);
        public Task Update(int id, string[] param);
        public Task Delete(int id);
    }
}