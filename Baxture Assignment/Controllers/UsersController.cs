using Baxture_Assignment.Dapper_Layer;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Baxture_Assignment.Controllers
{
    // this is feature2 commit
    //API CONTROLLER
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        private readonly SqlConnection _dbConnection;
        private readonly DapperORM _DapperORMlayer;
        public UsersController(IConfiguration configuration, SqlConnection dbConnection, DapperORM DapperORMlayer)
        {
            _configuration = configuration;
            _dbConnection = dbConnection;
            _DapperORMlayer = DapperORMlayer;
        }


        [HttpGet]
        public async Task<IActionResult> GetAllUsers()
        {

            var users = await _DapperORMlayer.GetAllUsers();
            return Ok(users);

            //using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            //{

            //    connection.Open();
            //    DynamicParameters param = new DynamicParameters();
            //    param = null;
            //    var users = await connection.QueryAsync<UsersModel>("GetAllUsers", param, commandType: CommandType.StoredProcedure);
            //    return Ok(users);
            //}

        }

        
        [HttpGet("{userId}")]
        public async Task<IActionResult> GetSingleUser(int userId)
        {

            var user = await _DapperORMlayer.GetSingleUser(userId);
            return Ok(user);
            //using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            //{
            //    connection.Open();
            //    DynamicParameters param = new DynamicParameters();
            //    param.Add("Id", userId);
            //    var users = await connection.QueryAsync<UsersModel>("GetUserByID", param, commandType: CommandType.StoredProcedure);
            //    return Ok(users);
            //}


        }


        [HttpPost("{userId}")]
        public async Task<IActionResult> InsertUser(UsersModel m)
        {

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                var users = await _DapperORMlayer.InsertUser(m);
                return Ok(users);
            }
            //using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            //{
            //    connection.Open();

            //    var param = new
            //    {
            //        Id = m.Id,
            //        Username = m.Username,
            //        Password =  m.Password,
            //        IsAdmin =   m.IsAdmin,
            //        Age =       m.Age,
            //        Hobbies  =  m.Hobbies,
            //    };
            //    var users = await connection.QueryAsync<UsersModel>("InsertUser", param, commandType: CommandType.StoredProcedure);
            //    return Ok(users);
            //}


        }

        [HttpPut("{userId}")]
        public async Task<IActionResult> UpdateUser(int userId , UsersModel m)
        {

            var users = await _DapperORMlayer.UpdateUserByID(userId, m);
            return Ok(users);
            //using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            //{
            //    connection.Open();

            //    var param = new
            //    {
            //        Id = userId,
            //        Username = m.Username,
            //        Password = m.Password,
            //        IsAdmin = m.IsAdmin,
            //        Age = m.Age,
            //        Hobbies = m.Hobbies,
            //    };
            //    var users = await connection.QueryAsync<UsersModel>("UpdateUserByID", param, commandType: CommandType.StoredProcedure);
            //    return Ok(users);
            //}


        }


        [HttpDelete("{userId}")]
        public async Task<IActionResult> DeleteUserByID(int userId)
        {
            var users = await _DapperORMlayer.DeleteUserByID(userId);
            return Ok(users);

        }

    }

}


