using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using StayGo.Domain.Models;
using StayGo.Domain.Service;
using staygo_server.Models;

namespace staygo_server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        [HttpGet]
        [Route("GetByID")]
        public async Task<IActionResult> GetCustomerById(int id)
        {
            if (id < 0)
            {
                return BadRequest();
            }
            var output = await _customerService.GetCustomerById(id);
            return Ok(output);
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<IActionResult> GetAllCustomers()
        {
            var output = await _customerService.GetAllCustomers();
            if (output == null)
                NotFound();
            return Ok(output);
        }

        [HttpPut]
        [Route("Update")]
        public async Task<IActionResult> UpdateCustomer(CustomerDto obj)
        {
            if (!ModelState.IsValid || obj == null || obj.Id < 0)
            {
                return BadRequest(ModelState);
            }

            var input = new Customer
            {
                Id = obj.Id,
                Name = obj.Name,
                Avatar = obj.Avatar,
                DateBirth = obj.DateBirth
            };

            await _customerService.UpdateCustomer(input);
            return Ok();
        }

        [HttpPost]
        [Route("Add")]
        public async Task<IActionResult> AddCustomer(CustomerDto obj)
        {
            if (!ModelState.IsValid || obj == null || obj.Id < 0)
            {
                return BadRequest(ModelState);
            }

            var input = new Customer
            {
                Id = obj.Id,
                Name = obj.Name,
                Avatar = obj.Avatar,
                DateBirth = obj.DateBirth
            };

            await _customerService.AddCustomer(input);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            if (id < 0)
            {
                return BadRequest();
            }
            await _customerService.DeleteCustomer(id);
            return Ok();
        }
    }
}