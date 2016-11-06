REGISTER /usr/local/pig/lib/piggybank.jar

DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();

row_data = LOAD '/user/acadgild/hadoop/project2_1/flume_import/StatewiseDistrictwisePhysicalProgress.xml' using org.apache.pig.piggybank.storage.XMLLoader('row') as (x:chararray);

filter_data = FILTER row_data BY (XPath(x, 'row/Project_Performance-IHHL_BPL') == XPath(x, 'row/Project_Objectives_IHHL_BPL'));

result = FOREACH filter_data GENERATE XPath(x, 'row/District_Name');

STORE result INTO '/user/acadgild/hadoop/project2_1/output';
