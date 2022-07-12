using FluentValidation;

namespace Library.Application.Context.Items.Books.CreateBook;

public class CreateBookCommandValidator : AbstractValidator<CreateBookCommand>
{
    public CreateBookCommandValidator()
    {
        RuleFor(b => b).SetValidator(new ItemCommandValidator());

        RuleFor(b => b.Editor.Trim()).NotEmpty();
        RuleFor(b => b.Authors.Trim()).NotEmpty();
        RuleFor(b => b.Volume).GreaterThanOrEqualTo(0);
    }
}
