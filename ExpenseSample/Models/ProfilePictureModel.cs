using System.ComponentModel.DataAnnotations;

namespace ExpenseSample.Models
{
    public class ProfilePictureModel
    {
        [Required]
        public IFormFile NewPicture { get; set; }
    }
}
