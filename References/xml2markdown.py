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
    enumerationsMarkdownContent += "(#" + name.replace(" ", "-") + ")" + "\n"
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

SODsMarkdown = "# Reference: Stat Object Definitions\n\n---\n\n## Table of Contents\n\n"

#       Markdown Content
#       ----------------

for i in xmlDictSODs["root"]["stat_object_definitions"]:
    for j in xmlDictSODs["root"]["stat_object_definitions"][i]:
        dictionaryList = []
        fieldDictList = [
            "@name",
            # "@display_name",
            # "@export_name",
            "@type",
            "@enumeration_type_name",
            "@description"]
        for k in j["field_definitions"]["field_definition"]:
            tempDict = {}
            for l in fieldDictList:
                try:
                    tempDict[l] = k[l]
                except KeyError:
                    tempDict[l] = ""
            dictionaryList.append(tempDict)

        SODsMarkdown += "## " + j["@category"] + ": " + j["@name"] + "\n\n"
        SODsMarkdownTable = Tomark.table(dictionaryList)
        SODsMarkdown += SODsMarkdownTable + "\n"

#   ===================
#   WRITE MARKDOWN FILE
#   ===================

with open("Enumerations.md", "w") as markdownFileEnumerations:
    markdownFileEnumerations.write(enumerationsMarkdownContent)
markdownFileEnumerations.close()

with open("StatObjectDefinitions.md", "w") as markdownFileSODs:
    markdownFileSODs.write(SODsMarkdown)
markdownFileSODs.close()

#   ########################################################################################################################################
