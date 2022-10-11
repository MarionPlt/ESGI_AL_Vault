//using Microsoft.EntityFrameworkCore;

using FluentValidation;
using Library.Application;
using Library.Application.Behaviors;
using Library.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy =>
    {
        policy.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
    });
});

// Get configuration from builder.
var configuration = builder.Configuration;

// Add services to the container.

builder.Services.AddControllers();

// Enable Swagger on every environment expect production.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Mediator with validation configuration.
builder.Services.AddMediatR(typeof(ApplicationEntryPoint));
builder.Services.AddTransient(typeof(IPipelineBehavior<,>), typeof(ValidatorBehavior<,>));
builder.Services.AddValidatorsFromAssemblyContaining(typeof(ApplicationEntryPoint));

// Database configuration
builder.Services.AddDbContext<ApplicationDbContext>(
    options => options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();

app.UseCors();

app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
