# International-Reserves-and-Central-Bank-Independence

This repository contains the codes associated with the paper:

"International Reserves and Central Bank Independence"

by Agustin Samano (2022)

## Empirical Analysis

The subfolder Empirical_Analysis.do contains the code that reproduces the empirical analysis presented in Table 1 using data from dataJMP_September in STATA. 

## Quantitative Analysis

The subfolder Quantitative_Analysis.jpynb contains the code with the quantitative analysis that reproduces tables 2-8.

The code is in Julia and it contains the corresponding jupyter notebook.

To run the jupyter notebook, do:

julia> using IJulia

julia> notebook(dir=".")

That should open a browser with Jupyter. Navigate to scripts to locate the notebooks.

The notebook Quantitative_Analysis.jpynb solves the model and generates the simulations and associated moments.

## Appendix D

NEW_FIGURES_SOURCEFINANCING.xlsx contains the figures presented in the appendix D. 

To replicate these figures, use Final_graphs_tables.do and the corresponding data CB_Balance_Sheet_Database_Inflation_all.dta in STATA.

