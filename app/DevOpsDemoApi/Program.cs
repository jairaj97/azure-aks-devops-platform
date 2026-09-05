var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "DevOps Platform API is running");

app.MapGet("/health", () => Results.Ok(new { status = "healthy" }));

app.MapGet("/ready", () => Results.Ok(new { status = "ready" }));

app.MapGet("/info", () => new
{
    environment = Environment.GetEnvironmentVariable("APP_ENV") ?? "local",
    version = Environment.GetEnvironmentVariable("APP_VERSION") ?? "1.0"
});

app.Run("http://0.0.0.0:8080");
