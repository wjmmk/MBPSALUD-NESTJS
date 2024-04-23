import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PatientsModule } from './patients/patients.module';
import { DoctorsModule } from './doctors/doctors.module';
import { MedicalCenterModule } from './medical-center/medical-center.module';
import { ClinicalHistoriesModule } from './clinical-histories/clinical-histories.module';
import { MedicinesModule } from './medicines/medicines.module';
import { UserManagerModule } from './user-manager/user-manager.module';

@Module({
  imports: [PatientsModule, DoctorsModule, MedicalCenterModule, ClinicalHistoriesModule, MedicinesModule, UserManagerModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
