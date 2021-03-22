using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StayGo.Domain.Models;

namespace staygo_server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<Customer>> GetCustomerById(string barLoc) // GeoCoordinates?
        {
            //await
            return CreatedAtAction(nameof(GetCustomerById), new Customer());
        }

        [HttpGet]
        public async Task<ActionResult<List<Customer>>> GetAllCustomers()
        {
            return CreatedAtAction(nameof(GetAllCustomers), new List<Customer>());
        }
        
        [HttpPost]
        public async void UpdateCustomer(int id, string[] param)//
        {
            return;
        }

        [HttpPut]
        public async void SaveCustomer(string[] param)
        {
            return;
        }

        [HttpDelete]
        public async void DeleteCustomer(int id)
        {
            return;
        }
    }
}