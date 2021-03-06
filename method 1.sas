/* MODIFICATIONS TO PREVENT THE OUTPUT OF NONEXISTENT DATES */  
/* METHOD 1: COMPARE WITH THE LAST EXISTING DATE OF THE SAME MONTH */

proc format;
  value $month
    'JAN' = '01'
    'FEB' = '02'
    'MAR' = '03'
    'APR' = '04'
    'MAY' = '05'
    'JUN' = '06'
    'JUL' = '07'
    'AUG' = '08'
    'SEP' = '09'
    'OCT' = '10'
    'NOV' = '11'
    'DEC' = '12'
    other = ' '
  ;
run;

proc fcmp outlib=work.functions.conversions;

  function convertdate(indate $) $;
    length outdate $10;
    if indate ne ' ' then do;
      yyyy = substr(indate, 6, 4);
      mmm = upcase(substr(indate, 3, 3));
      dd = substr(indate, 1, 2);
     
      if notdigit(yyyy) = 0 then do;
        mm = put(mmm, $month.);
        if mm ne ' ' then do;
          if notdigit(dd) = 0 then do;
            outdate = yyyy || '-' || strip(mm) || '-' || dd;
           
            year = input(yyyy, 8.);
            month = input(mm, 8.);
            day = input(dd, 8.);
           
            month_start = mdy(month, 1, year);
            month_end = intnx('month', month_start, 0, 'end');
            month_lastday = day(month_end);
           
            if (day < 1) or (day > month_lastday) then do;
              outdate = yyyy || '-' || strip(mm);
            end;
          end;
          else outdate = yyyy || '-' || strip(mm);
        end;
        else outdate = yyyy;
      end;
      else outdate = ' ';
    end;
    else outdate = ' ';
    
    return(outdate);
  endsub;

run;

options cmplib=(work.functions);


/* CLEAN UP: DELETE FUNCTION */
proc fcmp outlib=work.functions.conversions;
  deletefunc convertdate;
run;
