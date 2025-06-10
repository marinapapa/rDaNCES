#' @title Set up simulations
#' @author Marina Papadopoulou
#' @description Creates configuration files to be used for simulation runs.
#' @param param_set_class a parameter class with values to vary.
#' @param dirs_list a list of paths as exported by the set_up_dirs function.
#' @return nothing, creates as many config files as parameter combinations.
#' @export
set_up_simulations <- function(param_set_class,
                               dirs_list)
{
  ## CONFIG
  conf <- load_config(dirs_list$CONFIG_PATH)
  new_par <- create_param_set(param_set_class)
  
  utils::write.csv(new_par, 
            paste0(dirs_list$RESULTS_SPEC_TMP_PATH,
                   dirs_list$OUT_FOLD, 
                   '_config_params.csv'))
  
  # create configs
  config_change(conf, 
                new_par, 
                paste0(dirs_list$EXP_CONFIGS_PATH,
                       '\\',
                       dirs_list$CONFIGS_NAME), 
                #dirs_list$DATA_OUT_PATH,
                '')
  
}