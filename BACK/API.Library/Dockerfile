FROM mcr.microsoft.com/dotnet/sdk:6.0 as build
WORKDIR /var/tmp

COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /var/tmp/out ./
ENTRYPOINT ["dotnet", "Library.API.dll"]