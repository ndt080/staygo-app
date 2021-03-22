using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StayGo.Domain.Models;
using StayGo.Domain.Service;
using StayGo.Domain.Repository;
//using System.Device.Location //?
namespace staygo_server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BarController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<Bar>> GetBarById(string barLoc) // GeoCoordinates?
        {
            //await
            return CreatedAtAction(nameof(GetBarById), new Bar());
        }
        [HttpGet]
        public async Task<ActionResult<List<Bar>>> GetBarsName(string barName)
        {
            
            //await
            //тут насколько я понимаю должно быть подключение к бд
            //и получение списка который и вернем но это дело пока не реализовано

            return CreatedAtAction(nameof(GetBarsName), new List<Bar>());
        }

        [HttpGet]
        public async Task<ActionResult<List<Bar>>> GetBarsLoc(string barLoc) // GeoCoordinates?
        {
            //await
            return CreatedAtAction(nameof(GetBarsLoc), new List<Bar>());
        }
        [HttpGet]
        public async Task<ActionResult<List<Bar>>> GetBarsType(string barCuisineType) 
        {
            //await 
            return CreatedAtAction(nameof(GetBarsType), new List<Bar>());
        }
        [HttpGet] 
        public async Task<ActionResult<List<Bar>>> GetBars() 
        {
            //await 
            return CreatedAtAction(nameof(GetBars), new List<Bar>());
        }

        [HttpPost]
        public async void UpdateBar(int id, string[] param)//
        {
            return;
        }

        [HttpPut]
        public async void SaveBar(string[] param)
        {
            return;
        }

        [HttpDelete]
        public async void DeleteBar(int id)
        {
            return;
        }
    }
}