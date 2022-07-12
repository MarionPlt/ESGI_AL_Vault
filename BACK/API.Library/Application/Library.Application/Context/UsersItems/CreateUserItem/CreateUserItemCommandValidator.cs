using FluentValidation;

namespace Library.Application.Context.UsersItems.CreateUserItem;

public class CreateUserItemCommandValidator : AbstractValidator<CreateUserItemCommand>
{
    public CreateUserItemCommandValidator()
    {
        RuleFor(ui => ui).SetValidator(new UserItemCommandValidator());

        RuleFor(ui => ui.UserId).NotEmpty();
        RuleFor(ui => ui.ItemId).NotEmpty();
    }
}
