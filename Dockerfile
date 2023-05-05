FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /sln

# Copy project file and restore
COPY "./src/RicardoV.KubPocTest.Mvc/RicardoV.KubPocTest.Mvc.csproj" "./src/RicardoV.KubPocTest.Mvc/RicardoV.KubPocTest.Mvc.csproj"
RUN dotnet restore ./src/RicardoV.KubPocTest.Mvc/RicardoV.KubPocTest.Mvc.csproj

# Copy the actual source code
COPY "./src/RicardoV.KubPocTest.Mvc/" "./src/RicardoV.KubPocTest.Mvc/"

# Build and publish the app
RUN dotnet publish "./src/RicardoV.KubPocTest.Mvc/RicardoV.KubPocTest.Mvc.csproj" -c Release -o /app/publish

#FINAL image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine3.12
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "RicardoV.KubPocTest.Mvc.dll"]