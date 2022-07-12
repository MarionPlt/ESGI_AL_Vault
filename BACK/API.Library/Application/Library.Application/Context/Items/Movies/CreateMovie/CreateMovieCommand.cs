using Library.API.Models.DTOs.Items;
using Library.API.Models.Results.Items;
using MediatR;

namespace Library.Application.Context.Items.Movies.CreateMovie;

public class CreateMovieCommand : ItemCommand, IRequest<MovieResult>
{
    public CreateMovieCommand(MovieDTO movieDto) : base(movieDto)
    {
        Director = movieDto.Director;
        Editor = movieDto.Editor;
    }

    public string Director { get; }
    public string Editor { get; }
}
