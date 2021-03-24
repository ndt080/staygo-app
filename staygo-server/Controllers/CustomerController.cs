using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace staygo_server.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        [HttpGet]
        [Route("CustomerByID/{id:int}")]
        public async Task<ActionResult<Object>> GetCustomerById(int id) 
        {
            //await
            return CreatedAtAction(nameof(GetCustomerById), new Object());
        }

        [HttpGet]
        [Route("Customers")]
        public async Task<ActionResult<List<Object>>> GetAllCustomers()
        {
            return CreatedAtAction(nameof(GetAllCustomers), new List<Object>());
        }
        
        [HttpPost]
        [Route("upd/{id:int}")]
        public async void UpdateCustomer(int id, string[] param)
        {
            return;
        }

        [HttpPut]
        [Route("Save")]
        public async void SaveCustomer(string[] param)
        {
            return;
        }

        [HttpDelete]
        [Route("Delete")]
        public async void DeleteCustomer(int id)
        {
            return;
        }
    }
}