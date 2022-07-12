using FluentValidation;

namespace Library.Application.Context.Items.VideoGames.CreateVideoGame;

public class CreateVideoGameCommandValidator : AbstractValidator<CreateVideoGameCommand>
{
    public CreateVideoGameCommandValidator()
    {
        RuleFor(vg => vg).SetValidator(new ItemCommandValidator());

        RuleFor(vg => vg.Platform).NotEmpty();
    }
}
