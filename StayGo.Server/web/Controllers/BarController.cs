using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using StayGo.Domain.Models;
using StayGo.Domain.Service;
using staygo_server.Models;

namespace staygo_server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BarController : ControllerBase
    {
        private readonly IBarService _barService;

        public BarController(IBarService barService)
        {
            _barService = barService;
        }

        [HttpGet]
        [Route("GetById")]
        public async Task<IActionResult> GetBarById(int id)
        {
            if (id < 0)
            {
                return NotFound();
            }

            var output = await _barService.GetBarById(id);
            if (output == null)
            {
                NotFound();
            }

            return Ok(output);
        }

        [HttpGet]
        [Route("GetByName")]
        public async Task<IActionResult> GetBarsName(string barName)
        {
            if (barName == null)
            {
                return BadRequest();
            }

            var output = await _barService.GetBarsByName(barName);
            if (output == null)
            {
                return NotFound();
            }

            return Ok(output);
        }

        [HttpGet]
        [Route("GetByLocation")]
        public async Task<IActionResult> GetBarsLoc(string barLoc) // GeoCoordinates?
        {
            if (barLoc == null)
            {
                return BadRequest();
            }

            var output = await _barService.GetBarsByLocation(barLoc);
            if (output == null)
            {
                return NotFound();
            }

            return Ok(output);
        }

        [HttpGet]
        [Route("GetByType")]
        public async Task<IActionResult> GetBarsType(string barCuisineType)
        {
            if (barCuisineType == null)
            {
                return BadRequest();
            }

            var output = await _barService.GetBarsByType(barCuisineType);
            if (output == null)
            {
                return NotFound();
            }

            return Ok(output);
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<IActionResult> GetBars()
        {
            var output = await _barService.GetAllBars();
            if (output == null)
            {
                return NotFound();
            }

            return Ok(output);
        }

        [HttpPost]
        [Route("Update")]
        public async Task<IActionResult> UpdateBar(BarDto obj)
        {
            if (!ModelState.IsValid || obj == null || obj.Id < 0)
            {
                return BadRequest(ModelState);
            }

            var input = new Bar
            {
                Id = obj.Id,
                Name = obj.Name,
                Address = obj.Address,
                Description = obj.Description,
                Type = obj.Type,
                Rating = obj.Rating,
                AvgPayCheck = obj.AvgPayCheck
            };

            await _barService.AddBar(input);
            return Ok();
        }

        [HttpPut]
        [Route("Add")]
        public async Task<IActionResult> AddBar(BarDto obj)
        {
            if (!ModelState.IsValid || obj == null || obj.Id < 0)
            {
                return BadRequest(ModelState);
            }

            var input = new Bar
            {
                Id = obj.Id,
                Name = obj.Name,
                Address = obj.Address,
                Description = obj.Description,
                Type = obj.Type,
                Rating = obj.Rating,
                AvgPayCheck = obj.AvgPayCheck
            };

            await _barService.AddBar(input);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        public async Task<IActionResult> DeleteBar(int id)
        {
            if (id < 0)
            {
                return NotFound();
            }

            await _barService.DeleteBar(id);
            return Ok();
        }
    }
}