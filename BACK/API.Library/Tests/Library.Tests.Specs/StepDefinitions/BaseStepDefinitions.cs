using FluentValidation;
using Library.Application;
using Library.Application.Behaviors;
using Library.Infrastructure;
using Library.Tests.Common;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Xunit;

namespace Library.Tests.Specs.StepDefinitions
{
    public class BaseStepDefinitions
    {

        protected readonly IMediator _mediator;
        protected ApplicationDbContext _context;
        private readonly LibraryTestDatabaseFixture _fixture;

        public BaseStepDefinitions()
        {
            var services = new ServiceCollection();
            services.AddMediatR(typeof(ApplicationEntryPoint));
            services.AddTransient(typeof(IPipelineBehavior<,>), typeof(ValidatorBehavior<,>));
            services.AddValidatorsFromAssemblyContaining(typeof(ApplicationEntryPoint));

            services.AddDbContext<ApplicationDbContext>(
                    options => options.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=test_vault_library;Trusted_Connection=True"));

            var provider = services.BuildServiceProvider();

            _mediator = provider.GetRequiredService<IMediator>();
            _fixture = new();
            _context = _fixture.CreateContext();
        }

        [AfterScenario]
        public void Cleanup()
        {
            _fixture.Cleanup();
        }
    }
}
