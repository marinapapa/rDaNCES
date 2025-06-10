#' @title Set up directories for simulations
#' @author Marina Papadopoulou
#' @description Collects the paths to the configs and model executable, and sets up the
#' working directory using the input simulation name to store the generated configs and 
#' @param sim_name the name of the simulation experiment (to be used as unique id of folder).
#' @param config_name the name of the configuration file.
#' @param main_path the main directory to use for all files.
#' @param model_exe the name of the model executable.
#' @param exp_conf_name_id optional, if a special id is needed in the name of the generated configs.
#' @return a list of strings, with all paths to be used.
#' @export
set_up_directories <- function(sim_name, 
                               config_name, 
                               main_path,
                               model_exe,
                               exp_conf_name_id = ''
                               )
{
  
  if (is.na(sim_name) | is.na(config_name)) {
    stop("Error: please choose an output folder and .")
    }
  
  directories <- list()
  directories$OUT_FOLD <- sim_name
  directories$OUTPUT_PATH <- paste0(main_path, '\\', sim_name,'\\')
  
  ## Manual inputs
  directories$CONFIG_PATH <- config_name
  MODEL_PATH <- model_exe
  directories$CONFIGS_NAME <- paste0('config_', exp_conf_name_id)
  directories$MODEL_RUN_DIR <- tools::file_path_as_absolute(model_exe)
  
  for (i in c(directories$CONFIG_PATH, directories$MODEL_RUN_DIR))
  {
    confasser <- assertthat::see_if(file.exists(i))
    if (!(confasser[1]))
    { stop(attr(confasser,which = "msg"))}
  }
  
  directories$EXP_CONFIGS_PATH <- paste0(directories$OUTPUT_PATH,  'generated_configs\\' )
  directories$RESULTS_SPEC_TMP_PATH <- paste0(directories$OUTPUT_PATH, 'tmp\\')
  
  dirs.v <- c(directories$OUTPUT_PATH,
              directories$EXP_CONFIGS_PATH, 
              directories$RESULTS_SPEC_TMP_PATH
              )
  for (i in dirs.v) { if (!(dir.exists(i))) { dir.create(i) }}
  
  # Name to use for the log file that the simulation run function will create
  directories$LOG_FULL_PATH <- paste0(directories$OUTPUT_PATH, sim_name, '.log')
  
  return(directories)
}





