using Library.Infrastructure.Entities;

namespace Library.API.Models.Results
{
    public abstract class UserItemResult
    {
        protected UserItemResult(UserItem userItem)
        {
            Id = userItem.Id;
            AcquisitionDate = userItem.AcquisitionDate;
            State = userItem.State.ToString();
            Collection = userItem.Collection;
        }

        public Guid Id { get; set; }

        /// <summary>
        ///     Acquisition date of the item.
        /// </summary>
        public DateTime AcquisitionDate { get; set; }

        /// <summary>
        ///     Quality state of the possessed item.
        /// </summary>
        public string State { get; set; }

        public string? Collection { get; set; }
    }
}
