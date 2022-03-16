 
 *** Normal data
 reg total_cases people_vaccinated people_fully_vaccinated total_tests if year==1
  reg total_cases people_vaccinated people_fully_vaccinated total_tests if year==0
   xtset population year, delta(1)
   xtreg total_cases year people_vaccinated people_fully_vaccinated total_tests , fe robust
   
 *** Per population data
   reg total_casesperpopulation total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula if year == 0
    reg total_casesperpopulation total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula if year == 1
	 xtset population year, delta(1)
	 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula  , fe robust
	 
*** Using interaction terms

gen interaction = people_fully_vaccinatedperpopula*population_density
 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula interaction  , fe robust
 
 gen interaction1 = total_testsperpopulation*population_density
 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula interaction1  , fe robust
 
 gen interaction2 = people_vaccinatedperpopulation*population_density
 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula interaction2 , fe robust
 
 gen interaction3 = people_fully_vaccinated*population_density xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula interaction3 , fe robust
 
  gen interaction4 = total_tests*population_density
 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula interaction4  , fe robust
 
 
  gen interaction5 = people_vaccinated*population_density
 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula interaction5 , fe robust
 
 ****Random effects
 xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula  , re robust
 
 ****Hausman test
  xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula  , fe
  estimates store fixed
   xtreg total_casesperpopulation year total_testsperpopulation people_vaccinatedperpopulation people_fully_vaccinatedperpopula  , re 
   estimates store random
   hausman fixed random