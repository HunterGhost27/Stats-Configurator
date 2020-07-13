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

nameAndCategory = SODsDataFrame[["@name", "@category"]]
for index, content in nameAndCategory.iterrows():
    text = content["@category"] + ": " + content["@name"]
    SODsMarkdownContent += "- [" + text + \
        "](#" + text.replace(" ", "-") + ")\n"
SODsMarkdownContent += "\n---\n\n"

#       Markdown Content
#       ----------------

for i in xmlDictSODs["root"]["stat_object_definitions"]["stat_object_definition"]:
    dictionaryList = []
    fieldDictList = [
        "@name",
        # "@display_name",
        # "@export_name",
        "@type",
        "@enumeration_type_name",
        "@description"]
    for j in i["field_definitions"]["field_definition"]:
        tempDict = {}
        for k in fieldDictList:
            try:
                tempDict[k] = j[k]
            except KeyError:
                tempDict[k] = ""
        dictionaryList.append(tempDict)

    SODsMarkdownContent += "## " + \
        i["@category"] + ": " + i["@name"] + "\n\n"
    SODsMarkdownContentTable = Tomark.table(dictionaryList)
    SODsMarkdownContent += SODsMarkdownContentTable + "\n"

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
