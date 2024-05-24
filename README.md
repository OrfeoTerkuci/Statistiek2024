# Statistics 2024

Data can be found in `assets/heart.csv`.

Variables:

1. *`id`*: identification number
2. *`age`*: age of the patient at hospital admission
3. *`gender`*: gender of the patient: ‘0’ = man, ‘1’ = woman
4. *`hr`*: initial heart rate: beats per minute
5. *`bmi`*: BodyMassIndex: kg/m2
6. *`cvd`*: history of cardiovascular disease: '0' = no, '1' = yes
7. *`sho`*: cardiogenic shock: '0' = no, '1' = yes
8. *`mitype`*: type of myocardial infarction (pathological): '0' = no presence of Q wavelengths, '1' = presence of Q wavelengths
9. *`los`*: duration of hospital stay, in days
10. *`dstat`*: hospital discharge status: '0' = alive, '1' = dead
11. *`lenfol`*: total duration of follow-up: number of days from hospital admission to the date of the last follow-up
12. *`fstat`*: status at last follow-up: '0' = alive, '1' = dead.

## Questions

1. Study and discuss the distribution of the variable separately. Discuss appropriate graphics for this purpose performances. Also formally check whether the data is normally distributed. If this is not the case, in what way do the data deviate from normally distributed facts. Can you transform the data into normally distributed data? Discuss
    - Code for this question is in `src/Q1.r`
2. Check whether there is a connection between the type of myocardial infarction and the discharge status from the hospital after admission. Perform an appropriate test.
    - Code for this question is in `src/Q2.r`
3. Can you predict the BMI from the patient's age? Answer this question thoroughly
and as complete as possible.
    - Code for this question is in `src/Q3.r`

All the graphs used in the `Report.pdf` can be found in `assets/graphs`. There are two subfolders, one for the graphs of the first two questions regarding the `los` variable, and one for the last question regarding the connection between `age` and `bmi`.
