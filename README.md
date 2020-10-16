# fcs2csv file converter

##### Description

`fcs2csv` converts a fcs file into a csv file.

##### Usage

The file converter requires R to run, R comes with Tercen Desktop
Install Tercen Desktop, this will also install R. If you have already an R installation then proceed to the "usage with a previous R installation section" (see below).

Install Tercen Desktop.

Download or clone the complete repository

```
git clone https://github.com/tercen/fcs2csv_fileconverter`
```

To run on Windows:

Go to the downloaded folder and double click on the file

```
run-win.bat
```

* A dialog appears for user to choose a csv file to convert
* Hit any key to close the black command DOS shell

It takes a fcs file as input.

##### Usage with a previous R installation

First locate where the R installation directory is.

Modify the `run-win.bat`  file and change the path location of the indicated executable indicated by `RSCRIPT_EXE` in the file.

`RSCRIPT_EXE` represents the location of the `RScript.exe` program, default is the `RScript.exe` which comes with Tercen Desktop. It is usually found in the `bin` folder of the R installation directory.

Once the `run-win.bat` is modified with the correct location of `RScript.exe` then proceed.

Run on Windows:

double click on the file

```
run-win.bat
```

##### Output file

Same name as the input file but with a suffix `-tercen`
It contains an extra column with `file_name`


##### Details

It converts a fcs file by extracting the measurements into a csv file. It add a column with `file_name`

#### References

##### See Also

#### Examples
