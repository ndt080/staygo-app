namespace StayGo.Domain.Models
{
    public class BarDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Description { get; set; }
        public string Type { get; set; } 
        public byte Rating { get; set; } 
        public double AvgPayCheck { get; set; } 
    }
}