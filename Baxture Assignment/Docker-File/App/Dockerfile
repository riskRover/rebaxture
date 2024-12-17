# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081
# Build the service project
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Baxture Assignment.csproj", "."]
RUN dotnet restore "Baxture Assignment.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "Baxture Assignment.csproj" -c $BUILD_CONFIGURATION -o /app/build
# RUN ls /app/build after build step for debugging 
RUN ls /app/build  
# Publish the service project  and to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "Baxture Assignment.csproj" -c $BUILD_CONFIGURATION -o /app/publish
# RUN ls /app/publish after publish step for debugging 
RUN ls /app/publish
# Multi-stage step to seperate the artifacts to run for defined /app directory
FROM base AS final
WORKDIR /app
# RUN ls /app to verify same dll has been copied after workdirectory set to /app  
RUN ls /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Baxture Assignment.dll"]
