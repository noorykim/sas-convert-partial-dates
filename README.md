# Converting Non-Imputed Dates for SDTM Data Sets With PROC FCMP

A paper illustrating how to use PROC FCMP to define a custom function that converts date values (including partial date values) into an ISO 8601 date format (as required for submissions to the FDA). 

Presented at PharmaSUG 2017

Baltimore, Maryland, USA 

15MAY2017 --> 2017-05-15


## Links

Paper: [view](https://www.pharmasug.org/proceedings/2017/TT/PharmaSUG-2017-TT07.pdf)

Slideshow: [view](https://github.com/noorykim/sas-d-v-convert-partial-dates/blob/master/PharmaSUG%202017%20slides.pdf)

SAS code: [view](https://github.com/noorykim/sas-d-v-convert-partial-dates/blob/master/PharmaSUG%202017%20paper%20code.sas); [download](PharmaSUG%202017%20paper%20code.sas)


## Abstract

SDTM (Study Data Tabulation Model) data sets are required to store date values with ISO8601 formats, which accommodate both complete dates (e.g. YYYY-MM-DD) and partial dates (e.g. YYYY-MM). On the other hand, raw data sets may come with non-ISO8601 date formats (e.g. DDMMMYYYY). Converting complete date values to an ISO8601 format can be as simple as applying a SAS® date format to a numeric version of the date value. Conversion of partial date values is trickier. How may we convert, say, “UNMAY2017” and “UNUNK2017” into “2017-05” and “2017” respectively? This paper provides an example of how to do this using the SAS Function Compiler procedure (PROC FCMP). This paper also discusses methods of how to avoid the output of nonexistent dates such as “2017-01-99”.

## Citation

Kim, Noory Y. 2017. “Converting Non-Imputed Dates for SDTM Data Sets With PROC FCMP.” _Proceedings of the Pharmaceutical SAS Users Group (PharmaSUG) 2017 Conference._ Cary, NC: SAS Institute Inc. Available at https://www.pharmasug.org/proceedings/2017/TT/PharmaSUG-2017-TT07.pdf. 



# .

Last updated 2017-08-21

[Portfolio](/)
