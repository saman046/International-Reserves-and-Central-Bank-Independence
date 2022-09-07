clear
set more off

use "C:\Users\WB581020\OneDrive - WBG\International Reserves\International Reserves and Central Bank Independence\Data\dataJMP_September"

*** Panel
encode country,gen(country_code)
xtset country_code year

*** New variables
*gen emerging = 0 
*replace emerging = 1 if group == 1 | group == 2 | group == 3 | group == 4 

gen log_reserves = log(reserves)
gen log_debthpdd = log(debt_hpdd)
gen log_spreads = log(spreads)
gen log_inflation = log(inflation)

gen L_log_reserves = L.log_reserves
gen L_log_debthpdd = L.log_debthpdd
gen L_log_gdp = L.log_gdp
gen L_log_spreads = L.log_spreads
gen L_cbi = L.cbi
gen L_log_inflation = L.log_inflation





*(1)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd i.year if group==3 & country != "Costa Rica" & country != "Panama" & year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel replace ctitle(Baseline)

*(2)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L_log_inflation i.year if group==3 & country != "Costa Rica" & country != "Panama" & year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel append ctitle(Inflation)

*xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L.inflation i.year if group==3 & country != "Costa Rica" & country != "Panama" & year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
*outreg2 using results, excel replace ctitle(Inflation)

*(3)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L_log_inflation fixed i.year if group==3 & country != "Costa Rica" & country != "Panama" & year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel append ctitle(Fx regime)

*(4)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L_log_inflation fixed L_log_spreads i.year if group==3 & country != "Costa Rica" & country != "Panama" & year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel append ctitle(Spreads)


***********************************************************************************************************************************************************************
******************************************************************** BASELINE REGRESSIONS for ALL EMEs ****************************************************************
***********************************************************************************************************************************************************************

*(1)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd i.year if year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel replace ctitle(Baseline)

*(2)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L_log_inflation i.year if year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel append ctitle(Inflation)

*xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L.inflation i.year if group==3 & country != "Costa Rica" & country != "Panama" & year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
*outreg2 using results, excel replace ctitle(Inflation)

*(3)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L_log_inflation fixed i.year if year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel append ctitle(Fx regime)

*(4)
xtreg log_reserves L_cbi L_log_gdp L_log_debthpdd L_log_inflation fixed L_log_spreads i.year if year >= 1970 & year <= 2017 & default==0, fe vce(cluster country_code) 
outreg2 using results, excel append ctitle(Spreads)
