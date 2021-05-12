using System.ComponentModel.DataAnnotations;
using System.Device.Location;

namespace staygo_server.Models
{
    public class BarDto
    {
        [Required] public int Id { get; set; }
        [Required] public string Name { get; set; }
        public string Image { get; set; }
        public string Address { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string Rating { get; set; }
        public string AvgPayCheck { get; set; }
        public string LocationX { get; set; }
        public string LocationY { get; set; }
    }
}