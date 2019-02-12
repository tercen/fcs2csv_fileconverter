# fcs2cvs file converter

#### Description
`fcs2cvs` converts a fcs file into a csv file.

##### Usage

The file converter requires R to run, R comes with Tercen Desktop
Install Tercen Desktop, this will also install R. If you have already an R installation then proceed to the R section

Install Tercen Desktop
Download or clone the complete repository

```
git clone https://github.com/tercen/fcs2csv_fileconverter`
```

To run on Windows:
Go to the downloaded folder and double click on the folder

```
run-win.bat
```

* A dialog appears for user to choose a csv file to convert
* Hit any key to close the black command DOS shell

Takes a fcs file as input


##### Usage with a previous R installation

First locate where the R installation directory is located.

Modify the `run-win.bat`  file and change the location indicated by the `RSCRIPT_EXE` 

`RSCRIPT_EXE` represents the location of the RScript.exe, default is the RScript.exe which comes with Tercen Desktop.

##### Output file

Same name as the input file but with a suffix `-tercen`
It contains an extra column with `file_name`


##### Details

It converts a fcs file by extracting the measurements into a csv file

#### References

##### See Also

#### Examples
