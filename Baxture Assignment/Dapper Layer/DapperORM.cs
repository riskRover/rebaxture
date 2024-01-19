using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;


namespace Baxture_Assignment.Dapper_Layer
{
    public class DapperORM
    {
        private readonly IConfiguration _configuration;

        public DapperORM(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<IEnumerable<UsersModel>> GetAllUsers()
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters param = new DynamicParameters();
                param = null;
                return await connection.QueryAsync<UsersModel>("GetAllUsers", param, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<UsersModel>> GetSingleUser(int userId)
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters param = new DynamicParameters();
                param.Add("Id", userId);
                return await connection.QueryAsync<UsersModel>("GetUserByID", param, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<UsersModel>> InsertUser(UsersModel m)
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                var param = new
                {
                    Id = m.Id,
                    Username = m.Username,
                    Password = m.Password,
                    IsAdmin = m.IsAdmin,
                    Age = m.Age,
                    Hobbies = m.Hobbies,
                };

                return await connection.QueryAsync<UsersModel>("InsertUser", param, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<UsersModel>> UpdateUserByID(int userId, UsersModel m)
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

                return await connection.QueryAsync<UsersModel>("UpdateUserByID", param, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<UsersModel>> DeleteUserByID(int userId)
        {
            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                var param = new
                {
                    Id = userId,
                };

                return await connection.QueryAsync<UsersModel>("DeleteUserByID", param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
