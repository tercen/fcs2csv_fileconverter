#select file

source("packrat/init.R")

# print(file.exists("packrat/init.R"))
# print(getwd())
# print(.libPaths())

library(flowCore)

in_file_name <- file.choose()

# original filname
get_name_parts <- function(a_file_name) {
  basename <- basename(a_file_name)
  # get last "."
  ext <- tail(strsplit(basename, "\\.")[[1]], n=1L)
  prefix <- strsplit(basename, "_")[[1]][1]
  # path
  path_sans_base_and_ext <-substr(a_file_name, start=1, stop = (nchar(a_file_name)-nchar(basename))) 
  basename_sans_ext <- substr(start = 1, stop = (nchar(basename)-nchar(ext)-1), basename)
  path_without_ext <- paste0(path_sans_base_and_ext, basename_sans_ext)
  return(list(basename = basename, basename_sans_ext = basename_sans_ext,  path_sans_base_and_ext=path_sans_base_and_ext, path_without_ext = path_without_ext, ext = ext, prefix = prefix))
}

# filename
file_part <- get_name_parts(in_file_name)
print (paste("filename is", file_part$basename))

print (paste("processing filename", file_part$basename))

print("reading started...")
print("...it may take some time..")
print("...please wait...")

# read data in
data_fcs <- read.FCS(filename = in_file_name, transformation = FALSE)

# get parameter names
names_parameters <- data_fcs@parameters@data$desc

# get data
data <- exprs(data_fcs)

# get data columns
col_names <- colnames(data)

# rename parameters
names_parameters <- ifelse(is.na(names_parameters),col_names,names_parameters)
colnames(data)   <- names_parameters
  

# file_name <- paste0(file_part$path_without_ext,"-", format(Sys.time(), "%y%m%d%H%M"), ".csv")

filename_path <- paste0(file_part$path_without_ext,"-tercen",".csv")
if (file.exists(filename_path)) file.remove(filename_path)

file_name <- get_name_parts(filename_path)$basename_sans_ext

# add filename to data
data <- cbind(data, file_name)

write.table(x= data, file = filename_path, sep=",", na ="", row.names = FALSE)

print ("conversion finished")
