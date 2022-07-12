using FluentValidation;

namespace Library.Application.Context.UsersItems.UpdateUserItem;

public class UpdateUserItemCommandValidator : AbstractValidator<UpdateUserItemCommand>
{
    public UpdateUserItemCommandValidator()
    {
        RuleFor(ui => ui).SetValidator(new UserItemCommandValidator());

        RuleFor(ui => ui.UserItemId).NotEmpty();
    }
}
