#   =========================================================================================================================================
#   ===================================         Extract Data from XML files and create JSON Files.          =================================
#   =========================================================================================================================================

#   I hate XML.

#   =========
#   LIBRARIES
#   =========

import pandas                   # For fancy dataframes.
import pandas_read_xml as pdx   # To convert XML to fancy dataframes.
import json                     # For JSON

#   =============
#   READ XML FILE
#   =============

statObjectDefsDataFrame = pdx.read_xml(
    "xml/StatObjectDefinitions.xml", ["root", "stat_object_definitions", "stat_object_definition"])

#   ===================
#   WRITE JSON CONTENTS
#   ===================

#   Stat Object Definitions
#   -----------------------

jsonContent = {}
maps = {}
for index, content in statObjectDefsDataFrame.iterrows():

    #   Extract data as data-frame
    fieldDefsDataFrame = pandas.DataFrame.from_dict(
        content["field_definitions"]["field_definition"])
    #   Clean dataframe
    #       Drop redundant names
    fieldDefsDataFrame = fieldDefsDataFrame.drop(
        columns=["@display_name", "@export_name"])
    #       Drop empty columns
    fieldDefsDataFrame = fieldDefsDataFrame.dropna(how="all")
    #       Drop columns in ignore_cols list
    cols = list(fieldDefsDataFrame.columns.values)
    ignore_cols = ["stat_descriptions", "local_sub_category",
                   "@loca_sub_category", "@is_internal", "@description"]
    for ignore in ignore_cols:
        if ignore in cols:
            fieldDefsDataFrame = fieldDefsDataFrame.drop(columns=ignore)
    #       Replace NaN with empty string
    fieldDefsDataFrame = fieldDefsDataFrame.fillna("")

    for key, value in fieldDefsDataFrame.iterrows():
        if value['@type'] == 'Enumeration':
            jsonContent[value['@name']] = value['@type'] + \
                ":" + value['@enumeration_type_name']
        else:
            jsonContent[value['@name']] = value['@type']

    maps[content['@name']] = list(fieldDefsDataFrame['@name'])

with open("json/StatObjectDefinitions.json", "w") as jsonFile:
    jsonFile.write(json.dumps(jsonContent))
jsonFile.close()

with open("json/AttributeMaps.json", "w") as mapFile:
    mapFile.write(json.dumps(maps))
mapFile.close()

#   #########################################################################################################################################
