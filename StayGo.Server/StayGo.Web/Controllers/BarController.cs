using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace WebApplication.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BarController : ControllerBase
    {
        [HttpGet]
        [Route("ById/{id:int}")]
        public async Task<ActionResult<Object>> GetBarById(int id) 
        {
            //await
            return CreatedAtAction(nameof(GetBarById), new Object());
        }
        [HttpGet]
        [Route("ByName/{barName}")]
        public async Task<ActionResult<List<Object>>> GetBarsName(string barName)
        {
            
            //await
            //тут насколько я понимаю должно быть подключение к бд
            //и получение списка который и вернем но это дело пока не реализовано

            return CreatedAtAction(nameof(GetBarsName), new List<Object>());
        }

        [HttpGet]
        [Route("ByLocation/{barLoc}")]
        public async Task<ActionResult<List<Object>>> GetBarsLoc(string barLoc) // GeoCoordinates?
        {
            //await
            return CreatedAtAction(nameof(GetBarsLoc), new List<Object>());
        }
        [HttpGet]
        [Route("ByType/{barCuisineType}")]
        public async Task<ActionResult<List<Object>>> GetBarsType(string barCuisineType) 
        {
            //await 
            return CreatedAtAction(nameof(GetBarsType), new List<Object>());
        }
        [HttpGet]
        [Route("All")]
        public async Task<ActionResult<List<Object>>> GetBars() 
        {
            //await 
            return CreatedAtAction(nameof(GetBars), new List<Object>());
        }

        [HttpGet]
        [Route("Cuisine/{id:int}/{barName}")]
        public async Task<ActionResult<string>> GetBarCuisineType(int id, string barName)
        {
            return CreatedAtAction(nameof(GetBarCuisineType), new string("Cuisine"));
        }
        
        [HttpGet]
        [Route("Location/{id:int}/{barName}")]
        public async Task<ActionResult<string>> GetBarLocation(int id, string barName)
        {
            return CreatedAtAction(nameof(GetBarLocation), new string("Address"));
        }
        
        [HttpGet]
        [Route("Rate/{id:int}/{barName}")]
        public async Task<ActionResult<byte>> GetBarRating(int id, string barName)
        {
            return CreatedAtAction(nameof(GetBarRating), 5);
        }
        
        [HttpGet]
        [Route("AvgPaycheck/{id:int}/{barName}")]
        public async Task<ActionResult<string>> GetBarAvgPaycheck(int id, string barName)
        {
            return CreatedAtAction(nameof(GetBarAvgPaycheck), barName);
        }
        
        [HttpPost]
        [Route("upd/{id:int}")]
        public async void UpdateBar(int id, string[] param)
        {
            return;
        }

        [HttpPut]
        [Route("Save")]
        public async void SaveBar(string[] param)
        {
            return;
        }

        [HttpDelete]
        [Route("Delete")]
        public async void DeleteBar(int id)
        {
            return;
        }
    }
}