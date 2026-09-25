This repository contains data files prepared for use in STA313H1 at the 
University of Toronto.

## Ontario Social Assistance Data Files

The files in [ONT-SA](ont-sa/) contain historical data about Ontario's two main 
Social Assistance programs: Ontario Works (OW) and Ontario Disability Support 
Program (ODSP). OW provides financial and employment assistance to individuals 
facing temporary financial need. ODSP is a long-term support program for those 
with disabilities. See below links for more information.

-  [Ontario Works](https://www.ontario.ca/page/ontario-works)
-  [Ontario Disability Support Program](https://www.ontario.ca/page/ontario-disability-support-program)

The original files were downloaded from the Government of Ontario's Data 
Catalogue pages for [Social Assistance Caseloads](https://data.ontario.ca/dataset/social-assistance-caseloads)
and [Ontario Social Assistance case characteristics by census metropolitan area](https://data.ontario.ca/dataset/ontario-social-assistance-case-characteristics-by-census-metropolitan-area).
The downloaded original files are found at [ONT-SA/original/](ONT-SA/original/). 
The script used to prepare the files are found at [ONT-SA/prep-ONT-SA.R](ONT-SA/prep-ONT-SA.R).


### Social Assistance caseloads

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
  *  NA mean not available.

#### Notes

*  1969 to 1998: Include recipients of General Welfare Assistance and Family 
Benefits as well as recipients of Foster Care and Handicapped Children's 
benefits.   
*  1998: The Ontario Works Act was proclaimed on May 1, 1998 and replaced the 
General Welfare Assistance Act . The Ontario Disability Support Program was
proclaimed on June 1,1998 and replaced the Family Benefits Act.     
*  1998 to current: Data as from April 1998 include recipients of Ontario Works,
Ontario Disability Support Program, Temporary Care Assistance, and Assistance for 
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
for ODSP cases across Ontario
*  [**ont-sa-characteristic-ow-cma.csv**](ONT-SA/ont-sa-characteristic-ow-cma.csv) 
for ODSP cases by CMA
*  [**ont-sa-characteristic-ow-ont.csv**](ONT-SA/ont-sa-characteristic-ow-ont.csv)
for ODSP cases across Ontario

#### Attributes

*  **year**
    *  2003 to 2026
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
*  **moa60**: Number of cases whose length is 60 months or longer

_For OW cases:_

*  **moa04**: Number of cases whose length is 4 months or shorter
*  **moa512**: Number of cases whose length is between 5 and 12 months 
*  **moa1318**: Number of cases whose length is between 13 and 18 months 
*  **moa19**: Number of cases whose length is 19 months or longer

#### Notes

*  The size of the family is determined by the total number of individuals 
(primary applicant, spouse, dependent children, and dependent adults) in the 
household.
*  Length of a case is number of consecutive months on assistance as of 
specified "month".
*  The attribute descriptions and notes are retrieved from the 
[data dictionary](ONT-SA/original/characteristics_data_dictionary_en.xlsx).

## Ontario School Data Files

The files in [ONT-SCHOOL](ont-school/) contain data about publicly funded 
Ontario schools (public, Catholic, and some non-standard schools) from 
kindergarten to grade 12. The original data files were retrieved from the 
following links.

-  [School information and student demographics](https://data.ontario.ca/dataset/school-information-and-student-demographics)
-  [Enrolment by grade in elementary schools](https://data.ontario.ca/dataset/enrolment-by-grade-in-elementary-schools)
-  [Enrolment by grade in secondary schools](https://data.ontario.ca/dataset/enrolment-by-grade-in-secondary-schools)
-  [Course enrolment in secondary schools](https://data.ontario.ca/dataset/course-enrolment-in-secondary-schools)

The downloaded original files are found at [ONT-SCHOOL/original/](ONT-SCHOOL/original/). 
The script used to prepare the files are found at [ONT-SCHOOL/prep-ONT-SCHOOL.R](ONT-SCHOOL/prep-ONT-SCHOOL.R).
Note that school information data are school-level information, enrolment by 
grade data are aggregated by school board, and course enrolment data are 
aggregated across the province.

### School information and student demographic

The file [**"ont-school-demo-info.csv"**](ONT-SCHOO/ont-school-demo-info.csv) 
contains basic school information and a few student demographic indicators from
2017-2018 to 2024-2025 academic years. 

#### Attributes

_Basic school information:_
*  **year**: Academic year
    *  "2017-2018" to "2024-2025"
*  **board_number**: Unique identifier for each school board
*  **board_name**: Name of school board
*  **board_type**: Type of school board
    *  "Pub Dist Sch Brd (E/F)": Public district school board (English or French)
    *  "Cath Dist Sch Brd (E/F)": Catholic district school board (English or French)
    *  "Provincial/Hospital": Special provincial schools or hospital school authorities
    *  "Consortium": Special education school
    *  "Sec Sch Brd (Sch Auth)": Secondary school board (school authority)
    *  "Public School Board": Public school board
    *  "Prot Sep Sch Brd (Sch Auth)": Protestant separate school board (school authority)
    *  "College (Misc Board)": College (miscellaneous board)
*  **school_number**: Unique identifier for each school
*  **school_name**: Name of school
*  **school_type**: Type of school
    *  "Public"
    *  "Catholic"
    *  "Hospital"
    *  "Provincial"
    *  "Protestant Separate"
*  **school_special_condition_code**: Indicates whether the school operates under non-standard circumstances
    *  "Not applicable": Standard schools
    *  "Junior High School"
    *  "Demonstration"
    *  "Alternative"
    *  "Deaf/Blind"
    *  "Deaf"
    *  "Blind"
    *  "Adult"
    *  "Vocational/Occupational"
    *  "Continuing Education"
    *  "Online School"
*  **school_level**: Level of school
    *  "Elementary"
    *  "Secondary"
*  **grade_range**: Range of grade
*  **street**: School address - street
*  **municipality**: School address - municipality
*  **city**: School address - city
*  **postal_code**: School address - postal code
*  **enrolment**: Number of students enrolled in the academic year
*  **latitude**: Geographic location - latitude
*  **longitude**: Geographic location - longitude

_Student demographic indicators:_

*  **percentage_of_students_whose_first_language_is_not_english**
*  **percentage_of_students_whose_first_language_is_not_french**
*  **percentage_of_students_who_are_new_to_canada_from_a_non_english_speaking_country**
*  **percentage_of_students_who_are_new_to_canada_from_a_non_french_speaking_country**
*  **percentage_of_students_receiving_special_education_services**
*  **percentage_of_students_identified_as_gifted**
*  **percentage_of_grade_3_students_achieving_the_provincial_standard_in_reading**
*  **percentage_of_grade_3_students_achieving_the_provincial_standard_in_writing**
*  **percentage_of_grade_3_students_achieving_the_provincial_standard_in_mathematics**
*  **percentage_of_grade_6_students_achieving_the_provincial_standard_in_reading**
*  **percentage_of_grade_6_students_achieving_the_provincial_standard_in_writing**
*  **percentage_of_grade_6_students_achieving_the_provincial_standard_in_mathematics**
*  **percentage_of_grade_9_students_achieving_the_provincial_standard_in_academic_mathematics**
*  **percentage_of_grade_9_students_achieving_the_provincial_standard_in_applied_mathematics**
*  **percentage_of_grade_9_students_achieving_the_provincial_standard_in_mathematics**
*  **percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt**
*  **percentage_of_school_aged_childrent_who_live_in_low_income_households**
*  **percentage_of_students_whose_parents_have_no_degree_diploma_or_certificates**

#### Notes

*  OSSLT stands for Ontario Secondary School Literacy Test. You can find more 
information at [here](https://www.eqao.com/the-assessments/osslt/).
*  To protect privacy of students, data are not reported when there are fewer
than 10 individuals represented. In certain cases, 0 reported in the data may
not be 0 but small values rounded down to 0 randomly. Similarly, indicators 
recorded as 100 percent may be results of values being randomly rounded up.
*  Grade range 9-12 may include pre-grade 9.


### Enrolment by grade data

The files [**"ont-school-enrlmnt-elementary.csv"**](ONT-SCHOOL/ont-school-enrlmnt-elementary.csv)
and [**"ont-school-enrlmnt-secondary.csv"**](ONT-SCHOOL/ont-school-enrlmnt-secondary.csv)
contain enrolment information by grade for each school board from 2011-2012 to
2024-2025 academic years.

#### Attributes

*  **year**: Academic year
    *  "2011-2012" to "2024-2025"
*  **board_number**: Unique identifier for each school board (same as above)
*  **board_name**: Name of school board (same as above)
*  **board_type**: Type of school board (same as above)
*  **total_enrolment**

_Elementary schools:_

*  **junior_kindergarten_enrolment**
*  **kindergarten_enrolment**
*  **grade_1_enrolment**
*  **grade_2_enrolment**
*  **grade_3_enrolment**
*  **grade_4_enrolment**
*  **grade_5_enrolment**
*  **grade_6_enrolment**
*  **grade_7_enrolment**
*  **grade_8_enrolment**

_Secondary schools:_

*  **grade_9_enrolment**
*  **grade_10_enrolment**
*  **grade_11_enrolment**
*  **grade_12_enrolment**

### Course enrolment in secondary schools data

The file [**"ont-school-enrlmnt-secondary-courses.csv"**](ONT-SCHOOL/ont-school-enrlmnt-secondary-courses.csv)
contain course enrolment information across the province from 2011-2012 to
2024-2025 academic years.

#### Attributes

*  **year**: Academic year
    *  "2011-2012" to "2024-2025"
*  **course_code**
*  **course_description**
*  **grade**
*  **pathway_or_destination**
*  **enrolment**

