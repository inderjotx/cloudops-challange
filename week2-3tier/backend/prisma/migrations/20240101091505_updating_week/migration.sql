/*
  Warnings:

  - You are about to alter the column `week` on the `Project` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.

*/
-- AlterTable
ALTER TABLE `Project` MODIFY `week` INTEGER NOT NULL;