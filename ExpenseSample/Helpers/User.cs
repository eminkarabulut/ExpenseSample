using System.ComponentModel.DataAnnotations;

namespace ExpenseSample.Helpers
{
    public class User
    {
        [Key]
        public int Id { get; set; }

        [StringLength(50)]
        public string? Name { get; set; }

        [StringLength(50)]
        public string? Surname { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(50)]
        public string? Picture { get; set; }

        public List<Expense> Expenses { get; set; }
    }
}
