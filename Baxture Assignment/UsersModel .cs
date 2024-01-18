using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace Baxture_Assignment
{
    public class UsersModel
    {
        public int Id { get; set; } 

        [Required]
        public string Username { get; set; }

        [Required]
        [RegularExpression(@"^(?=.*[a-zA-Z])(?=.*\d).{6,}$", ErrorMessage = "Password must be alphanumeric and at least 6 characters long.")]
        public string Password { get; set; }

        public bool IsAdmin { get; set; } = false;

        [Required]
        public int Age { get; set; }

        [Required]
        public string Hobbies { get; set; } 
    }
}

