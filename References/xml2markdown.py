#   =========================================================================================================================================
#   =================================== Extract Data from XML files and create Markdown Reference Sheets.   =================================
#   =========================================================================================================================================

#   I hate XML!

#   =========
#   LIBRARIES
#   =========

import pandas                   # For fancy dataframes.
import pandas_read_xml as pdx   # To convert XML to fancy dataframes.

#   =============
#   READ XML FILE
#   =============

enumerationsDataFrame = pdx.read_xml(
    "Ref_Enumerations.xml", ["root", "enumerations", "enumeration"])

statObjectDefsDataFrame = pdx.read_xml(
    "Ref_StatObjectDefinitions.xml", ["root", "stat_object_definitions", "stat_object_definition"])

#   ======================
#   CREATE MARKDOWN TABLES
#   ======================

#   Enumerations.md
#   ===============

#       Markdown header
#       ---------------

enumerationsMarkdownContent = "# Reference: Enumerations\n\n---\n\n"

#       Table of Contents
#       -----------------

# e.g. string:  - [Surface Type](#surface-type)
for index, content in enumerationsDataFrame.iterrows():
    enumerationsMarkdownContent += "- [" + content["@name"] + \
        "]" + "(#" + content["@name"].replace(" ", "-") + ")\n"

enumerationsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

#   Extract data as dataframe
for index, content in enumerationsDataFrame.iterrows():
    try:
        itemDataFrame = pandas.DataFrame.from_dict(content["items"]["item"])
    except ValueError:  # For Act and SkillElements that have only one entry.
        itemDataFrame = pandas.DataFrame([{"@index": 0, "@value": 1}])

#   Create markdown tables from dataframe
    enumerationsMarkdownContent += "## " + content["@name"] + "\n\n" + \
        pandas.DataFrame.to_markdown(itemDataFrame) + "\n\n"

#   StatObjectDefinitions.md
#   ========================

#       Markdown header
#       ---------------

statObjectDefsMarkdownContent = "# Reference: Stat Object Definitions\n\n---\n\n"

#       Table of Contents
#       -----------------

#   Reduced data-frame
statObjectDefsDataFrame = statObjectDefsDataFrame[[
    "@name", "@category", "field_definitions"]]

#   e.g.string:   - [ItemCombo: ItemComboProperties](#itemcombo-itemcomboproperties)
for index, content in statObjectDefsDataFrame.iterrows():
    text = content["@category"] + ": " + content["@name"]
    statObjectDefsMarkdownContent += "- [" + \
        text + "](#" + text.replace(" ", "-") + ")\n"

statObjectDefsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

for index, content in statObjectDefsDataFrame.iterrows():

    #   Markdown table-title
    statObjectDefsMarkdownContent += "## " + \
        content["@category"] + ": " + content["@name"] + "\n\n"

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
    ignore_cols = ["stat_descriptions", "local_sub_category", "@is_internal"]
    for ignore in ignore_cols:
        if ignore in cols:
            fieldDefsDataFrame = fieldDefsDataFrame.drop(columns=ignore)
    #       Replace NaN with empty string
    fieldDefsDataFrame = fieldDefsDataFrame.fillna("")

    #   Add links to Enumerations.md
    if "@enumeration_type_name" in cols:
        fieldDefsDataFrame["@enumeration_type_name"] = "[" + fieldDefsDataFrame["@enumeration_type_name"] + \
            "](Enumerations.md#" + \
            fieldDefsDataFrame["@enumeration_type_name"].str.replace(
                " ", "-") + ")"
    #   Remove bad-links
    fieldDefsDataFrame = fieldDefsDataFrame.replace("[](Enumerations.md#)", "")

    #   Move @description column to the end
    if "@description" in cols:
        cols.pop(cols.index("@description"))
        fieldDefsDataFrame = fieldDefsDataFrame[cols + ["@description"]]

    #   Create markdown table
    statObjectDefsMarkdownContent += pandas.DataFrame.to_markdown(
        fieldDefsDataFrame) + "\n\n"

#   Extra pedantic removal of the last "\n"
enumerationsMarkdownContent = enumerationsMarkdownContent.rstrip() + "\n"
statObjectDefsMarkdownContent = statObjectDefsMarkdownContent.rstrip() + "\n"

#   ===================
#   WRITE MARKDOWN FILE
#   ===================

#   Write Enumerations.md
with open("Enumerations.md", "w") as markdownFileEnumerations:
    markdownFileEnumerations.write(enumerationsMarkdownContent)
markdownFileEnumerations.close()

#   Write StatObjectDefinitions.md
with open("StatObjectDefinitions.md", "w") as markdownFilestatObjectDefs:
    markdownFilestatObjectDefs.write(statObjectDefsMarkdownContent)
markdownFilestatObjectDefs.close()

#   ########################################################################################################################################
