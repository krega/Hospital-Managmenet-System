/**
 * Created by BRITENET on 26.11.2019.
 */

global class HMS_DoctorBatchSchedule implements Schedulable{


/*
    HMS_DoctorBatchSchedule batchSchedule = new HMS_DoctorBatchSchedule();
    String cronExp = '0 0 23 * * * ?';
   System.schedule('Batch Schedule', cronExp , batchSchedule);*/

        global void execute(SchedulableContext schedulableContext){
            HMS_DoctorBatch batch = new HMS_DoctorBatch();
            Database.executeBatch(batch, 200);
        }



}