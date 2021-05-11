using System;
using System.ComponentModel.DataAnnotations;

namespace StayGo.Domain.Models
{
    public class Customer
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Avatar { get; set; }
        public DateTime DateBirth { get; set; }
    }
}