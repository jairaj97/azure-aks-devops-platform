FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy AS build

WORKDIR /src

COPY app/DevOpsDemoApi/DevOpsDemoApi.csproj ./
RUN dotnet restore DevOpsDemoApi.csproj

COPY app/DevOpsDemoApi/. ./
RUN dotnet publish DevOpsDemoApi.csproj \
    --configuration Release \
    --output /app/publish \
    --no-restore


FROM mcr.microsoft.com/dotnet/aspnet:8.0-jammy AS runtime

WORKDIR /app

COPY --from=build /app/publish ./

EXPOSE 8080

USER app
ENTRYPOINT ["dotnet", "DevOpsDemoApi.dll"]