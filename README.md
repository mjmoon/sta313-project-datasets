This repository contains data files prepared for use in STA313H1 at the 
University of Toronto.

## Ontario Social Assistance Data Files

The files contain historical data about Ontario's two main Social Assistance 
programs: Ontario Works (OW) and Ontario Disability Support Program (ODSP). OW
provides financial and employment assistance to individual facing temporary 
financial need. ODSP is a long-term support program for those with disabilities. 
See below links for more information.

-  [Ontario Works](https://www.ontario.ca/page/ontario-works)
-  [Ontario Disability Support Program](https://www.ontario.ca/page/ontario-disability-support-program)

The original files were downloaded from the Government of Ontario's Data 
Catalogue pages for [Social Assistance Caseloads](https://data.ontario.ca/dataset/social-assistance-caseloads)
and [Ontario Social Assistance case characteristics by census metropolitan area](https://data.ontario.ca/dataset/ontario-social-assistance-case-characteristics-by-census-metropolitan-area).
The downloaded original files are found at [ONT-SA/original/](ONT-SA/original/). 
The script used to prepare the files are found at [ONT-SA/prep-ONT-SA.R](ONT-SA/prep-ONT-SA.R).


### Social Assistance Caseloads

The file [**"ont-sa-historical.csv"**](ONT-SA/ont-sa-historical.csv) contains 
historical data on the number of social assistance cases by month from 1969 to
2026. 

#### Attributes

*  **year**
    *  1969 to 2026
*  **month**
    *  1: January to 12: December
*  **cases**: Total number of cases on social assistance in Ontario. A case 
refers to a single individual or a family unit on social assistance (e.g., a 
family on social assistance is counted as one case).
*  **beneficiaries**: Total number of social assistance beneficiaries in 
Ontario. The number of beneficiaries refers to the total number of single 
individuals and heads of family units on social assistance plus all their 
dependents (i.e., spouses, dependent children, and dependent adults).
  *  NA mean not available

#### Notes

*  1969 to 1998: Include recipients of General Welfare Assistance and Family 
Benefits as well as recipients of Foster Care and Handicapped Children's 
benefits.   
*  1998: The Ontario Works Act was proclaimed on May 1, 1998 and replaced the 
General Welfare Assistance Act . The Ontario Disability Support Program was
proclaimed on June 1,1998 and replaced the Family Benefits Act.     
*  1998 to current: Data as from April 1998 include recipients of Ontario Works,
Ontario Disability Support Program, Temporary Care Assistance and Assistance for 
Children with Severe Disabilities.                          
*  The attribute descriptions and notes are retrieved from the 
[data dictionary](ONT-SA/original/historical_sa_recipients_data_dictionary_1969_to_current.xlsx).

### Social Assistance case characteristics by census metropolitan area

The files **"ont-sa-characteristic-{ }-{ }.csv"** contain the characteristics of
Ontario Works and Ontario Disability Support Program cases by census 
metropolitan area (CMA) and across the province from 2003 to 2026.

*  [**ont-sa-characteristic-odsp-cma.csv**](ONT-SA/ont-sa-characteristic-odsp-cma.csv) 
for ODSP cases by CMA
*  [**ont-sa-characteristic-odsp-ont.csv**](ONT-SA/ont-sa-characteristic-odsp-ont.csv)
for ODSP across Ontario
*  [**ont-sa-characteristic-ow-cma.csv**](ONT-SA/ont-sa-characteristic-ow-cma.csv) 
for ODSP cases by CMA
*  [**ont-sa-characteristic-ow-ont.csv**](ONT-SA/ont-sa-characteristic-ow-ont.csv)
for ODSP across Ontario

#### Attributes

*  **year**
    *  1969 to 2026
*  **month**
    *  1: January to 12: December
*  **cma_code**: CMA code
*  **cma**: CMA name
*  **cases**: Total number of cases. A case refers to a single individual or a 
family unit on social assistance (e.g., a family on social assistance is counted 
as one case).
*  **fts**: Number of cases with family type "single (without children)"
*  **ftsp**: Number of cases with family type "single parent"
*  **ftc**: Number of cases with family type "couple (with or without children)"
*  **fs1**: Number of cases with family size of 1 individual
*  **fs2**: Number of cases with family size of 2 individuals
*  **fs3**: Number of cases with family size of 3 or more individuals
*  **age24**: Number of cases with primary applicant's age 24 years or younger
*  **age2554**: Number of cases with primary applicant's age between 25 and 54 years
*  **age55**: Number of cases with primary applicant's age 55 years or older
*  **male**: Number of cases with a male primary applicant
*  **female**: Number of cases with a female primary applicant

_For ODSP cases:_

*  **moa035**: Number of cases whose length is 35 months or shorter
*  **moa3659**: Number of cases whose length is between 36 and 59 months 
*  **moa60**: Number of cases whose length isr 60 months or longer

_For OW cases:_

*  **moa04**: Number of cases whose length is 4 months or shorter
*  **moa512**: Number of cases whose length is between 5 and 12 months 
*  **moa1318**: Number of cases whose length is between 13 and 18 months 
*  **moa19**: Number of cases whose length is 19 months or longer

#### Notes

*  The size of the family is determined by the total number of individuals 
(primary applicant, spouse, dependent children and dependent adults) in the 
household.
*  Length of a case is number of consecutive months on assistance as of 
specified "month".
*  The attribute descriptions and notes are retrieved from the 
[data dictionary](ONT-SA/original/characteristics_data_dictionary_en.xlsx).

https://geo.scholarsportal.info/#r/details/_uri@=2459296538$DLI_2021_Census_DBF_Eng_Nat_cma