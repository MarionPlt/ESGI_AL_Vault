using FluentValidation;

namespace Library.Application.Context.Items.Movies.CreateMovie;

public class CreateMovieCommandValidator : AbstractValidator<CreateMovieCommand>
{
    public CreateMovieCommandValidator()
    {
        RuleFor(m => m.Director).NotEmpty();
        RuleFor(m => m.Editor).NotEmpty();
    }
}
