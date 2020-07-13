#   =================================== Extract Data from XML files and create Markdown Reference Sheets.   =================================

#   I hate XML!

#   =========
#   LIBRARIES
#   =========

import pandas                   # For fancy dataframes.
import pandas_read_xml as pdx   # To convert XML to dataframes.

#   =============
#   READ XML FILE
#   =============

enumerationsDataFrame = pdx.read_xml(
    "Ref_Enumerations.xml", ["root", "enumerations", "enumeration"])

statObjectDefsDataFrame = pdx.read_xml("Ref_StatObjectDefinitions.xml", [
    "root", "stat_object_definitions", "stat_object_definition"])

#   ======================
#   CREATE MARKDOWN TABLES
#   ======================

#   Enumerations.md
#   ---------------

enumerationsMarkdownContent = "# Reference: Enumerations\n\n---\n\n## Table of Contents\n\n"

#       Table of Contents
#       -----------------

for index, content in enumerationsDataFrame.iterrows():
    enumerationsMarkdownContent += "- [" + content["@name"] + "]"
    enumerationsMarkdownContent += "(#" + \
        content["@name"].replace(" ", "-") + ")\n"
enumerationsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

for index, content in enumerationsDataFrame.iterrows():
    try:
        itemDataFrame = pandas.DataFrame.from_dict(
            content["items"]["item"])
    except ValueError:
        itemDataFrame = pandas.DataFrame([{"@index": 0, "@value": 1}])

    enumerationsMarkdownContent += "## " + content["@name"] + "\n\n"
    enumerationsMarkdownContent += pandas.DataFrame.to_markdown(
        itemDataFrame) + "\n\n"

#   StatObjectDefinitions.md
#   ------------------------

#       Table of Contents
#       -----------------

statObjectDefsMarkdownContent = "# Reference: Stat Object Definitions\n\n---\n\n## Table of Contents\n\n"

statObjectDefsDataFrame = statObjectDefsDataFrame[[
    "@name", "@category", "field_definitions"]]
for index, content in statObjectDefsDataFrame.iterrows():
    text = content["@category"] + ": " + content["@name"]
    statObjectDefsMarkdownContent += "- [" + text + \
        "](#" + text.replace(" ", "-") + ")\n"
statObjectDefsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

for index, content in statObjectDefsDataFrame.iterrows():
    statObjectDefsMarkdownContent += "## " + \
        content["@category"] + ": " + content["@name"] + "\n\n"
    fieldDefsDataFrame = pandas.DataFrame.from_dict(
        content["field_definitions"]["field_definition"])
    fieldDefsDataFrame = fieldDefsDataFrame.drop(
        columns=["@display_name", "@export_name"])
    fieldDefsDataFrame = fieldDefsDataFrame.dropna(how="all")
    fieldDefsDataFrame = fieldDefsDataFrame.fillna("")
    cols = list(fieldDefsDataFrame.columns.values)
    if "@description" in cols:
        cols.pop(cols.index("@description"))
        fieldDefsDataFrame = fieldDefsDataFrame[cols + ["@description"]]

    statObjectDefsMarkdownContent += pandas.DataFrame.to_markdown(
        fieldDefsDataFrame) + "\n\n"

#   ===================
#   WRITE MARKDOWN FILE
#   ===================

enumerationsMarkdownContent = enumerationsMarkdownContent.rstrip() + "\n"
statObjectDefsMarkdownContent = statObjectDefsMarkdownContent.rstrip() + "\n"

with open("Enumerations.md", "w") as markdownFileEnumerations:
    markdownFileEnumerations.write(enumerationsMarkdownContent)
markdownFileEnumerations.close()

with open("StatObjectDefinitions.md", "w") as markdownFilestatObjectDefs:
    markdownFilestatObjectDefs.write(statObjectDefsMarkdownContent)
markdownFilestatObjectDefs.close()

#   ########################################################################################################################################
