#   =================================== Extract Data from XML files and create Markdown Reference Sheets.   =================================

#   I hate XML!

#   =========
#   LIBRARIES
#   =========

import xmltodict                # To convert XML to dictionaries.
from tomark import Tomark       # To convert dictionaries to Markdown tables.

import pandas                   # For fancy dataframes.
import pandas_read_xml as pdx   # To convert XML to dataframes.

#   =============
#   READ XML FILE
#   =============

#   Ref_Enumerations.xml
#   --------------------

with open("Ref_Enumerations.xml") as xmlFileEnumerations:
    xmlDictEnumerations = xmltodict.parse(xmlFileEnumerations.read())
xmlFileEnumerations.close()

enumerationsDataFrame = pdx.read_xml(
    "Ref_Enumerations.xml", ["root", "enumerations", "enumeration"])

#   Ref_StatObjectDefinitions.xml
#   -----------------------------

with open("Ref_StatObjectDefinitions.xml") as xmlFileSODs:
    xmlDictSODs = xmltodict.parse(xmlFileSODs.read())
xmlFileSODs.close()

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

for name in enumerationsDataFrame["@name"].sort_values():
    enumerationsMarkdownContent += "- [" + name + "]"
    enumerationsMarkdownContent += "(#" + name.replace(" ", "-") + ")\n"
enumerationsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

for i in xmlDictEnumerations["root"]["enumerations"]["enumeration"]:
    dictionaryList = []
    if isinstance(i["items"]["item"], list):
        for j in i["items"]["item"]:
            dictionaryList.append(j)
    else:
        dictionaryList.append(i["items"]["item"])

    enumerationsMarkdownContent += "## " + i["@name"] + "\n\n"
    markdownTable = Tomark.table(dictionaryList)
    enumerationsMarkdownContent += markdownTable + "\n"

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
    SODsMarkdownContent += pandas.DataFrame.to_markdown(
        FieldDefsDataFrame) + "\n\n"

#   ===================
#   WRITE MARKDOWN FILE
#   ===================

with open("Enumerations.md", "w") as markdownFileEnumerations:
    markdownFileEnumerations.write(enumerationsMarkdownContent)
markdownFileEnumerations.close()

with open("StatObjectDefinitions.md", "w") as markdownFileSODs:
    markdownFileSODs.write(SODsMarkdownContent)
markdownFileSODs.close()

#   ########################################################################################################################################
