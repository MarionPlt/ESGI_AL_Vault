namespace Library.Infrastructure.Exceptions
{
    public class DataConflictException : Exception
    {
        public DataConflictException() {}
        public DataConflictException(string message) : base(message) {}
    }
}
