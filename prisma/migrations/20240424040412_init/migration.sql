-- CreateEnum
CREATE TYPE "Status" AS ENUM ('CONFIRM', 'CANCEL', 'POSTPONED');

-- CreateTable
CREATE TABLE "Patients" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "last" TEXT NOT NULL,
    "birthdate" TEXT,
    "email" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "address" TEXT,
    "phone" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Patients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Doctors" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "last" TEXT NOT NULL,
    "specialty" TEXT NOT NULL,
    "phone" TEXT,
    "email" TEXT NOT NULL,
    "age" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Doctors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Medical_Center" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT,

    CONSTRAINT "Medical_Center_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Clinical_Histories" (
    "id" TEXT NOT NULL,
    "fullname" TEXT NOT NULL,
    "consultation_date" TEXT NOT NULL,
    "diagnosis" TEXT NOT NULL,
    "treatment" TEXT NOT NULL,
    "observations" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,
    "appointmentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Clinical_Histories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appointment" (
    "id" SERIAL NOT NULL,
    "patientId" TEXT NOT NULL,
    "doctorId" INTEGER NOT NULL,
    "centermId" INTEGER NOT NULL,
    "phone" TEXT NOT NULL,
    "doctEmail" TEXT NOT NULL,
    "ownerEmail" TEXT NOT NULL,
    "medicalCenterId" INTEGER NOT NULL,
    "dateandhour" TIMESTAMP(3) NOT NULL,
    "state" "Status" NOT NULL,

    CONSTRAINT "Appointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Medicines" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "decription" TEXT NOT NULL,
    "posology" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Medicines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_DoctorsToPatients" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Medical_CenterToPatients" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_MedicinesToPatients" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Patients_email_key" ON "Patients"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Doctors_email_key" ON "Doctors"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Clinical_Histories_appointmentId_key" ON "Clinical_Histories"("appointmentId");

-- CreateIndex
CREATE UNIQUE INDEX "_DoctorsToPatients_AB_unique" ON "_DoctorsToPatients"("A", "B");

-- CreateIndex
CREATE INDEX "_DoctorsToPatients_B_index" ON "_DoctorsToPatients"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Medical_CenterToPatients_AB_unique" ON "_Medical_CenterToPatients"("A", "B");

-- CreateIndex
CREATE INDEX "_Medical_CenterToPatients_B_index" ON "_Medical_CenterToPatients"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MedicinesToPatients_AB_unique" ON "_MedicinesToPatients"("A", "B");

-- CreateIndex
CREATE INDEX "_MedicinesToPatients_B_index" ON "_MedicinesToPatients"("B");

-- AddForeignKey
ALTER TABLE "Clinical_Histories" ADD CONSTRAINT "Clinical_Histories_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES "Patients"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Clinical_Histories" ADD CONSTRAINT "Clinical_Histories_appointmentId_fkey" FOREIGN KEY ("appointmentId") REFERENCES "Appointment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_doctEmail_fkey" FOREIGN KEY ("doctEmail") REFERENCES "Doctors"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_ownerEmail_fkey" FOREIGN KEY ("ownerEmail") REFERENCES "Patients"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_medicalCenterId_fkey" FOREIGN KEY ("medicalCenterId") REFERENCES "Medical_Center"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DoctorsToPatients" ADD CONSTRAINT "_DoctorsToPatients_A_fkey" FOREIGN KEY ("A") REFERENCES "Doctors"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DoctorsToPatients" ADD CONSTRAINT "_DoctorsToPatients_B_fkey" FOREIGN KEY ("B") REFERENCES "Patients"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Medical_CenterToPatients" ADD CONSTRAINT "_Medical_CenterToPatients_A_fkey" FOREIGN KEY ("A") REFERENCES "Medical_Center"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Medical_CenterToPatients" ADD CONSTRAINT "_Medical_CenterToPatients_B_fkey" FOREIGN KEY ("B") REFERENCES "Patients"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MedicinesToPatients" ADD CONSTRAINT "_MedicinesToPatients_A_fkey" FOREIGN KEY ("A") REFERENCES "Medicines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MedicinesToPatients" ADD CONSTRAINT "_MedicinesToPatients_B_fkey" FOREIGN KEY ("B") REFERENCES "Patients"("id") ON DELETE CASCADE ON UPDATE CASCADE;
