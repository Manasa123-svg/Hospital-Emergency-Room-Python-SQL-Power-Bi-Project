

select * from hospital_data;

--- number of patients

 select count(patient_id) as no_of_patients
 from hospital_data;

---avg wait time

 select avg(patient_waittime) as avg_patient_waittime
 from hospital_data;

---patient satisfaction score

  select avg(patient_satisfaction_score) as avg_patient_satisfaction_Score
  from hospital_data;

--- no of patients are referred

  select count(department_referral) as no_of_patients_are_referred
  from hospital_data
  where department_referral <> 'None'

---no of patients by patient race

  select patient_race ,count(patient_id) as number_of_patients
  from hospital_data
  group by  1

---no of patients by age group

   select patient_age_group,count(patient_id) as number_of_patients
   from hospital_data
   group by 1

---no of patients by department referral

   select department_referral,count(patient_id) as no_of_patients
   from hospital_data
   group by 1

---no of patients by day and hour

  select wait_time_interval as hours,count(patient_id)
  as number_of_patient
  from hospital_data
  group by 1
  order by 1 asc
  
-- no of patients by daily

  select admision_day_name, count(patient_id) as number_of_patients
  from hospital_data
  group by 1
  order by 2 desc;

-- no of patients by gender

  select patient_gender, count(patient_id) as number_of_patients,
  Round(
         count(patient_id) * 100.0 / sum(count(patient_id)) over() ,2
  ) as percentage
  from hospital_data
  group by 1
  order by 2 desc;


--patient admision status

  select patient_admission_status, count(patient_id) as number_of_patients,
  Round(
       count(patient_id) * 100.0 / sum(count(patient_id)) over() ,2 
  ) as percentage 
  from hospital_data
  group by 1

-- % patients seen  daily 30 minutes

  select
  wait_time_status, 
  count(patient_id) as number_of_patients,
  Round(
      count(patient_id) * 100.0 / sum(count(patient_id)) over (),
	  2
	  ) as percentage
  from hospital_data
  group by 1
 
 
 

  