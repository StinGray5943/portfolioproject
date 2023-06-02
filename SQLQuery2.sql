select location, date, total_cases, population, (total_cases/population)*100 as casespopulation
from personal..CovidDeath
where location like '%state%'
order by 1,2 

select location, max(total_cases)as hishestinfection , population, max(total_cases/population)*100 as populationinfectedpercent
from personal..CovidDeath
--where location like '%state%'
group by location, population 
order by populationinfectedpercent desc

--country with the higest death count per population 



select location, max(cast(total_deaths as  bigint ) ) as TotalDeathCount 
from personal..CovidDeath
--where location like '%state%'
group by location 
order by TotalDeathCount desc



select vea.location, vea.continent, vea.date,vea.population, dea.new_vaccinations,
sum(convert(bigint,dea.new_vaccinations)) over (partition by vea.location)
from personal..CovidVaccine dea join personal..CovidDeath vea
on dea.location=vea.location and
   dea.date=vea.date
   where dea.continent is not null 
   order by 1,2,3

   create view TotalDeathCount as  
   
select location, max(total_cases)as hishestinfection , population, max(total_cases/population)*100 as populationinfectedpercent
from personal..CovidDeath
--where location like '%state%'
group by location, population 
--order by populationinfectedpercent desc

   select *
   from TotalDeathCount