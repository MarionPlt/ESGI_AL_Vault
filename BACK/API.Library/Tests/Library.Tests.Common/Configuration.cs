namespace Library.Tests.Common
{
    public static class Configuration
    {
        public static readonly string ConnectionString;

        static Configuration()
        {
            string env = Environment.GetEnvironmentVariable("LibraryTestEnvironment") ?? string.Empty;

            if (env == "Staging")
            {
                ConnectionString = "Server=localhost;Database=test_vault_library;Trusted_Connection=True";
            }
            else
            {
                ConnectionString = "Server=(localdb)\\mssqllocaldb;Database=test_vault_library;Trusted_Connection=True";
            }
        }
            
    }
}
