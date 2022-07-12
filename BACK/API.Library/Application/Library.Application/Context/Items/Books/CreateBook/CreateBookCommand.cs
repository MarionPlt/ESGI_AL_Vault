using Library.API.Models.DTOs.Items;
using MediatR;

namespace Library.Application.Context.Items.Books.CreateBook;

public class CreateBookCommand : ItemCommand, IRequest<Guid>
{
    public CreateBookCommand(BookDTO dto) : base(dto)
    {
        Editor = dto.Editor;
        Authors = dto.Authors;
        Volume = dto.Volume;
    }

    public string Editor { get; }

    public string Authors { get; }

    public int? Volume { get; }
}
