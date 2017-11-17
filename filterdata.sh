# remove continous fields that are unimportant
cut -f 1,2,4,6,7,8,9,10,13,14,15 -d "," adult.data |\
# remove lines with missing data
awk '$0 !~ /\?/' |\
# discretize age
awk -F "," '$1 < 18 { print "<18" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} $1 >= 18 && $1 < 25 { print "18-24" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} $1 >= 25 && $1 < 35 { print "25-34" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} $1 >= 35 && $1 < 45 { print "35-44" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} $1 >= 45 && $1 < 55 { print "45-54" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} $1 >= 55 && $1 < 65 { print "55-64" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} $1 >=65 { print ">=65" "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," $9 "," $10 "," $11} ' |\
 # discretize hours
awk -F "," '$9 < 10 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," "<10" "," $10 "," $11} $9 >= 10 && $9 < 20 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," "10-19" "," $10 "," $11}   $9 >= 20 && $9 < 30 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," "20-29" "," $10 "," $11}   $9 >= 30 && $9 < 40 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," "30-39" "," $10 "," $11}   $9 >= 40 && $9 < 50 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," "40-49" "," $10 "," $11}   $9 >= 50 && $9 < 60 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," "50-59" "," $10 "," $11}   $9 >= 60 { print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8 "," ">=60" "," $10 "," $11} '