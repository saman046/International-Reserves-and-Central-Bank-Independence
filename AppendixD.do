clear
set more off

*Working directory.
cd "C:\Users\WB581020\OneDrive - WBG\International Reserves\Journal of International Economics\Data" 

use CB_Balance_Sheet_Database_inflation_all.dta

*** New variables
destring Year, replace force
gen mdate = ym(Year,Meses)

*** Panel
xtset country_code mdate

*** Generate new variables

gen reserves               = Reserve_ratio*100

gen bonds                  = Claims_Government*100

gen assets_other           = Other_assets*100

gen external               = External_Liabilities*100

gen domestic               = Remunerated_Liabilities*100

gen money                  = Real_Demand_of_Money*100

gen liabilities_other      = Other_liabilities*100


gen reserves_chg           = reserves - L.reserves

gen bonds_chg              = bonds - L.bonds

gen assets_other_chg       = assets_other - L.assets_other

gen external_chg           = external - L.external

gen domestic_chg           = domestic - L.domestic

gen money_chg              = money - L.money

gen liabilities_other_chg  = liabilities_other - L.liabilities_other



***** Figure 1. Central Bank Assets

table date if country == "Mexico" & mdate > 502 & mdate < 708, contents(mean reserves mean bonds)

table date if country != "Mexico" & country != "Venezuela, Republica Bolivariana de" & mdate > 502 & mdate < 708, contents(mean reserves mean bonds)



***** Figure 2. Central Bank Liabilities

table date if country == "Mexico" & mdate > 502 & mdate < 708, contents(mean external mean domestic mean money)

table date if country != "Mexico" & country != "Venezuela, Republica Bolivariana de" & mdate > 502 & mdate < 708, contents(mean external mean domestic mean money)



***** Figure 3. Drivers of the Change in the Level of Reserves

gen govt         = - bonds

gen govt_chg     = govt - L.govt  

table date if country == "Mexico" & mdate > 502 & mdate < 708, contents(mean reserves_chg mean govt_chg mean domestic_chg mean external_chg mean money_chg)

table date if country != "Mexico" & country != "Venezuela, Republica Bolivariana de" & mdate > 502 & mdate < 708, contents(mean reserves_chg mean govt_chg mean domestic_chg mean external_chg mean money_chg)



*** Figure 4. Reserves, Money Base, and Inflation Rates

table date if country == "Mexico" & mdate > 502 & mdate < 708, contents(mean reserves mean money mean inflation)

table date if country != "Mexico" & country != "Venezuela, Republica Bolivariana de" & mdate > 502 & mdate < 708, contents(mean reserves mean money mean inflation)


*** Table 1. Correlations between inflation, reserves, and monetary base
bys country: pwcorr reserves money reserves_chg money_chg inflation if country != "Venezuela, Republica Bolivariana de" & mdate > 502 & mdate < 708
