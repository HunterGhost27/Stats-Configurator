#   =========================================================================================================================================
#   ===================================         Extract Data from XML files and create Lua Tables.          =================================
#   =========================================================================================================================================

#   I hate XML.

#   =========
#   LIBRARIES
#   =========

import pandas                   # For fancy dataframes.
import pandas_read_xml as pdx   # To convert XML to fancy dataframes.

#   =============
#   READ XML FILE
#   =============

enumerationsDataFrame = pdx.read_xml(
    "xml/Enumerations.xml", ["root", "enumerations", "enumeration"])

statObjectDefsDataFrame = pdx.read_xml(
    "xml/StatObjectDefinitions.xml", ["root", "stat_object_definitions", "stat_object_definition"])

#   ==================
#   WRITE LUA CONTENTS
#   ==================

#   Enumerations
#   ------------

luaTableContents = "References = {\n\t[\"Enumerations\"] = {\n"

for index, content in enumerationsDataFrame.iterrows():
    #   Extract dataframe
    luaTableContents += "\t\t[\"" + content["@name"] + "\"] = {\n"
    try:
        itemDataFrame = pandas.DataFrame.from_dict(content["items"]["item"])
    except ValueError:  # For Act and SkillElements that have only one entry.
        itemDataFrame = pandas.DataFrame([{"@index": 0, "@value": 1}])

    #   Extract item-list
    extract = []
    for i, value in itemDataFrame.iteritems():
        extract = value.to_list()

    #   Build lua-table
    for j in range(len(extract)):
        luaTableContents += "\t\t\t[" + \
            str(j) + "] = \"" + str(extract[j]) + "\",\n"

    luaTableContents += "\t\t},\n"
luaTableContents += "\t},\n"

#   Stat Object Definitions
#   -----------------------

luaTableContents += "\t[\"StatObjectDefinitions\"] = {\n"

for index, content in statObjectDefsDataFrame.iterrows():
    luaTableContents += "\t\t[\"" + content["@name"] + "\"] = {\n"

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

    #   make string compatible with lua's table format
    for key, value in fieldDefsDataFrame.iterrows():
        string = value.to_json(orient="index")
        replaceStrList = [
            (":", " = "),  # Replace : with =
            (",", ", "),  # Add spaces after , for readability
            #   Add [] around keys
            ("\"@name\"", "[\"@name\"]"),
            ("\"@type\"", "[\"@type\"]"),
            ("\"@description\"", "[\"@description\"]"),
            ("\"@enumeration_type_name\"", "[\"@enumeration_type_name\"]"),
            ("\"@export_type\"", "[\"@export_type\"]"),
            ("\"@table_name\"", "[\"@table_name\"]")
        ]
        for k, v in replaceStrList:
            string = string.replace(k, v)

        #   Build table-entries
        luaTableContents += "\t\t\t[" + str(key) + "] = " + string + ",\n"
    luaTableContents += "\t\t},\n"
luaTableContents += "\t},\n"

luaTableContents += "}"

#   ==============
#   WRITE LUA FILE
#   ==============

with open("lua/References.lua", "w") as luaFile:
    luaFile.write(luaTableContents)
luaFile.close()

#   #########################################################################################################################################
