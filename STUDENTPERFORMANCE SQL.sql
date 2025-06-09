SELECT * FROM studentperformancefactors;
SELECT count(*) FROM studentperformancefactors;
SELECT distinct(Gender) FROM studentperformancefactors;
# Clean the dataset 
#To rename
alter table studentperformancefactors
rename column Previous_Scores to Previous_Exam_scores;

#To Remove duplicates
select count(*) from studentperformancefactors
group by Attendance
having count(*)>1;

# to check Null and Not Null
select * from studentperformancefactors
where Parental_Education_Level  is not null;
select * from studentperformancefactors
where Parental_Education_Level  is null;
select * from studentperformancefactors
where Parental_involvement is not null;

#to sort and filter
# What is the average current exam score and previous by gender?
select Gender, avg(Current_Exam_Score) avg_Current_Exam_Score, 
avg(Previous_Exam_Scores) avg_Previous_Exam_Scores 
from studentperformancefactors 
group by Gender;
 
 #Which schools have the highest average exam scores?
select School_Type, avg(Current_Exam_Score) avg_Current_Exam_Score,
avg(Previous_Exam_Scores) avg_Previous_Exam_Scores 
from studentperformancefactors 
group by School_Type;

# disparity btw current and previous score
select Hours_Studied, avg(Current_Exam_Score) avg_Current_Exam_Score,
avg(Previous_Exam_Scores) avg_Previous_Exam_Scores 
from studentperformancefactors 
group by Hours_Studied;

# high sleep hour current and previous score
select Sleep_Hours, avg(Current_Exam_Score) avg_Current_Exam_Score,
avg(Previous_Exam_Scores) avg_Previous_Exam_Scores 
from studentperformancefactors 
where Sleep_Hours > 5
group by Sleep_Hours;

select Access_to_Resources, avg(Current_Exam_Score) avg_Current_Exam_Score,
avg(Previous_Exam_Scores) avg_Previous_Exam_Scores 
from studentperformancefactors 
where Access_to_Resources = "High"
group by Access_to_Resources;

#low sleep hour by score
select Sleep_Hours, avg(Current_Exam_Score) avg_Current_Exam_Score,
avg(Previous_Exam_Scores) avg_Previous_Exam_Scores 
from studentperformancefactors 
where Sleep_Hours < 5
group by Sleep_Hours;
#What is the total number of students in each school?
select  School_Type, count(Attendance) from studentperformancefactors
group by School_Type;

#What is the average study time by parental involvement level?
select Parental_involvement, avg(Hours_Studied) as avg_studied_time
from studentperformancefactors
group by Parental_Involvement;

# What is the average score for students who attend at least 2 tutor sessions?
select max(Tutoring_Sessions) from studentperformancefactors;
 
 #What is the total study time by school?
 select School_type,avg(Hours_Studied) as avg_studied_time
from studentperformancefactors
group by School_Type;

# What is the attendance rate by school type?
select count(Attendance),School_Type  
from studentperformancefactors
 group by School_type; 
 
 # . What is the average improvement (current score - previous score) by school?
 select School_Type,avg(Previous_Exam_Scores - Current_Exam_Score) as  Avg_improvement
 from studentperformancefactors
 group by School_Type;
 
 #Which gender improved the most between exams?
 select Gender, avg(Previous_Exam_Scores - Current_Exam_Score) as  Avg_improvement_Gender
 from studentperformancefactors
 group by Gender;
 
 #What is the percentage of students attending tutoring sessions in each school?
 select School_Type, count(Tutoring_Sessions)*100.0/count(Attendance)  as SCh_tutoring_Attendance from 
 studentperformancefactors
 group by  School_Type;
 
 # what is  the persentage  max studied hour  for current and previous score
  select School_Type, max(Hours_Studied)*100.0/avg(Current_Exam_Score)  as SCh_higest_studies from 
 studentperformancefactors
 group by  School_Type;
 
  select School_Type, max(Hours_Studied)*100.0/avg(Previous_Exam_Scores) as SCh_highest_studies from 
 studentperformancefactors
 group by  School_Type;
 

    