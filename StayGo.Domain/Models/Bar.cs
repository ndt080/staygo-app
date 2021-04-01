using System.ComponentModel.DataAnnotations;

namespace StayGo.Domain.Models
{
    public class Bar
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        public string Description { get; set; }
        public string Type { get; set; } 
        public byte Rating { get; set; } 
        public double AvgPayCheck { get; set; } 
    }
}