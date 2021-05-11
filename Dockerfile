FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /src
COPY ["StayGo.Server/web/StayGo.Server.csproj", "StayGo.Server/web/"]
COPY ["StayGo.Database/StayGo.Database.csproj", "StayGo.Database/"]
COPY ["StayGo.Domain/StayGo.Domain.csproj", "StayGo.Domain/"]
RUN dotnet restore "StayGo.Server/web/StayGo.Server.csproj"
COPY . .
WORKDIR "/src/StayGo.Server/web"
RUN dotnet build "StayGo.Server.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "StayGo.Server.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "StayGo.Server.dll"]
CMD ["dotnet", "StayGo.Server.dll", "--server.urls", "http://+:$(PORT)"]
