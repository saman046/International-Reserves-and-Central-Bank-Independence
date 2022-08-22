# International-Reserves-and-Central-Bank-Independence

This repository contains the code associated with the paper:

"International Reserves and Central Bank Independence"

by Agustin Samano (2022)

## Structure

The subfolder X contains the main source code.

The subfolder X contains some of the analysis of the model for certain parameters. It contains a julia script as well as the corresponding jupyter notebook. The scripts generate the figures and moments reported in the paper.

The subfolder X contains the figures generates by the scripts, as well as some of the calculated moments.

## Running the code

The code is in Julia.

To run the code, open a julia prompt at the root of this repository and type:

julia> using Pkg 

julia> Pkg.activate(".")

julia> Pkg.instantiate()

The above will download the packages needed to run the code.

To run the jupyter notebook, do:

julia> using IJulia

julia> notebook(dir=".")

That should open a browser with Jupyter . Navigate to scripts to locate the notebooks.

The notebook International Reserves and Central Bank Independence solves the model

International_Reserves_and_Central_Bank_Independence.ipynb generates the simulations and associated moments.

Associated with Jupyter each notebook, there is a Julia script (.jl) that can be run instead.
