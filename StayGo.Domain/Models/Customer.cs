using System;
using System.ComponentModel.DataAnnotations;

namespace StayGo.Domain.Models
{
    public class Customer
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public DateTime DateBirth { get; set; }        
    }
}