using System;
using System.ComponentModel.DataAnnotations;

namespace staygo_server.Models
{
    public class CustomerDto
    {
        [Required] public int Id { get; set; }
        [Required] public string Name { get; set; }
        public string Avatar { get; set; }
        public DateTime DateBirth { get; set; }
    }
}