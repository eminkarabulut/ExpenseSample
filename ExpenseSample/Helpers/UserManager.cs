namespace ExpenseSample.Helpers
{
    public class UserManager
    {
        private DatabaseContext db = new DatabaseContext();

        public bool AddUser(string username, string password)
        {
            if (db.Users.Any(x => x.Username.ToLower() == username.ToLower()))
            {
                return false;
            }

            db.Users.Add(new User { Username = username, Password = password });

            return db.SaveChanges() > 0;
        }

        public User Authenticate(string username, string password)
        {
            User user = db.Users.FirstOrDefault(x => x.Username == username && x.Password == password);

            return user;
        }

        public User GetUserById(int userId)
        {
            User user = db.Users.FirstOrDefault(x => x.Id == userId);

            return user;
        }

        public bool UpdateProfile(int userId, string name, string surname)
        {
            User user = GetUserById(userId);

            user.Name = name;
            user.Surname = surname;

            return db.SaveChanges() > 0;
        }

        public bool UpdatePassword(int userId, string? password)
        {
            User user = GetUserById(userId);

            user.Password = password;

            return db.SaveChanges() > 0;
        }

        public bool UpdateProfilePicture(int userId, string filename)
        {
            User user = GetUserById(userId);

            user.Picture = filename;

            return db.SaveChanges() > 0;
        }
    }
}
