#!/bin/bash
# ==========================================================
# RS Company File Management System
# Uses basic Linux commands to manage company files
# ==========================================================

BASE_DIR=~/RS_Company
BACKUP_DIR=~/RS_Backup
DATE=$(date +%F)

echo "=== Step 1: Create Company Folder Structure ==="
mkdir -p "$BASE_DIR"/{Finance,HR,Projects,Admin,Archive}
cd "$BASE_DIR" || exit 1
ls -l

echo "=== Step 2: Create Company Files ==="
touch Finance/budget_2026.txt
touch HR/employee_list.txt
touch Projects/project_plan.txt
touch Admin/office_notice.txt

echo "=== Step 3: Add Content to Files ==="
echo "RS Company Annual Budget 2026" > Finance/budget_2026.txt
echo "Employee List - RS Company" > HR/employee_list.txt
echo "Project Plan - Website Upgrade" > Projects/project_plan.txt
echo "Office Notice: Monday meeting at 10 AM" > Admin/office_notice.txt

echo "Q1 Expenses: 150000" >> Finance/budget_2026.txt
echo "Q2 Expenses: 170000" >> Finance/budget_2026.txt

echo "=== Step 4: View Files ==="
cat Finance/budget_2026.txt
head -n 2 HR/employee_list.txt
tail -n 1 Projects/project_plan.txt

echo "=== Step 5: Copy, Move, and Rename ==="
cp Finance/budget_2026.txt Archive/budget_2026_copy.txt
mv Admin/office_notice.txt Archive/
mv Projects/project_plan.txt Projects/project_plan_v1.txt

echo "=== Step 6: Search Files ==="
grep -r "Expenses" "$BASE_DIR"
grep -ril "budget" "$BASE_DIR"
find "$BASE_DIR" -name "*.txt"
find "$BASE_DIR" -type f -mtime -1

echo "=== Step 7: File Information ==="
ls -lh Finance
wc -l Finance/budget_2026.txt
du -sh "$BASE_DIR"/*

echo "=== Step 8: Set Permissions ==="
chmod 640 Finance/budget_2026.txt
chmod 644 HR/employee_list.txt
chmod 755 Projects
ls -l Finance HR

echo "=== Step 9: Backup Company Files ==="
mkdir -p "$BACKUP_DIR"
cp -r "$BASE_DIR" "$BACKUP_DIR/RS_Company_$DATE"
tar -czvf "$BACKUP_DIR/RS_Company_$DATE.tar.gz" -C ~ RS_Company
ls -lh "$BACKUP_DIR"

echo "=== Step 10: Clean Up ==="
rm -f Archive/budget_2026_copy.txt
rm -r "$BACKUP_DIR/RS_Company_$DATE"

echo "=== Step 11: Final Check ==="
cd ~
find RS_Company -print

echo "RS Company file management completed."
