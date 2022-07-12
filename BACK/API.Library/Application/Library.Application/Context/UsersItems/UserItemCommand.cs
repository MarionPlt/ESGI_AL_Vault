using Library.API.Models.DTOs;
using Library.Infrastructure.Entities.Enumerations;

namespace Library.Application.Context.UsersItems;

public class UserItemCommand
{
    public UserItemCommand(UserItemDTO userItemDTO)
    {
        AcquisitionDate = userItemDTO.AcquisitionDate;
        Collection = userItemDTO.Collection;

        if (!Enum.TryParse<UserItemState>(userItemDTO.State, out var userItemState))
        {
            throw new InvalidCastException(userItemDTO.State + " isn't a valid state. " +
                                           "Accepted value : BattleScarred, WellWorn, FieldTested, MinimalWear or FactoryNew.");
        }

        State = userItemState;
    }

    public DateTime AcquisitionDate { get; }

    public UserItemState State { get; }

    public string? Collection { get; }
}
