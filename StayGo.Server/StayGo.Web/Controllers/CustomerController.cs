using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication.Models;
using WebApplication.Services;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICCustomerService _customerService;

        public CustomerController(ICCustomerService customerService)
        {
            _customerService = customerService;
        }

        [HttpGet]
        [Route("CustomerByID")]
        public async Task<IActionResult> GetCustomerById(int id)
        {
            if (id < 0)
            {
                return NotFound();
            }

            var output = await _customerService.GetCustomerById(id);

            return Ok(output);
        }

        [HttpGet]
        [Route("Customers")]
        public async Task<IActionResult> GetAllCustomers()
        {
            var output = await _customerService.GetAllCustomers();
            if (output[0] == null)
                NotFound();
            return Ok(output);
        }

        [HttpPost]
        [Route("upd")]
        public async Task<IActionResult> UpdateCustomer(int id, string[] param)
        {
            if (param.Length != 3)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            await _customerService.Update(id, param);
            return Ok();
        }

        [HttpPut]
        [Route("Save")]
        public async Task<IActionResult> SaveCustomer(string[] param)
        {
            if (param.Length != 3)
            {
                return BadRequest();
            }

            await _customerService.Save(param);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            if (id < 0)
            {
                return NotFound();
            }

            await _customerService.Delete(id);
            return Ok();
        }
    }
}