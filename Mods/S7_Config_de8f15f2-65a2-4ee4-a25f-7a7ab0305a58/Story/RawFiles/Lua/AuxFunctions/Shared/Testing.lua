--  ============
--  UNIT TESTING
--  ============

local Tag = {
    ['FAIL'] = "[FAIL]",
    ['PASS'] = "[PASS]"
}

---@class TestSpec @Test Specification
---@field fun function Function to test
---@field params any[] Array of paramaters
---@field expectation any[] Array of expected results
---@field description string Description of test

---@class TestSuite
---@field Name string TestSuite Name
---@field Results table TestSuite Name
TestSuite = {
    ['Name'] = "",
    ['Results'] = {},
}

Tests = {}

---Creates a new TestSuite
---@param object table
---@return TestSuite
function TestSuite:New(object)
    if not ValidInputTable(object, {'Name'}) then return end
    local object = object or {}
    object = Integrate(self, object)
    table.insert(Tests, object)
    return object
end

---Unit Test
---@param spec TestSpec
function TestSuite:It(spec)
    if not ValidInputTable(spec, {'fun', 'description'}) then return end
    local results = table.pack(
        xpcall(spec.fun, function(err)
            self.Results[spec.description .. "::`" .. err .. "`"] = Tag.FAIL
        end, table.unpack(spec.params)
        )
    )
    local status = table.remove(results, 1); results['n'] = nil
    if not IsEqual(results, spec.expectation) then status = false; self.Results[spec.description] = Tag.FAIL end
    if status then self.Results[spec.description] = Tag.PASS end
end

function ClearTestResults() Ext.SaveFile("S7TestResults.md", "") end
function ShowTestResults()
    local md = Ext.LoadFile('S7TestResults.md') or ""
    for idx, suite in ipairs(Tests) do
       local header = "# Test Results for Suite: " .. suite.Name .. "\n\n"
       local tableHeader = "|Result|Specification|\n|---|---|"
       local table = "" 
       for desc, success in pairs(suite.Results) do
            table = table .. "\n|`" .. success .. "`|" .. desc .. "|"
        end
        md = md ..header .. tableHeader .. table .. "\n"
    end
    Ext.SaveFile('S7TestResults.md', md)
end