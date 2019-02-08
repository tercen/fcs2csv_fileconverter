#select file
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
  return(list(basename = basename, path_sans_base_and_ext=path_sans_base_and_ext, path_without_ext = path_without_ext, ext = ext, prefix = prefix))
}

# filename
file_part <- get_name_parts(in_file_name)
print (paste("filename is", file_part$basename))

print (paste("processing filename", file_part$basename))

print("reading started...")
print("...it may take some time..")
print("...please wait...")

data <- read.FCS(filename = in_file_name, transformation = FALSE)

data <- exprs(data)
  
file_name <- paste0(file_part$path_without_ext,"-", format(Sys.time(), "%y%m%d%H%M"), ".csv")

write.table(x= data, file = file_name, sep=",", na ="", row.names = FALSE)

print ("conversion finished")
