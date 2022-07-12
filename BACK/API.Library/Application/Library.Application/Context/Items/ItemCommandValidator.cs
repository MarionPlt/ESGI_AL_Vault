using FluentValidation;

namespace Library.Application.Context.Items;

/// <summary>
///     Validator class for the class <see cref="ItemCommand" />.
/// </summary>
public class ItemCommandValidator : AbstractValidator<ItemCommand>
{
    /// <summary>
    ///     Validation rules setup.
    /// </summary>
    public ItemCommandValidator()
    {
        RuleFor(c => c.Label.Trim()).NotEmpty();
        RuleFor(c => c.Type).NotNull();
        RuleFor(c => c.ReleaseDate).NotNull();
    }
}
