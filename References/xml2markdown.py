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

SODsDataFrame = pdx.read_xml("Ref_StatObjectDefinitions.xml", [
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

SODsMarkdownContent = "# Reference: Stat Object Definitions\n\n---\n\n## Table of Contents\n\n"

SODsDataFrame = SODsDataFrame[["@name", "@category", "field_definitions"]]
for index, content in SODsDataFrame.iterrows():
    text = content["@category"] + ": " + content["@name"]
    SODsMarkdownContent += "- [" + text + \
        "](#" + text.replace(" ", "-") + ")\n"
SODsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

for index, content in SODsDataFrame.iterrows():
    SODsMarkdownContent += "## " + \
        content["@category"] + ": " + content["@name"] + "\n\n"
    FieldDefsDataFrame = pandas.DataFrame.from_dict(
        content["field_definitions"]["field_definition"])
    FieldDefsDataFrame = FieldDefsDataFrame.drop(
        columns=["@display_name", "@export_name"])
    FieldDefsDataFrame = FieldDefsDataFrame.dropna(how="all")
    FieldDefsDataFrame = FieldDefsDataFrame.fillna("")
    cols = list(FieldDefsDataFrame.columns.values)
    if "@description" in cols:
        cols.pop(cols.index("@description"))
        FieldDefsDataFrame = FieldDefsDataFrame[cols + ["@description"]]

    SODsMarkdownContent += pandas.DataFrame.to_markdown(
        FieldDefsDataFrame) + "\n\n"

#   ===================
#   WRITE MARKDOWN FILE
#   ===================

enumerationsMarkdownContent = enumerationsMarkdownContent.rstrip() + "\n"
SODsMarkdownContent = SODsMarkdownContent.rstrip() + "\n"

with open("Enumerations.md", "w") as markdownFileEnumerations:
    markdownFileEnumerations.write(enumerationsMarkdownContent)
markdownFileEnumerations.close()

with open("StatObjectDefinitions.md", "w") as markdownFileSODs:
    markdownFileSODs.write(SODsMarkdownContent)
markdownFileSODs.close()

#   ########################################################################################################################################
