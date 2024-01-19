using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Baxture_Assignment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        string cs = "Data Source=HP15EH2\\SQLEXPRESS; Initial Catalog=BaxtureAssignmentDB; Integrated Security=False; User ID=mayurpatil; Password=7507792337aA@; Encrypt=True; TrustServerCertificate=True;";

        private readonly IConfiguration _configuration;
        private readonly SqlConnection _dbConnection;
        public UsersController(IConfiguration configuration, SqlConnection dbConnection)
        {
            _configuration = configuration;
            _dbConnection = dbConnection;
        }


        [HttpGet]
        public async Task<IActionResult> GetAllUsers()
        {

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {

                connection.Open();
                DynamicParameters param = new DynamicParameters();
                param = null;
                var users = await connection.QueryAsync<UsersModel>("GetAllUsers", param, commandType: CommandType.StoredProcedure);
                return Ok(users);


            }


        }

        // GET api/users/{userId}
        [HttpGet("{userId}")]
        public async Task<IActionResult> GetSingleUser(int userId)
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters param = new DynamicParameters();
                param.Add("Id", userId);
                var users = await connection.QueryAsync<UsersModel>("GetUserByID", param, commandType: CommandType.StoredProcedure);
                return Ok(users);
            }


        }


        [HttpPost("{userId}")]
        public async Task<IActionResult> InsertUser(UsersModel m)
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                var param = new
                {
                    Id = m.Id,
                    Username = m.Username,
                    Password =  m.Password,
                    IsAdmin =   m.IsAdmin,
                    Age =       m.Age,
                    Hobbies  =  m.Hobbies,
                };
                var users = await connection.QueryAsync<UsersModel>("InsertUser", param, commandType: CommandType.StoredProcedure);
                return Ok(users);
            }


        }

        [HttpPut("{userId}")]
        public async Task<IActionResult> UpdateUser(int userId , UsersModel m)
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                var param = new
                {
                    Id = userId,
                    Username = m.Username,
                    Password = m.Password,
                    IsAdmin = m.IsAdmin,
                    Age = m.Age,
                    Hobbies = m.Hobbies,
                };
                var users = await connection.QueryAsync<UsersModel>("UpdateUserByID", param, commandType: CommandType.StoredProcedure);
                return Ok(users);
            }


        }

    }

}


