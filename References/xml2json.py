#   =================================== Extract Data from XML files and create Markdown Reference Sheets.   =================================

#   =========
#   LIBRARIES
#   =========

import xmltodict                # To convert XML to dictionaries.
from tomark import Tomark       # To convert dictionaries to Markdown tables.

#   =============
#   READ XML FILE
#   =============

with open("Ref_Enumerations.xml") as xmlFile:
    xmlDict = xmltodict.parse(xmlFile.read())
xmlFile.close()

#   ======================
#   CREATE MARKDOWN TABLES
#   ======================

enumerationsMarkdown = "# Reference: Enumerations\n\n---\n\n"

for i in xmlDict["root"]["enumerations"]["enumeration"]:
    dictionaryList = []
    if isinstance(i["items"]["item"], list):
        for j in i["items"]["item"]:
            dictionaryList.append(j)
    else:
        dictionaryList.append(i["items"]["item"])
    
    enumerationsMarkdown += "## " + i["@name"] + "\n\n"
    markdownTable = Tomark.table(dictionaryList)
    enumerationsMarkdown += markdownTable + "\n"

#   ===================
#   WRITE MARKDOWN FILE
#   ===================

with open("Enumerations.md", "w") as markdownFile:
    markdownFile.write(enumerationsMarkdown)

#   ########################################################################################################################################