
----------------------------------------------
start history server
---------------------------------------------
mr-jobhistory-daemon.sh start historyserver

--------------------------------------------
using flume to store the data to HDFS
-------------------------------------------
flume-ng agent --name agent1 --conf-file filecopy.conf

--------------------------------------------
then run the Pig Latin script 
-------------------------------------------

pig -f  project2_1.pig

------------------------------
create the DB and table in mysql
-------------------------------
sudo service mysqld start
mysql -u root -p

mysql> create database testDB;

mysql> use testDB;
mysql> create table distTable(dist char(150));
mysql>grant all privileges on testDB.* to ''@localhost;
mysql>exit;

-----------------------------------------
export sqoop
-----------------------------------------
sqoop export --connect jdbc:mysql://localhost/testDB --table distTable --export-dir /user/acadgild/hadoop/project2_1/output/part-m-00000

----------------------------------------
test the table
---------------------------------------
mysql -u root -p

mysql> use testDB;
mysql> select * from distTable
    -> ;
+-----------------------------+
| dist                        |
+-----------------------------+
| KULLU                       |
| LAHAUL & SPITI              |
| SHIMLA                      |
| SOLAN                       |
| UNA                         |
| DEOGHAR                     |
| LOHARDAGA                   |
| HASSAN                      |
| MANGALORE(DAKSHINA KANNADA) |
| UDUPI                       |
| ALAPPUZHA                   |
| KOLLAM                      |
| KOTTAYAM                    |
| KOZHIKODE                   |
| PALAKKAD                    |
| PATHANAMTHITTA              |
| WAYANAD                     |
| GADCHIROLI                  |
| NIZAMABAD                   |
| TIRAP                       |
| HAILAKANDI                  |
| MADHUBANI                   |
| NORTH GOA                   |
| AHMEDABAD                   |
| DANGS                       |
| NAVSARI                     |
| PORBANDAR                   |
| SURAT                       |
| FARIDABAD                   |
| HISAR                       |
| JHAJJAR                     |
| MAHENDRAGARH                |
| PANCHKULA                   |
| PANIPAT                     |
| ROHTAK                      |
| SIRSA                       |
| HAMIRPUR                    |
| KINNAUR                     |
| BAREILLY                    |
| BIJNOR                      |
| BUDAUN                      |
| ETAWAH                      |
| FARRUKHABAD                 |
| FIROZABAD                   |
| GHAZIABAD                   |
| HARDOI                      |
| JYOTIBA PHULE NAGAR         |
| LUCKNOW                     |
| MAHARAJGANJ                 |
| MAHOBA                      |
| MORADABAD                   |
| MUZAFFARNAGAR               |
| PILIBHIT                    |
| SONBHADRA                   |
| SULTANPUR                   |
| SINDHUDURG                  |
| WEST GARO HILLS             |
| CHAMPHAI                    |
| LAWNGTLAI                   |
| HANUMANGARH                 |
| ERODE                       |
| KARUR                       |
| NAMAKKAL                    |
| TIRUCHIRAPPALLI             |
| TIRUVANNAMALAI              |
| DHALAI                      |
| SOUTH TRIPURA               |
| WEST TRIPURA                |
| AMBEDKAR NAGAR              |
| BALRAMPUR                   |
+-----------------------------+
70 rows in set (0.00 sec)

mysql>exit;
-------------------------------
stop mysql server
-------------------------------
sudo service mysqld stop

------------------------------
stop history server
-----------------------------
mr-jobhistory-daemon.sh stop historyserver
