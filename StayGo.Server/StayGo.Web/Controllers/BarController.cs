using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication.Services;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BarController : ControllerBase
    {
        private readonly ICBarService _barService;

        public BarController(ICBarService barService)
        {
            _barService = barService;
        }

        [HttpGet]
        [Route("ById")]
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

            //await
            return Ok(output);
        }

        [HttpGet]
        [Route("ByName")]
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
        [Route("ByLocation")]
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
        [Route("ByType")]
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
        [Route("All")]
        public async Task<IActionResult> GetBars()
        {
            var output = await _barService.GetAllBars();
            if (output == null)
            {
                return NotFound();
            }

            return Ok(output);
        }

        [HttpGet]
        [Route("Cuisine")]
        public async Task<IActionResult> GetBarCuisineType(int id, string barName)
        {
            if (barName == null)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            var output = await _barService.GetBarById(id);

            if (output == null || output.Name != barName)
            {
                return NotFound();
            }

            return Ok(output.Type);
        }

        [HttpGet]
        [Route("Location")]
        public async Task<IActionResult> GetBarLocation(int id, string barName)
        {
            if (barName == null)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            var output = await _barService.GetBarById(id);

            if (output == null || output.Name != barName)
            {
                return NotFound();
            }

            return Ok(output.Address);
        }

        [HttpGet]
        [Route("Rate")]
        public async Task<IActionResult> GetBarRating(int id, string barName)
        {
            if (barName == null)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            var output = await _barService.GetBarById(id);

            if (output == null || output.Name != barName)
            {
                return NotFound();
            }

            return Ok(output.Rating);
        }

        [HttpGet]
        [Route("AvgPaycheck")]
        public async Task<IActionResult> GetBarAvgPaycheck(int id, string barName)
        {
            if (barName == null)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            var output = await _barService.GetBarById(id);

            if (output == null || output.Name != barName)
            {
                return NotFound();
            }

            return Ok(output.AvgPayCheck);
        }

        [HttpGet]
        [Route("Description")]
        public async Task<IActionResult> GetBarDescription(int id, string barName)
        {
            if (barName == null)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            var output = await _barService.GetBarById(id);

            if (output == null || output.Name != barName)
            {
                return NotFound();
            }

            return Ok(output.Description);
        }

        [HttpPost]
        [Route("upd")]
        public async Task<IActionResult> UpdateBar(int id, string[] param)
        {
            if (param.Length != 7)
            {
                return BadRequest();
            }

            if (id < 0)
            {
                return NotFound();
            }

            await _barService.Save(param);
            return Ok();
        }

        [HttpPut]
        [Route("Save")]
        public async Task<IActionResult> SaveBar(string[] param)
        {
            if (param.Length != 7)
            {
                return BadRequest();
            }

            await _barService.Save(param);
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

            await _barService.Delete(id);
            return Ok();
        }
    }
}