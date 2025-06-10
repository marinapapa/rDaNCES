#' @title Run simulations
#' @author Marina Papadopoulou
#' @description Runs simulations through the shell.
#' @param dir_list A list of directories exported by the set_up_dirs function.
#' @param reps integer; How many times to repeat each simulation with same parameters.
#' @return nothing, it runs the simulations and writes a log file.
#' @export
run_simulations <- function(dirs_list,
                            reps)
{
  ####################################################
  ## RUN MODEL
  if (length(list.files(dirs_list$EXP_CONFIGS_PATH)) < 1)
  {
    stop("Config folder is empty! Make sure to run the set up simulations function first.")
  }
  
  cat(paste0('Simulations sets: ', dirs_list$OUT_FOLD, '\n'), file = dirs_list$LOG_FULL_PATH)
  k <- 1
  pb <- utils::txtProgressBar(min = 0, max = reps*length(list.files(dirs_list$EXP_CONFIGS_PATH)), style = 3)
  for (i in list.files( dirs_list$EXP_CONFIGS_PATH))
  {
    repets <- reps
    while (repets > 0)
    {
      cat(paste0('Simulation with config: ', i, ', repetition: ', reps - repets + 1, ' \n'), file =  dirs_list$LOG_FULL_PATH, append = TRUE)
      shell(paste0(dirs_list$MODEL_RUN_DIR,' config=',  dirs_list$EXP_CONFIGS_PATH, '/', i,' >> ',  dirs_list$LOG_FULL_PATH))
      repets <- repets - 1
      k <- k + 1
      utils::setTxtProgressBar(pb, k)
    }
  }
}
