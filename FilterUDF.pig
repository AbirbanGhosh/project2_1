REGISTER '/home/acadgild/workspace/pig-udf.jar';
REGISTER /usr/local/pig/lib/piggybank.jar


DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();
DEFINE filterRecords pigudf.FilterUDF;

row_data = LOAD '/user/acadgild/hadoop/project2_1/flume_import/StatewiseDistrictwisePhysicalProgress.xml' using org.apache.pig.piggybank.storage.XMLLoader('row') as (x:chararray);

filter_data = filter row_data BY filterRecords((int) XPath(x, 'row/Project_Objectives_IHHL_BPL'),(int)  XPath(x, 'row/Project_Performance-IHHL_BPL'));

result = FOREACH filter_data GENERATE XPath(x, 'row/District_Name');

STORE result INTO '/user/acadgild/hadoop/project2_1/output1';
