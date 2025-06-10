# *rDaNCES: fast and reproducable DAnCES*  

## Description 
This R package supports the set up and run of simulations with agent-based models constructed based on the [`DaNCES`](https://github.com/marinapapa/DaNCES_framework) framework (Data-iNspired Collective Escape Simulations).

[`rDaNCES`](https://github.com/marinapapa/rDaNCES) is a work in progress, and it aims to help users kick-off the simulation runs and analysis of their simulated data, but it does not yet offer a complete 

Overall the package uses a config file as a template (a full composed *.json* file from DaNCES), sets up the parameter space to be investigated, creates a set of configs for all different parameter combinations (saved in a *generated_configs* folder), runs the defined model (from the directory of the executable, see example *sim_demo* folder) for each config with as many repetitions as the user sets, and then provides some helper functions to start analyzing the simulated data. The executable of a model to be used for the simulations should be stored in a local folder and its path indicated, as shown in the vignette. To keep track of each full model, the user is advised to take advantage of version control of their GitHub repository for the agent-based modeling, for instance:
- demo_model.exe: branch *develop* @583ebdf (tree: 732qsfda4n, commit am: 'exp 1 model')
- demo_model_v2.exe: branch *develop* @535edde (tree: 732qsfda4n, commit am: 'exp 2 model')


## Prerequisites
Apart from the R dependencies included in the package's documentation, to run the agent-based simulations one also needs to:
* Define enviornmental variable *dancesPATH* with the path to the full *dances* repo
* See prerequesites of C++ model [DaNCES](https://github.com/marinapapa/DaNCES_framework)

## Publication

Further information on the functionality of the framework see our accompanying publication: 

_Papadopoulou M, Hildenbrandt H, Hemelrijk CK. (2025) A data-inspired framework to simulate predator-prey systems in collective behaviour. Under review._


### Acknowledgements
The development of this package was mainly supported by an NWO grant awarded to CKH at the University of Groningen.

## Authors
* **Marina Papadopoulou** - For any problem email at: <m.papadopoulou.rug@gmail.com>
