#   =================================== Extract Data from XML files and create Markdown Reference Sheets.   =================================

#   =========
#   LIBRARIES
#   =========

import xmltodict                # To convert XML to dictionaries.
from tomark import Tomark       # To convert dictionaries to Markdown tables.

#   =============
#   READ XML FILE
#   =============

with open("Ref_Enumerations.xml") as xmlFileEnumerations:
    xmlDictEnumerations = xmltodict.parse(xmlFileEnumeration.read())
xmlFileEnumerations.close()

with open("Ref_StatObjectDefinitions.xml") as xmlFileSODs:
    xmlDictSODs = xmltodict.parse(xmlFileSODs.read())
xmlFileSODs.close()

#   ======================
#   CREATE MARKDOWN TABLES
#   ======================

#   Enumerations.md
#   ===============

enumerationsMarkdown = "# Reference: Enumerations\n\n---\n\n"

for i in xmlDictEnumerations["root"]["enumerations"]["enumeration"]:
    dictionaryList = []
    if isinstance(i["items"]["item"], list):
        for j in i["items"]["item"]:
            dictionaryList.append(j)
    else:
        dictionaryList.append(i["items"]["item"])
    
    enumerationsMarkdown += "## " + i["@name"] + "\n\n"
    markdownTable = Tomark.table(dictionaryList)
    enumerationsMarkdown += markdownTable + "\n"

#   StatObjectDefinitions.md
#   ========================

SODsMarkdown = "# Reference: Stat Object Definitions\n\n---\n\n"

for i in xmlDictSODs["root"]["stat_object_definitions"]:
    for j in xmlDictSODs["root"]["stat_object_definitions"][i]:
        dictionaryList = []
        fieldDictList = ["@name", "@display_name", "@export_name", "@type", "@enumeration_type_name", "@description"]
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
    markdownFileEnumerations.write(enumerationsMarkdown)
markdownFileEnumerations.close()

with open("StatObjectDefinitions.md", "w") as markdownFileSODs:
    markdownFileSODs.write(SODMarkdown)
markdownFileSODs.close()


#   ########################################################################################################################################